import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/init/navigation/router.dart';
import '../../../../product/manager/cache/user_token_cache.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  BuildContext? context;
  void setContext(BuildContext context) => this.context = context;

  void init() {
    navigateToWhere();
  }

  Future<void> navigateToWhere() async {
    print(await UserCacheService().getUserToken());
    if (await UserCacheService().getUserToken() != null) {
      context?.router.navigate(const TabBlogRoute());
    } else {
      context?.router.navigate(const LoginRoute());
    }
  }
}
