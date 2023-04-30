import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_repo/src/api/authentication.dart';
import 'package:local_repo/src/api/preferences.dart';

class LocalRepo {
  LocalRepo({
    required this.localAuthenticationApi,
    required this.preferencesApi,
  });

  final LocalAuthenticationApi localAuthenticationApi;
  final PreferencesApi preferencesApi;
}

Future<LocalRepo> initLocalRepo(
  HiveInterface hive, {
  required FlutterSecureStorage secureStorage,
}) async {
  final localAuthenticationApi = await LocalAuthenticationApi.getApi(
    hive: hive,
    secureStorage: secureStorage,
  );

  final preferencesApi = await PreferencesApi.getApi(hive: hive);

  return LocalRepo(
    localAuthenticationApi: localAuthenticationApi,
    preferencesApi: preferencesApi,
  );
}
