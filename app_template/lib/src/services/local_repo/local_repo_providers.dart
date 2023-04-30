import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_template/src/services/hive/hive_providers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_repo/local_repo.dart';

final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());

final localRepoFutureProvider = FutureProvider<LocalRepo>((ref) async {
  final hive = ref.watch(hiveProvider);
  final secureStorage = ref.watch(secureStorageProvider);

  return initLocalRepo(hive, secureStorage: secureStorage);
}, dependencies: [
  hiveProvider,
  secureStorageProvider,
]);

final localRepoProvider = Provider<LocalRepo>(
  (_) => throw UnimplementedError(),
);

final localAuthenticationApiProvider = Provider<LocalAuthenticationApi>(
  (ref) {
    final localRepo = ref.watch(localRepoProvider);
    return localRepo.localAuthenticationApi;
  },
  dependencies: [localRepoProvider],
);

final preferencesApiProvider = Provider<PreferencesApi>(
  (ref) {
    final localRepo = ref.watch(localRepoProvider);
    return localRepo.preferencesApi;
  },
  dependencies: [localRepoProvider],
);
