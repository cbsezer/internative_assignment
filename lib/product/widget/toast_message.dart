import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/size/widget_size.dart';

class CallMessage {
  static void callToastMessage({required String text, required BuildContext context}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        textColor: Theme.of(context).colorScheme.onPrimary,
        fontSize: WidgetSizes.spacingM);
  }
}
