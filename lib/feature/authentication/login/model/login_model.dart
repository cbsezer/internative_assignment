class LoginModel {
  String? email;
  String? password;

  LoginModel({this.email, this.password});

  // LoginModel.fromJson(Map<String, dynamic> json) {
  //   email = json['Email'];
  //   password = json['Password'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['Email'] = email;
  //   data['Password'] = password;
  //   return data;
  // }
}
