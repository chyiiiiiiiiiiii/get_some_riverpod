// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'number_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NumberStateTearOff {
  const _$NumberStateTearOff();

  _NumberStateInitial initial() {
    return const _NumberStateInitial();
  }

  _NumberStateLoading loading() {
    return const _NumberStateLoading();
  }

  _NumberStateData data({required int number}) {
    return _NumberStateData(
      number: number,
    );
  }

  _NumberStateError error({required String msg}) {
    return _NumberStateError(
      msg: msg,
    );
  }
}

/// @nodoc
const $NumberState = _$NumberStateTearOff();

/// @nodoc
mixin _$NumberState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int number) data,
    required TResult Function(String msg) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumberStateInitial value) initial,
    required TResult Function(_NumberStateLoading value) loading,
    required TResult Function(_NumberStateData value) data,
    required TResult Function(_NumberStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberStateCopyWith<$Res> {
  factory $NumberStateCopyWith(
          NumberState value, $Res Function(NumberState) then) =
      _$NumberStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NumberStateCopyWithImpl<$Res> implements $NumberStateCopyWith<$Res> {
  _$NumberStateCopyWithImpl(this._value, this._then);

  final NumberState _value;
  // ignore: unused_field
  final $Res Function(NumberState) _then;
}

/// @nodoc
abstract class _$NumberStateInitialCopyWith<$Res> {
  factory _$NumberStateInitialCopyWith(
          _NumberStateInitial value, $Res Function(_NumberStateInitial) then) =
      __$NumberStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$NumberStateInitialCopyWithImpl<$Res>
    extends _$NumberStateCopyWithImpl<$Res>
    implements _$NumberStateInitialCopyWith<$Res> {
  __$NumberStateInitialCopyWithImpl(
      _NumberStateInitial _value, $Res Function(_NumberStateInitial) _then)
      : super(_value, (v) => _then(v as _NumberStateInitial));

  @override
  _NumberStateInitial get _value => super._value as _NumberStateInitial;
}

/// @nodoc

class _$_NumberStateInitial implements _NumberStateInitial {
  const _$_NumberStateInitial();

  @override
  String toString() {
    return 'NumberState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NumberStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int number) data,
    required TResult Function(String msg) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumberStateInitial value) initial,
    required TResult Function(_NumberStateLoading value) loading,
    required TResult Function(_NumberStateData value) data,
    required TResult Function(_NumberStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _NumberStateInitial implements NumberState {
  const factory _NumberStateInitial() = _$_NumberStateInitial;
}

/// @nodoc
abstract class _$NumberStateLoadingCopyWith<$Res> {
  factory _$NumberStateLoadingCopyWith(
          _NumberStateLoading value, $Res Function(_NumberStateLoading) then) =
      __$NumberStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$NumberStateLoadingCopyWithImpl<$Res>
    extends _$NumberStateCopyWithImpl<$Res>
    implements _$NumberStateLoadingCopyWith<$Res> {
  __$NumberStateLoadingCopyWithImpl(
      _NumberStateLoading _value, $Res Function(_NumberStateLoading) _then)
      : super(_value, (v) => _then(v as _NumberStateLoading));

  @override
  _NumberStateLoading get _value => super._value as _NumberStateLoading;
}

/// @nodoc

class _$_NumberStateLoading implements _NumberStateLoading {
  const _$_NumberStateLoading();

  @override
  String toString() {
    return 'NumberState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NumberStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int number) data,
    required TResult Function(String msg) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumberStateInitial value) initial,
    required TResult Function(_NumberStateLoading value) loading,
    required TResult Function(_NumberStateData value) data,
    required TResult Function(_NumberStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _NumberStateLoading implements NumberState {
  const factory _NumberStateLoading() = _$_NumberStateLoading;
}

/// @nodoc
abstract class _$NumberStateDataCopyWith<$Res> {
  factory _$NumberStateDataCopyWith(
          _NumberStateData value, $Res Function(_NumberStateData) then) =
      __$NumberStateDataCopyWithImpl<$Res>;
  $Res call({int number});
}

/// @nodoc
class __$NumberStateDataCopyWithImpl<$Res>
    extends _$NumberStateCopyWithImpl<$Res>
    implements _$NumberStateDataCopyWith<$Res> {
  __$NumberStateDataCopyWithImpl(
      _NumberStateData _value, $Res Function(_NumberStateData) _then)
      : super(_value, (v) => _then(v as _NumberStateData));

  @override
  _NumberStateData get _value => super._value as _NumberStateData;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(_NumberStateData(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NumberStateData implements _NumberStateData {
  const _$_NumberStateData({required this.number});

  @override
  final int number;

  @override
  String toString() {
    return 'NumberState.data(number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NumberStateData &&
            const DeepCollectionEquality().equals(other.number, number));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(number));

  @JsonKey(ignore: true)
  @override
  _$NumberStateDataCopyWith<_NumberStateData> get copyWith =>
      __$NumberStateDataCopyWithImpl<_NumberStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int number) data,
    required TResult Function(String msg) error,
  }) {
    return data(number);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
  }) {
    return data?.call(number);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(number);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumberStateInitial value) initial,
    required TResult Function(_NumberStateLoading value) loading,
    required TResult Function(_NumberStateData value) data,
    required TResult Function(_NumberStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _NumberStateData implements NumberState {
  const factory _NumberStateData({required int number}) = _$_NumberStateData;

  int get number;
  @JsonKey(ignore: true)
  _$NumberStateDataCopyWith<_NumberStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NumberStateErrorCopyWith<$Res> {
  factory _$NumberStateErrorCopyWith(
          _NumberStateError value, $Res Function(_NumberStateError) then) =
      __$NumberStateErrorCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class __$NumberStateErrorCopyWithImpl<$Res>
    extends _$NumberStateCopyWithImpl<$Res>
    implements _$NumberStateErrorCopyWith<$Res> {
  __$NumberStateErrorCopyWithImpl(
      _NumberStateError _value, $Res Function(_NumberStateError) _then)
      : super(_value, (v) => _then(v as _NumberStateError));

  @override
  _NumberStateError get _value => super._value as _NumberStateError;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(_NumberStateError(
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NumberStateError implements _NumberStateError {
  const _$_NumberStateError({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'NumberState.error(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NumberStateError &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  _$NumberStateErrorCopyWith<_NumberStateError> get copyWith =>
      __$NumberStateErrorCopyWithImpl<_NumberStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(int number) data,
    required TResult Function(String msg) error,
  }) {
    return error(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
  }) {
    return error?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(int number)? data,
    TResult Function(String msg)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NumberStateInitial value) initial,
    required TResult Function(_NumberStateLoading value) loading,
    required TResult Function(_NumberStateData value) data,
    required TResult Function(_NumberStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NumberStateInitial value)? initial,
    TResult Function(_NumberStateLoading value)? loading,
    TResult Function(_NumberStateData value)? data,
    TResult Function(_NumberStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _NumberStateError implements NumberState {
  const factory _NumberStateError({required String msg}) = _$_NumberStateError;

  String get msg;
  @JsonKey(ignore: true)
  _$NumberStateErrorCopyWith<_NumberStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
