// This is not tested because of freezed, we don't need to add a test for that
// coverage:ignore-file

import 'package:freezed_annotation/freezed_annotation.dart';

part './__generated__/login_status.freezed.dart';

@freezed
class LoginStatus with _$LoginStatus {
  const factory LoginStatus.isLoggedIn() = IsLoggedIn;
  const factory LoginStatus.isLoggingIn() = IsLoggingIn;
  const factory LoginStatus.isNotLoggedIn() = IsNotLoggedIn;
}
