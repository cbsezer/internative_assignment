import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/text_constants.dart';
import '../../../../product/utils/padding/page_padding.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TextConstants.instance.signUpPage), centerTitle: true),
      body: Padding(
        padding: const PagePadding.horizontalHighSymmetric(),
        child: ListView(children: [
          context.emptySizedHeightBoxLow3x,
          Form(
              child: Column(
            children: [
              passwordTextField(text: TextConstants.instance.password),
              passwordTextField(text: TextConstants.instance.rePassword),
            ],
          ))
        ]),
      ),
    );
  }

  Padding passwordTextField({required String text}) {
    return Padding(
      padding: const PagePadding.verticalLowSymmetric(),
      child: TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.mail),
          hintText: 'Pass',
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
