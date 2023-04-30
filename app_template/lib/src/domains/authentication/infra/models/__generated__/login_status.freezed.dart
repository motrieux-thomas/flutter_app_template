// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, no_leading_underscores_for_local_identifiers

part of '../login_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStatusTearOff {
  const _$LoginStatusTearOff();

  IsLoggedIn isLoggedIn() {
    return const IsLoggedIn();
  }

  IsLoggingIn isLoggingIn() {
    return const IsLoggingIn();
  }

  IsNotLoggedIn isNotLoggedIn() {
    return const IsNotLoggedIn();
  }
}

/// @nodoc
const $LoginStatus = _$LoginStatusTearOff();

/// @nodoc
mixin _$LoginStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isLoggedIn,
    required TResult Function() isLoggingIn,
    required TResult Function() isNotLoggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? isLoggedIn,
    TResult Function()? isLoggingIn,
    TResult Function()? isNotLoggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isLoggedIn,
    TResult Function()? isLoggingIn,
    TResult Function()? isNotLoggedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsLoggedIn value) isLoggedIn,
    required TResult Function(IsLoggingIn value) isLoggingIn,
    required TResult Function(IsNotLoggedIn value) isNotLoggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsLoggedIn value)? isLoggedIn,
    TResult Function(IsLoggingIn value)? isLoggingIn,
    TResult Function(IsNotLoggedIn value)? isNotLoggedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsLoggedIn value)? isLoggedIn,
    TResult Function(IsLoggingIn value)? isLoggingIn,
    TResult Function(IsNotLoggedIn value)? isNotLoggedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStatusCopyWith<$Res> {
  factory $LoginStatusCopyWith(
          LoginStatus value, $Res Function(LoginStatus) then) =
      _$LoginStatusCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStatusCopyWithImpl<$Res> implements $LoginStatusCopyWith<$Res> {
  _$LoginStatusCopyWithImpl(this._value, this._then);

  final LoginStatus _value;
  // ignore: unused_field
  final $Res Function(LoginStatus) _then;
}

/// @nodoc
abstract class $IsLoggedInCopyWith<$Res> {
  factory $IsLoggedInCopyWith(
          IsLoggedIn value, $Res Function(IsLoggedIn) then) =
      _$IsLoggedInCopyWithImpl<$Res>;
}

/// @nodoc
class _$IsLoggedInCopyWithImpl<$Res> extends _$LoginStatusCopyWithImpl<$Res>
    implements $IsLoggedInCopyWith<$Res> {
  _$IsLoggedInCopyWithImpl(IsLoggedIn _value, $Res Function(IsLoggedIn) _then)
      : super(_value, (v) => _then(v as IsLoggedIn));

  @override
  IsLoggedIn get _value => super._value as IsLoggedIn;
}

/// @nodoc

class _$IsLoggedIn implements IsLoggedIn {
  const _$IsLoggedIn();

  @override
  String toString() {
    return 'LoginStatus.isLoggedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IsLoggedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isLoggedIn,
    required TResult Function() isLoggingIn,
    required TResult Function() isNotLoggedIn,
  }) {
    return isLoggedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? isLoggedIn,
    TResult Function()? isLoggingIn,
    TResult Function()? isNotLoggedIn,
  }) {
    return isLoggedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isLoggedIn,
    TResult Function()? isLoggingIn,
    TResult Function()? isNotLoggedIn,
    required TResult orElse(),
  }) {
    if (isLoggedIn != null) {
      return isLoggedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsLoggedIn value) isLoggedIn,
    required TResult Function(IsLoggingIn value) isLoggingIn,
    required TResult Function(IsNotLoggedIn value) isNotLoggedIn,
  }) {
    return isLoggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsLoggedIn value)? isLoggedIn,
    TResult Function(IsLoggingIn value)? isLoggingIn,
    TResult Function(IsNotLoggedIn value)? isNotLoggedIn,
  }) {
    return isLoggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsLoggedIn value)? isLoggedIn,
    TResult Function(IsLoggingIn value)? isLoggingIn,
    TResult Function(IsNotLoggedIn value)? isNotLoggedIn,
    required TResult orElse(),
  }) {
    if (isLoggedIn != null) {
      return isLoggedIn(this);
    }
    return orElse();
  }
}

abstract class IsLoggedIn implements LoginStatus {
  const factory IsLoggedIn() = _$IsLoggedIn;
}

/// @nodoc
abstract class $IsLoggingInCopyWith<$Res> {
  factory $IsLoggingInCopyWith(
          IsLoggingIn value, $Res Function(IsLoggingIn) then) =
      _$IsLoggingInCopyWithImpl<$Res>;
}

