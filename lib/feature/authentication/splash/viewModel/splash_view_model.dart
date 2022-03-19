import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store{
  @override
  // void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    // await Future.delayed(context.durationSlow);
    // context.read<NavigationService>().navigateToPageClear(path: NavigationEnums.login.rawValue);
  }
}
