abstract class BaseModel {
  List<dynamic>? validationErrors;
  bool? hasError;
  String? message;

  BaseModel({this.validationErrors, this.hasError, this.message});
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