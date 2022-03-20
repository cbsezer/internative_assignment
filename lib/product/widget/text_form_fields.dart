import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/text_constants.dart';

TextFormField emailTextField(BuildContext context, {required controller}) {
  return TextFormField(
    validator: (value) => (value ?? '').isValidEmail ? null : TextConstants.instance.validateMailError,
    cursorColor: Theme.of(context).colorScheme.onSecondary,
    keyboardType: TextInputType.emailAddress,
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.mail),
      hintText: TextConstants.instance.email,
      contentPadding: const EdgeInsets.all(10),
    ),
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.deny(RegExp(r'\ ')),
    ],
  );
}

TextFormField passwordTextField(BuildContext context,
    {required String text, required controller, required viewModel, required String? validate}) {
  return TextFormField(
    validator: (value) => validate,
    cursorColor: Theme.of(context).colorScheme.onSecondary,
    controller: controller,
    keyboardType: TextInputType.visiblePassword,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.lock),
      hintText: text,
      contentPadding: const EdgeInsets.all(10),
      suffixIcon: IconButton(
        icon: Icon(
          viewModel.showPassword ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: () {
          viewModel.toggleShowPassword();
        },
      ),
    ),
    obscureText: viewModel.showPassword,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.deny(RegExp(r'\ ')),
    ],
  );
}
