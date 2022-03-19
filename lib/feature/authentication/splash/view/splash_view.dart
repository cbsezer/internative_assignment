import 'package:flutter/material.dart';
import 'package:internative_assignment/core/constants/image_constants.dart';

import 'package:lottie/lottie.dart';

import '../viewModel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);
  final _viewmodel = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    if (_viewmodel.context == null) {
      _viewmodel.setContext(context);
      _viewmodel.init();
    }
    return Scaffold(
      body: Center(child: Lottie.asset(ImageConstants.instance.splashGif)),
    );
  }
}
