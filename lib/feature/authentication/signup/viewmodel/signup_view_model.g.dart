// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupViewModel on _SignupViewModel, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignupViewModel.isFormValid'))
          .value;

  final _$showPasswordAtom = Atom(name: '_SignupViewModel.showPassword');

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

  final _$_SignupViewModelActionController =
      ActionController(name: '_SignupViewModel');

  @override
  void toggleShowPassword() {
    final _$actionInfo = _$_SignupViewModelActionController.startAction(
        name: '_SignupViewModel.toggleShowPassword');
    try {
      return super.toggleShowPassword();
    } finally {
      _$_SignupViewModelActionController.endAction(_$actionInfo);
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
