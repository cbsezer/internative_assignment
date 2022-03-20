import '../../../../product/model/base_model.dart';

class CategoryModel extends BaseModel {
  List<Categories>? categories;

  CategoryModel({List<ValidationErrors>? validationErrors, bool? hasError, String? message, this.categories})
      : super(validationErrors: validationErrors, hasError: hasError, message: message);

  CategoryModel.fromJson(Map<String, dynamic> json) {
    validationErrors = List.generate(
        json['ValidationErrors']?.length ?? 0, (index) => ValidationErrors.fromJson(json['ValidationErrors'][index]));
    hasError = json['HasError'];
    message = json['Message'];
    categories = List.generate(json['Data']?.length ?? 0, (index) => Categories.fromJson(json['Data'][index]));
  }
}

class Categories {
  String? title;
  String? image;
  String? id;

  Categories({this.title, this.image, this.id});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    image = json['Image'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> categories = <String, dynamic>{};
    categories['Title'] = title;
    categories['Image'] = image;
    categories['Id'] = id;
    return categories;
  }
}
