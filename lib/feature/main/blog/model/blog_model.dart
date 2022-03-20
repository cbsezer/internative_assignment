import '../../../../product/model/base_model.dart';

class BlogModel extends BaseModel {
  List<Blog>? blogs;

  BlogModel({List<ValidationErrors>? validationErrors, bool? hasError, String? message, this.blogs})
      : super(validationErrors: validationErrors, hasError: hasError, message: message);

  BlogModel.fromJson(Map<String, dynamic> json) {
    validationErrors = List.generate(
        json['ValidationErrors']?.length ?? 0, (index) => ValidationErrors.fromJson(json['ValidationErrors'][index]));
    hasError = json['HasError'];
    message = json['Message'];
    blogs = List.generate(json['Data']?.length ?? 0, (index) => Blog.fromJson(json['Data'][index]));
  }
}

class Blog {
  String? title;
  String? content;
  String? image;
  String? categoryId;
  String? id;

  Blog({this.title, this.content, this.image, this.categoryId, this.id});

  Blog.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    content = json['Content'];
    image = json['Image'];
    categoryId = json['CategoryId'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> blog = <String, dynamic>{};
    blog['Title'] = title;
    blog['Content'] = content;
    blog['Image'] = image;
    blog['CategoryId'] = categoryId;
    blog['Id'] = id;
    return blog;
  }
}
