import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/authentication/login/view/login_view.dart';
import '../../../feature/authentication/signup/view/sign_up_view.dart';
import '../../../feature/authentication/splash/view/splash_view.dart';
import '../../../feature/main/blog/view/home_view.dart';
import '../../../feature/main/bottom_bar/bottom_bar_view.dart';
import '../../../feature/main/favorites/view/favorites_view.dart';
import '../../../feature/main/profile/view/profile_view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, initial: true),
    AutoRoute(page: SignUpView),
    AutoRoute(page: LoginView),
    AutoRoute(page: TabBlogView),
    AutoRoute(page: HomeView),
    AutoRoute(page: FavoritesView),
    AutoRoute(page: ProfileView),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
