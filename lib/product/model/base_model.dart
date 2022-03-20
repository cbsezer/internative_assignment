abstract class BaseModel {
  List<ValidationErrors>? validationErrors;
  bool? hasError;
  String? message;

  BaseModel({this.validationErrors, this.hasError, this.message});
}

class ValidationErrors {
  String? key;
  String? value;

  ValidationErrors({this.key, this.value});

  ValidationErrors.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    value = json['Value'];
  }
}
