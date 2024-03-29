import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/image_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/init/navigation/router.dart';
import '../../../../product/service/auth_service.dart';
import '../../../../product/utils/padding/page_padding.dart';
import '../../../../product/widget/elevated_circular_button.dart';
import '../../../../product/widget/text_form_fields.dart';
import '../model/login_model.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

//  Future<LatLng> takeLatLong()async {
//     var position = await _determinePosition();
//     return LatLng(position.latitude, position.longitude);
//   }
//     takeData() async{
//      return await takeLatLong();
//    }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _viewModel = LoginViewModel();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.white, title: Text(TextConstants.instance.login), centerTitle: true),
      body: Padding(
        padding: const PagePadding.horizontalSymmetric(),
        child: Column(
          children: [
            context.emptySizedHeightBoxNormal,
            Image.asset(ImageConstants.instance.loginAsset),
            context.emptySizedHeightBoxNormal,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  emailTextField(context, controller: _viewModel.emailController),
                  context.emptySizedHeightBoxLow,
                  context.emptySizedHeightBoxLow,
                  Observer(builder: (_) {
                    return passwordTextField(context,
                        text: TextConstants.instance.password,
                        controller: _viewModel.passwordController,
                        viewModel: _viewModel,
                        validate: null);
                  })
                ],
              ),
            ),
            context.emptySizedHeightBoxNormal,
            CustomElevatedButton(
                title: TextConstants.instance.login,
                isWhite: false,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await AuthService.instance.auth(
                        LoginModel(email: _viewModel.emailController.text, password: _viewModel.passwordController.text)
                            .toJson(),
                        context,
                        'Login/SignIn');
                    _viewModel.clearController();
                  }
                }),
            context.emptySizedHeightBoxLow,
            context.emptySizedHeightBoxLow,
            CustomElevatedButton(
                isWhite: true,
                title: TextConstants.instance.register,
                onPressed: () async {
                  await context.router.navigate(const SignUpRoute());
                }),
          ],
        ),
      ),
    );
  }
}
