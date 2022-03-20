import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:internative_assignment/product/utils/size/widget_size.dart';

class CallMessage {
  static void callToastMessage({required String text, context}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        textColor: Theme.of(context).colorScheme.onPrimary,
        fontSize: WidgetSizes.spacingM);
  }
}