import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'signup_view_model.g.dart';

class SignupViewModel = _SignupViewModel with _$SignupViewModel;

abstract class _SignupViewModel with Store {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @observable
  bool showPassword = false;

  @action
  void toggleShowPassword() => showPassword = !showPassword;

  @computed
  bool get isFormValid => emailController.text.contains('@') && passwordController.text.length > 6;
  void clearController() {
    emailController.clear();
    passwordController.clear();
    rePasswordController.clear();
  }
}
