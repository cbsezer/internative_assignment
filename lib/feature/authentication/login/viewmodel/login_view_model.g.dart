// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModel, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginViewModel.isFormValid'))
          .value;

  final _$showPasswordAtom = Atom(name: '_LoginViewModel.showPassword');

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  final _$_LoginViewModelActionController =
      ActionController(name: '_LoginViewModel');

  @override
  void toggleShowPassword() {
    final _$actionInfo = _$_LoginViewModelActionController.startAction(
        name: '_LoginViewModel.toggleShowPassword');
    try {
      return super.toggleShowPassword();
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassword: ${showPassword},
isFormValid: ${isFormValid}
    ''';
  }
}
