import 'dart:convert';

import 'package:hive/hive.dart';

import 'hive_keys.dart';

class UserCacheService {
  Future<void> saveUserToken(String token) async {
    await Hive.openBox(HiveBoxKey.currentUser.name);
    var pin = Hive.box(HiveBoxKey.currentUser.name);
    await pin.put(HiveBoxKey.currentUser.name, utf8.fuse(base64Url).encode(token));
  }

  Future<String?> getUserToken() async {
    await Hive.openBox(HiveBoxKey.currentUser.name);
    var token = Hive.box(HiveBoxKey.currentUser.name);
    var userToken = await token.get(HiveBoxKey.currentUser.name);
    if (userToken != null) {
      String decoded = utf8.fuse(base64Url).decode(userToken);
      return decoded;
    } else {
      return null;
    }
  }
}
