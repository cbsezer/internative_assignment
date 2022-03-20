import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internative_assignment/core/init/navigation/router.dart';
import 'package:internative_assignment/feature/main/bottom_bar/bottom_bar_view.dart';
import 'package:internative_assignment/product/manager/cache/user_token_cache.dart';
import 'package:internative_assignment/product/widget/toast_message.dart';
import '../../feature/authentication/login/model/login_model.dart';
import '../../feature/authentication/signup/model/signup_model.dart';
import '../model/user_token_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._init();

  final String contentType = 'application/json';
  static AuthService get instance => _instance;
  Map<String, String> jsonL = {};

  AuthService._init();

  var dio = Dio();
  final _url = 'http://test20.internative.net/';

  Future auth(Map<String, dynamic> model, BuildContext context, String path) async {
    try {
      var response = await dio.post(_url + path, options: Options(contentType: 'application/json'), data: model);
      var responseModel = UserTokenModel.fromJson(response.data);
      if (response.statusCode == 200 && !(responseModel.hasError ?? false)) {
        if (responseModel.token != null) {
          UserCacheService().saveUserToken(responseModel.token!);
          context.router.navigate(const TabBlogRoute());
        } else {
          CallMessage.callToastMessage(text: responseModel.message ?? 'Hata', context: context);
        }
      }
    } catch (e) {
      if (e is DioError) {
        CallMessage.callToastMessage(text: 'Hata', context: context);
      } else {
        CallMessage.callToastMessage(text: e.toString(), context: context);
      }
    }
  }
}
