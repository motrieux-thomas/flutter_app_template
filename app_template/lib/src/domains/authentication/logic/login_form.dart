// form instantiation
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum LoginFormKeys {
  email,
  password,
}

FormGroup buildLoginForm(String? emailValue) {
  return fb.group(
    <String, Object>{
      LoginFormKeys.email.name: FormControl<String>(
        value: emailValue,
        validators: [Validators.required, Validators.email],
      ),
      LoginFormKeys.password.name: FormControl<String>(
        validators: [Validators.required],
      ),
    },
  );
}

validationMessageFromContext(BuildContext context) {
  final translations = AppLocalizations.of(context)!;
  return {
    'email': (_) => translations.formValidationEmailLabel,
    'required': (_) => translations.formValidationRequiredLabel,
  };
}

final isLoginFormLoading = StateProvider((ref) => false);
