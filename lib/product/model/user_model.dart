import 'base_model.dart';

class UserModel extends BaseModel {
  User? user;

  UserModel({List<ValidationErrors>? validationErrors, bool? hasError, String? message, this.user})
      : super(validationErrors: validationErrors, hasError: hasError, message: message);

  UserModel.fromJson(Map<String, dynamic> json) {
    validationErrors = List.generate(
        json['ValidationErrors']?.length ?? 0, (index) => ValidationErrors.fromJson(json['ValidationErrors'][index]));
    hasError = json['HasError'];
    message = json['Message'];
    user = User.fromJson(json['Data']);
  }
}

class User {
  String? id;
  String? email;
  String? image;
  Location? location;
  List<dynamic>? favoriteBlogIds;

  User({this.id, this.email, this.image, this.location, this.favoriteBlogIds});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    email = json['Email'];
    image = json['Image'];
    location = json['Location'] != null ? Location.fromJson(json['Location']) : null;
    favoriteBlogIds = json['FavoriteBlogIds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Email'] = email;
    data['Image'] = image;
    if (location != null) {
      data['Location'] = location!.toJson();
    }
    data['FavoriteBlogIds'] = favoriteBlogIds;
    return data;
  }
}

class Location {
  String? longtitude;
  String? latitude;

  Location({this.longtitude, this.latitude});

  Location.fromJson(Map<String, dynamic> json) {
    longtitude = json['Longtitude'];
    latitude = json['Latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Longtitude'] = longtitude;
    data['Latitude'] = latitude;
    return data;
  }
}
