// coverage:ignore-file
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class AppLocalizationException implements Exception {
  String getDescription(AppLocalizations locales) => throw UnimplementedError();
}
