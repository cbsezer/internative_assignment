import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../feature/authentication/login/view/login_view.dart';
import '../../../feature/authentication/signup/view/register_view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignUpView, initial: true),
    AutoRoute(page: LoginView)

  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
