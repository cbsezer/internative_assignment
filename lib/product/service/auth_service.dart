import 'package:dio/dio.dart';
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

  Future<UserTokenModel> login(LoginModel model) async {
    var response = await dio.post('${_url}Login/SignIn', data: model);
    var responseModel = UserTokenModel.fromJson(response.data);
    return responseModel;
  }

  Future<UserTokenModel> signUp(SignUpModel model) async {
    var response = await dio.post('${_url}Login/SignUp', data: model);
    var responseModel = UserTokenModel.fromJson(response.data);
    return responseModel;
  }
}
