import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/init/navigation/router.dart';
import '../manager/cache/user_token_cache.dart';
import '../widget/toast_message.dart';

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
    var response = await dio.post(_url + path, options: Options(contentType: 'application/json'), data: model);
    try {
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
        CallMessage.callToastMessage(text: response.data['Message'], context: context);
      }
    }
  }
}
