import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_repo/src/utils/encryption.dart';

class LocalAuthenticationApi {
  static const _localAuthenticationApikey = "LocalAuthenticationApi";

  LocalAuthenticationApi._(this.box);

  static Future<LocalAuthenticationApi> getApi({
    required HiveInterface hive,
    required FlutterSecureStorage secureStorage,
  }) async {
    final encryptionKey = await getEncryptionKey(
      hive,
      secureStorage: secureStorage,
    );

    final credentialsBoxName = 'credentials';

    final credentialsBox = await hive.openBox<String>(
      credentialsBoxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );

    return LocalAuthenticationApi._(credentialsBox);
  }

  final Box<String> box;

  static const _rawTokenKey = '${_localAuthenticationApikey}_rawToken';

  String? getRawToken() {
    return box.get(_rawTokenKey);
  }

  Future<void> putRawToken(String rawToken) {
    return box.put(_rawTokenKey, rawToken);
  }

  Future<void> deleteRawToken() {
    return box.delete(_rawTokenKey);
  }

  static const _emailKey = '${_localAuthenticationApikey}_email';

  String? getEmail() {
    return box.get(_emailKey);
  }

  Future<void> putEmail(String email) {
    return box.put(_emailKey, email);
  }

  Future<void> deleteEmail() {
    return box.delete(_emailKey);
  }
}
