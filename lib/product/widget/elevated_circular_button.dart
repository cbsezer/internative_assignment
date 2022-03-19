import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../utils/radius/general_radius.dart';
import '../utils/size/widget_size.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton(
      {Key? key, required this.title, required this.onPressed, this.buttonWidth, this.icon, required this.isWhite})
      : super(key: key);
  final String title;
  final Future<void> Function() onPressed;
  final double? buttonWidth;
  final IconData? icon;
  final bool isWhite;
  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool _isLoading = false;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _completeProcess() async {
    _changeLoading();
    await widget.onPressed();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.buttonWidth ?? context.width,
        height: 50,
        child: ElevatedButton.icon(
            style: widget.isWhite
                ? ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: const Color(0xff292f3b),
                    alignment: Alignment.centerLeft,
                    shape: RoundedRectangleBorder(
                        borderRadius: const GeneralRadius.allNormal(),
                        side: BorderSide(color: Theme.of(context).colorScheme.onSecondary)),
                  )
                : Theme.of(context).elevatedButtonTheme.style,
            onPressed: _isLoading ? null : _completeProcess,
            icon: Icon(widget.icon ?? FontAwesomeIcons.signInAlt, size: WidgetSizes.spacingML),
            label: Center(
                child: Text(widget.title,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: widget.isWhite
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.onPrimary)))));
  }
}
