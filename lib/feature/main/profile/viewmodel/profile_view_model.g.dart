// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModel, Store {
  final _$currentPositionAtom = Atom(name: '_ProfileViewModel.currentPosition');

  @override
  Position get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$determinePositionAsyncAction =
      AsyncAction('_ProfileViewModel.determinePosition');

  @override
  Future determinePosition() {
    return _$determinePositionAsyncAction.run(() => super.determinePosition());
  }

  @override
  String toString() {
    return '''
currentPosition: ${currentPosition}
    ''';
  }
}
