import 'package:dio/dio.dart';

import '../../../core/enums/dio_request_enum.dart';
import '../cache/user_token_cache.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();

  final String contentType = 'application/json';
  static NetworkManager get instance => _instance;
  String status = '';
  Map<String, String> jsonL = {};

  NetworkManager._init();

  Future<Response> dioRequest({Map<String, dynamic>? queryJson, required String path, required String method}) async {
    var dio = Dio(BaseOptions(connectTimeout: 30000, receiveTimeout: 30000, sendTimeout: 30000));
    var headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${await UserCacheService().getUserToken()}'
    };

    print(headers);

    var _url = 'http://test20.internative.net/';
    var _uri = _url + path;
    if (method == DioRequestTypes.GET.name) {
      return await dio.get(_uri, options: Options(headers: headers));
    } else {
      return await dio.post(_uri, options: Options(headers: headers), data: queryJson);
    }
  }
}
