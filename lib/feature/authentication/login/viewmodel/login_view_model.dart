import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../model/login_model.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> checkUserLoginRequest(LoginModel model) async {
    // final response = await _authenticationService.loginUserRequest(model);
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
  }
}
