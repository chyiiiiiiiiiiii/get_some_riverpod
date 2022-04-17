import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_state.freezed.dart';

@freezed
abstract class NumberState with _$NumberState {
  ///Initial
  const factory NumberState.initial() = _NumberStateInitial;

  ///Loading
  const factory NumberState.loading() = _NumberStateLoading;

  ///Data
  const factory NumberState.data({required int number}) = _NumberStateData;

  ///Error
  const factory NumberState.error({required String msg}) = _NumberStateError;
}