/// @nodoc
class _$IsLoggingInCopyWithImpl<$Res> extends _$LoginStatusCopyWithImpl<$Res>
    implements $IsLoggingInCopyWith<$Res> {
  _$IsLoggingInCopyWithImpl(
      IsLoggingIn _value, $Res Function(IsLoggingIn) _then)
      : super(_value, (v) => _then(v as IsLoggingIn));

  @override
  IsLoggingIn get _value => super._value as IsLoggingIn;
}

/// @nodoc

class _$IsLoggingIn implements IsLoggingIn {
  const _$IsLoggingIn();

  @override
  String toString() {
    return 'LoginStatus.isLoggingIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IsLoggingIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isLoggedIn,
    required TResult Function() isLoggingIn,
    required TResult Function() isNotLoggedIn,
  }) {
    return isLoggingIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? isLoggedIn,
    TResult Function()? isLoggingIn,
    TResult Function()? isNotLoggedIn,
  }) {
    return isLoggingIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isLoggedIn,
    TResult Function()? isLoggingIn,
    TResult Function()? isNotLoggedIn,
    required TResult orElse(),
  }) {
    if (isLoggingIn != null) {
      return isLoggingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsLoggedIn value) isLoggedIn,
    required TResult Function(IsLoggingIn value) isLoggingIn,
    required TResult Function(IsNotLoggedIn value) isNotLoggedIn,
  }) {
    return isLoggingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsLoggedIn value)? isLoggedIn,
    TResult Function(IsLoggingIn value)? isLoggingIn,
    TResult Function(IsNotLoggedIn value)? isNotLoggedIn,
  }) {
    return isLoggingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsLoggedIn value)? isLoggedIn,
    TResult Function(IsLoggingIn value)? isLoggingIn,
    TResult Function(IsNotLoggedIn value)? isNotLoggedIn,
    required TResult orElse(),
  }) {
    if (isLoggingIn != null) {
      return isLoggingIn(this);
    }
    return orElse();
  }
}

abstract class IsLoggingIn implements LoginStatus {
  const factory IsLoggingIn() = _$IsLoggingIn;
}

/// @nodoc
abstract class $IsNotLoggedInCopyWith<$Res> {
  factory $IsNotLoggedInCopyWith(
          IsNotLoggedIn value, $Res Function(IsNotLoggedIn) then) =
      _$IsNotLoggedInCopyWithImpl<$Res>;
}

/// @nodoc
class _$IsNotLoggedInCopyWithImpl<$Res> extends _$LoginStatusCopyWithImpl<$Res>
    implements $IsNotLoggedInCopyWith<$Res> {
  _$IsNotLoggedInCopyWithImpl(
      IsNotLoggedIn _value, $Res Function(IsNotLoggedIn) _then)
      : super(_value, (v) => _then(v as IsNotLoggedIn));

  @override
  IsNotLoggedIn get _value => super._value as IsNotLoggedIn;
}

/// @nodoc

class _$IsNotLoggedIn implements IsNotLoggedIn {
  const _$IsNotLoggedIn();

  @override
  String toString() {
    return 'LoginStatus.isNotLoggedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IsNotLoggedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() isLoggedIn,
    required TResult Function() isLoggingIn,
    required TResult Function() isNotLoggedIn,
  }) {
    return isNotLoggedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? isLoggedIn,
    TResult Function()? isLoggingIn,
    TResult Function()? isNotLoggedIn,
  }) {
    return isNotLoggedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? isLoggedIn,
    TResult Function()? isLoggingIn,
    TResult Function()? isNotLoggedIn,
    required TResult orElse(),
  }) {
    if (isNotLoggedIn != null) {
      return isNotLoggedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsLoggedIn value) isLoggedIn,
    required TResult Function(IsLoggingIn value) isLoggingIn,
    required TResult Function(IsNotLoggedIn value) isNotLoggedIn,
  }) {
    return isNotLoggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IsLoggedIn value)? isLoggedIn,
    TResult Function(IsLoggingIn value)? isLoggingIn,
    TResult Function(IsNotLoggedIn value)? isNotLoggedIn,
  }) {
    return isNotLoggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsLoggedIn value)? isLoggedIn,
    TResult Function(IsLoggingIn value)? isLoggingIn,
    TResult Function(IsNotLoggedIn value)? isNotLoggedIn,
    required TResult orElse(),
  }) {
    if (isNotLoggedIn != null) {
      return isNotLoggedIn(this);
    }
    return orElse();
  }
}

abstract class IsNotLoggedIn implements LoginStatus {
  const factory IsNotLoggedIn() = _$IsNotLoggedIn;
}
