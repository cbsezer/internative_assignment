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
/**
 * 
// import 'package:json_annotation/json_annotation.dart';

// part 'response_body_model.g.dart';

// @JsonSerializable()
// class BaseModelModel {
//   List<dynamic>? validationErrors;
//   bool? hasError;
//   String? message;
//   Data? data;

//   BaseModelModel({this.validationErrors, this.hasError, this.message, this.data});

//   BaseModelModel fromJson(Map<String, Object?> json) {
//     return _$BaseModelModelFromJson(json);
//   }
// }
 */