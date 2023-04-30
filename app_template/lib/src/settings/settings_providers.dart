import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/services/local_repo/local_repo_providers.dart';
import 'package:app_template/src/settings/settings_controller.dart';
import 'package:app_template/src/settings/settings_service.dart';

final settingsControllerProvider = ChangeNotifierProvider<SettingsController>(
  (ref) {
    final preferencesApi = ref.watch(preferencesApiProvider);
    return SettingsController(SettingsService(preferencesApi));
  },
  dependencies: [preferencesApiProvider],
);
