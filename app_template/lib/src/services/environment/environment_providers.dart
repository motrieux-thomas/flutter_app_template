import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/config/environment_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

final envProvider = Provider<Environment>((ref) => Environment.prod);

final versionProvider = FutureProvider<String>((ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return "${packageInfo.version} (${packageInfo.buildNumber})";
});

final appIdProvider = FutureProvider<String>((ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.packageName;
});
