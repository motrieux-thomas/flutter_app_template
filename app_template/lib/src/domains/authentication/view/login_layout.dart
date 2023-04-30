import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/config/feature_toggle.dart';
import 'package:app_template/src/domains/authentication/logic/authentication_providers.dart';
import 'package:app_template/src/domains/authentication/logic/login_form.dart';
import 'package:app_template/src/utils/snackbar.dart';
import 'package:template_theme/template_theme.dart';
import 'package:template_theme/theme/layout/scrollable_flex_column.dart';

import 'package:reactive_forms/reactive_forms.dart';
import 'package:stateful/stateful.dart';

class LoginLayout extends ConsumerWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final viewPadding = mediaQuery.viewPadding;

    final lastUsedEmail = ref.watch(lastUsedEmailProvider);

    final isPasswordHide = ref.watch(isPasswordHideProvider);
    final passwordSuffixIcon = IconButton(
      onPressed: () {
        ref.read(isPasswordHideProvider.notifier).update((state) => !state);
      },
      icon: AppIcon(isPasswordHide ? Icons.visibility : Icons.visibility_off),
      color: Theme.of(context).colors.textPrimary,
    );

    final inputDecoration = InputDecoration(
      labelText: translations.password,
      contentPadding: EdgeInsets.only(left: theme.insets.s.left),
      labelStyle: theme.texts.titleSmall!.copyWith(
        color: theme.colors.textSecondary,
        fontWeight: FontWeight.w400,
      ),
    );

    return Initializer(
      initialize: (_) {
        ref.invalidate(isLoginFormLoading);
        final hasRememberEmailBefore = lastUsedEmail != null;
        final notifier = ref.read(rememberEmailStateProvider.notifier);
        notifier.state = hasRememberEmailBefore;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: ReactiveFormBuilder(
          form: () => buildLoginForm(lastUsedEmail),
          builder: (context, form, _) {
            onSubmitForm() async {
              await showSnackBarOnError(
                context,
                () async {
                  ref.read(isLoginFormLoading.notifier).state = true;
                  final value = form.value;
                  final email = value[LoginFormKeys.email.name];
                  final password = value[LoginFormKeys.password.name];
                  if (email is String && password is String) {
                    final notifier = ref.read(loginNotifierProvider.notifier);
                    await notifier.login(email, password);
                    // TODO: ⚠️ Remove this line when the authentication will be implemented.
                    ref.watch(overrideIsloggedInProvider.notifier).state = true;
                  }
                },
                onError: () async => ref.invalidate(isLoginFormLoading),
              )();
            }

            return AutofillGroup(
              child: Padding(
                padding: theme.insets.l.horizontalOnly,
                child: ScrollableFlexColumn(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(flex: 3),
                    SizedBox(height: viewPadding.top + kTabBarHeight),
                    FlutterLogo(size: theme.sizes.xl),
                    const Spacer(flex: 1),
                    const AppGap.big(),
                    ReactiveTextField<String>(
                      key: const Key('email_field'),
                      style: theme.texts.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      formControlName: LoginFormKeys.email.name,
                      decoration: inputDecoration,
                      cursorColor: theme.colors.textPrimary,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      validationMessages: validationMessageFromContext(context),
                    ),
                    const AppGap.big(),
                    ReactiveTextField<String>(
                      key: const Key('password_field'),
                      style: theme.texts.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      formControlName: LoginFormKeys.password.name,
                      decoration: inputDecoration.copyWith(
                        suffixIcon: passwordSuffixIcon,
                      ),
                      cursorColor: theme.colors.textPrimary,
                      obscureText: ref.watch(isPasswordHideProvider),
                      keyboardType: TextInputType.text,
                      autofillHints: const [AutofillHints.password],
                      validationMessages: validationMessageFromContext(context),
                    ),
                    const AppGap.big(),
                    _LoginFormButton(onPressed: onSubmitForm),
                    const AppGap.small(),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: _RememberMeButton(),
                    ),
                    const Spacer(flex: 6),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RememberMeButton extends ConsumerWidget {
  const _RememberMeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final rememberEmail = ref.watch(rememberEmailStateProvider);

    return AppTap(
      fit: BoxFit.contain,
      onTap: () {
        ref.read(rememberEmailStateProvider.notifier).state = !rememberEmail;
      },
      child: Padding(
        padding: theme.insets.s,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: theme.sizes.s,
              width: theme.sizes.s,
              child: Checkbox(
                value: rememberEmail,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(theme.radius.small),
                ),
                checkColor: Theme.of(context).colors.textPrimary,
                onChanged: null,
              ),
            ),
            const AppGap.small(),
            AppText.p2(
              translations.rememberMe,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginFormButton extends ConsumerWidget {
  const _LoginFormButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formControl = ReactiveForm.of(context)!;
    final isLoading = ref.watch(isLoginFormLoading);
    final translations = AppLocalizations.of(context)!;

    return AppButton.primary(
      onPressed: formControl.valid ? onPressed : null,
      label: translations.login,
      isLoading: isLoading,
      isExpanded: true,
    );
  }
}
