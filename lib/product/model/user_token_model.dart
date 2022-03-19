import 'package:internative_assignment/product/model/base_model.dart';

class UserTokenModel extends BaseModel {
  String? token;

  UserTokenModel({List<dynamic>? validationErrors, bool? hasError, String? message, this.token})
      : super(validationErrors: validationErrors, hasError: hasError, message: message);

  UserTokenModel.fromJson(Map<String, dynamic> json) {
    validationErrors = json['ValidationErrors'];
    hasError = json['HasError'];
    message = json['Message'];
    token = json['Data']['Token'];
  }
}
