import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? currentUser;

  void setUser({required UserModel user}) {
    currentUser = user;
    notifyListeners();
  }
}
