import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:internative_assignment/core/init/navigation/router.dart';
import 'package:internative_assignment/product/manager/cache/user_token_cache.dart';
import 'package:mobx/mobx.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  BuildContext? context;
  void setContext(BuildContext context) => this.context = context;

  void init() {
    navigateToWhere();
  }

  Future<void> navigateToWhere() async {
    if (await UserCacheService().getUserToken() != null) {
      context?.router.navigate(const HomeRoute());
    } else {
      context?.router.navigate(const LoginRoute());
    }
  }
}
