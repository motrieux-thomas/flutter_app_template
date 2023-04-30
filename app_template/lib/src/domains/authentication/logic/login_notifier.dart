import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/config/feature_toggle.dart';
import 'package:app_template/src/domains/authentication/logic/authentication_providers.dart';
import 'package:app_template/src/services/local_repo/local_repo_providers.dart';

class NoLoginDataException implements Exception {}

class LoginNotifier extends Notifier {
  LoginNotifier();

  Future<void> login(String email, String password) async {
    // Remember the email.
    if (ref.read(rememberEmailStateProvider)) {
      final localAuthenticationApi = ref.read(localAuthenticationApiProvider);
      await localAuthenticationApi.putEmail(email);
    } else {
      await ref.read(localAuthenticationApiProvider).deleteEmail();
    }

    // Store the token in local storage.
    await ref.read(localAuthenticationApiProvider).putRawToken('token');

    // TODO: ⚠️ Remove this line when the authentication will be implemented.
    // Refresh the user.
    // ref.invalidate(userProvider);
    // await ref.read(userProvider.future);
    return;
  }

  Future<void> logout() async {
    // TODO: ⚠️ Remove this line when the authentication will be implemented.
    ref.watch(overrideIsloggedInProvider.notifier).state = false;

    await Future.wait(
      [ref.read(localAuthenticationApiProvider).deleteRawToken()],
    );

    ref.invalidate(userProvider);
  }

  @override
  build() => null;
}
