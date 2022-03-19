import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/text_constants.dart';

TextFormField emailTextField(BuildContext context, {required controller}) {
  return TextFormField(
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.mail),
      hintText: TextConstants.instance.email,
      contentPadding: const EdgeInsets.all(10),
    ),
    obscureText: true,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.deny(RegExp(r'\ ')),
    ],
  );
}

TextFormField passwordTextField(BuildContext context, {required String text, required controller}) {
  return TextFormField(
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.lock),
      hintText: text,
      contentPadding: const EdgeInsets.all(10),
      suffixIcon: IconButton(
        icon: const Icon(
          // Based on passwordVisible state choose the icon
          true ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: () {},
      ),
    ),
    obscureText: true,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.deny(RegExp(r'\ ')),
    ],
  );
}
