import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/config/environment_service.dart';
import 'package:app_template/src/services/environment/environment_providers.dart';

final isCheatCodeEnabledProvider = Provider<bool>((ref) {
  return ref.read(envProvider) == Environment.dev;
}, dependencies: [
  envProvider,
]);

final isEventLoggerEnabledProvider = Provider<bool>((ref) => false);

final overrideIsloggedInProvider = StateProvider<bool>((ref) => false);
