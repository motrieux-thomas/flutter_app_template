// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:template_theme/config/environment_service.dart';

// We differenciate the CI and local file.
const _env = EnvironmentService.appCompilationEnv;

// We use a linux machine on the CI to run the tests.
// But there can be differences in the goldens with a mac machine for example.
// So we use this method to match a golden file.
matchesGoldenFileWithRules(Object filename, {int? version}) {
  return matchesGoldenFile(
    "preview/$_env/$filename",
    version: version,
  );
}
