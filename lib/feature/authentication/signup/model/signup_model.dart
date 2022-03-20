class SignUpModel {
  String? email;
  String? password;
  String? passwordRetry;

  SignUpModel({this.email, this.password, this.passwordRetry});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['Password'] = password;
    data['PasswordRetry'] = passwordRetry;
    return data;
  }
}
