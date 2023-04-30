import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/config/feature_toggle.dart';
import 'package:app_template/src/domains/authentication/infra/models/login_status.dart';
import 'package:app_template/src/domains/authentication/logic/login_notifier.dart';
import 'package:app_template/src/services/error_logger/error_logger_providers.dart';
import 'package:app_template/src/services/local_repo/local_repo_providers.dart';

final loginNotifierProvider = NotifierProvider(
  () => LoginNotifier(),
  dependencies: [
    localAuthenticationApiProvider,
    userProvider,
    errorLoggerProvider,
    rememberEmailStateProvider,
    overrideIsloggedInProvider,
  ],
);

final userProvider = FutureProvider<void>((ref) => throw UnimplementedError());

final isUserLoggedInProvider = Provider<bool>(
  (ref) => throw UnimplementedError(),
);

final isUserLoggedInProviderAsync = Provider<LoginStatus>(
  (ref) {
    final localAuthenticationApi = ref.watch(localAuthenticationApiProvider);
    final rawToken = localAuthenticationApi.getRawToken();
    final userAsync = ref.watch(userProvider);

    return userAsync.map(
      data: (data) {
        if (data.isRefreshing) return const LoginStatus.isLoggingIn();
        if (rawToken != null) return const LoginStatus.isLoggedIn();
        return const LoginStatus.isNotLoggedIn();
      },
      error: (_) {
        return const LoginStatus.isNotLoggedIn();
      },
      loading: (_) => const LoginStatus.isLoggingIn(),
    );
  },
  dependencies: [
    userProvider,
    localAuthenticationApiProvider,
  ],
);

final lastUsedEmailProvider = Provider.autoDispose<String?>(
  (ref) {
    final localAuthenticationApi = ref.watch(localAuthenticationApiProvider);
    return localAuthenticationApi.getEmail();
  },
  dependencies: [localAuthenticationApiProvider],
);

final rememberEmailStateProvider = StateProvider.autoDispose((ref) => false);
final isPasswordHideProvider = StateProvider.autoDispose<bool>((ref) => true);
