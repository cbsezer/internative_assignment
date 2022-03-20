import 'dart:convert';

import 'package:hive/hive.dart';
import '../../../feature/main/blog/model/blog_model.dart';

import 'hive_keys.dart';

class FavoritesCacheService {
  Future<void> addFavoritesList({required Blog blog}) async {
    var favoritesBox = Hive.box(HiveBoxKey.favorites.name);
    await favoritesBox.add(jsonEncode(blog.toJson()));
  }

  List<BlogModel> getAllFavoriteBlogs() {
    var favoritesBox = Hive.box(HiveBoxKey.favorites.name);
    var allList = favoritesBox.values.toList();
    var localFavoritesList = <BlogModel>[];
    for (var element in allList) {
      localFavoritesList.add(BlogModel.fromJson(jsonDecode(element)));
    }
    return localFavoritesList;
  }

  Future<void> deleteFromFavoritesList({required Blog blog}) async {
    var favoritesBox = Hive.box(HiveBoxKey.favorites.name);
    await favoritesBox.delete(jsonEncode(blog.toJson()));
  }

  Future<void> clearUserBox() async {
    await Hive.openBox(HiveBoxKey.favorites.name);
    var tokenBox = Hive.box(HiveBoxKey.favorites.name);
    await tokenBox.clear();
  }
}
