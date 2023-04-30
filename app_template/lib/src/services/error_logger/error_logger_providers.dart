import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/services/error_logger/error_logger_service.dart';

const kerrorLogger = ErrorLoggerService();

final errorLoggerProvider = Provider((ref) {
  return ErrorLoggerService(ref: ref);
});
