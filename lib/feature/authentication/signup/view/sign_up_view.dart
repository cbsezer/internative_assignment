import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_assignment/feature/authentication/signup/model/signup_model.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/init/navigation/router.dart';
import '../../../../product/utils/padding/page_padding.dart';

import 'package:kartal/kartal.dart';

import '../../../../product/service/auth_service.dart';
import '../../../../product/widget/elevated_circular_button.dart';
import '../../../../product/widget/text_form_fields.dart';
import '../viewmodel/signup_view_model.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _viewModel = SignupViewModel();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.white, title: Text(TextConstants.instance.signUpPage), centerTitle: true),
      body: Padding(
        padding: const PagePadding.horizontalSymmetric(),
        child: Column(
          children: [
            context.emptySizedHeightBoxNormal,
            Image.asset(ImageConstants.instance.loginAsset),
            context.emptySizedHeightBoxNormal,
            Form(
              key: _formKey,
              child: Observer(builder: (_) {
                return Column(
                  children: [
                    emailTextField(context, controller: _viewModel.emailController),
                    context.emptySizedHeightBoxLow,
                    context.emptySizedHeightBoxLow,
                    passwordTextField(context,
                        text: TextConstants.instance.password,
                        controller: _viewModel.passwordController,
                        viewModel: _viewModel,
                        validate: null),
                    context.emptySizedHeightBoxLow,
                    context.emptySizedHeightBoxLow,
                    passwordTextField(context,
                        text: TextConstants.instance.rePassword,
                        controller: _viewModel.rePasswordController,
                        viewModel: _viewModel,
                        validate: (_viewModel.rePasswordController.text == _viewModel.passwordController.text
                            ? null
                            : TextConstants.instance.passwordAgainValidateError))
                  ],
                );
              }),
            ),
            context.emptySizedHeightBoxNormal,
            CustomElevatedButton(
                title: TextConstants.instance.register,
                isWhite: false,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await AuthService.instance.auth(
                        SignUpModel(
                                email: _viewModel.emailController.text,
                                password: _viewModel.passwordController.text,
                                passwordRetry: _viewModel.rePasswordController.text)
                            .toJson(),
                        context,
                        'Login/SignUp');
                  }
                }),
            context.emptySizedHeightBoxLow,
            context.emptySizedHeightBoxLow,
            CustomElevatedButton(
                isWhite: true,
                title: TextConstants.instance.login,
                onPressed: () async {
                  await context.router.navigate(const LoginRoute());
                }),
          ],
        ),
      ),
    );
  }
}
