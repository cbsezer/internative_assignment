import 'package:flutter/material.dart';
import 'package:internative_assignment/core/constants/image_constants.dart';
import 'package:internative_assignment/core/constants/text_constants.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(child: Lottie.asset(ImageConstants.instance.splashGif)),
          Positioned.fill(
            bottom: context.lowValue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CircularProgressIndicator(),
                context.emptySizedWidthBoxLow,
                Text(
                  TextConstants.instance.loading,
                  style: context.textTheme.subtitle1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
