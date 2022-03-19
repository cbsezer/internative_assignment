import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:internative_assignment/feature/authentication/splash/view/splash_view.dart';
import 'package:internative_assignment/feature/main/blog/view/home_view.dart';
import 'package:internative_assignment/feature/main/favorites/view/favorites_view.dart';
import 'package:internative_assignment/feature/main/profile/view/profile_view.dart';
import '../../../feature/authentication/login/view/login_view.dart';
import '../../../feature/authentication/signup/view/register_view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, initial: true),
    AutoRoute(page: SignUpView),
    AutoRoute(page: LoginView),
    AutoRoute(page: HomeView),
    AutoRoute(page: FavoritesView),
    AutoRoute(page: ProfileView),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
