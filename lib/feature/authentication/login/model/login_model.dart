class LoginModel {
  String? email;
  String? password;

  LoginModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['Password'] = password;
    return data;
  }
}
