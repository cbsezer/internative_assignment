import 'base_model.dart';

class UserTokenModel extends BaseModel {
  String? token;

  UserTokenModel({List<ValidationErrors>? validationErrors, bool? hasError, String? message, this.token})
      : super(validationErrors: validationErrors, hasError: hasError, message: message);

  UserTokenModel.fromJson(Map<String, dynamic> json) {
    validationErrors = List.generate(
        json['ValidationErrors']?.length ?? 0, (index) => ValidationErrors.fromJson(json['ValidationErrors'][index]));
    hasError = json['HasError'];
    message = json['Message'];
    token = json['Data']['Token'];
  }
}
