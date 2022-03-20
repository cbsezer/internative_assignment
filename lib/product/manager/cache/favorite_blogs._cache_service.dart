import 'dart:convert';

import 'package:hive/hive.dart';
import '../../../feature/main/blog/model/blog_model.dart';

import 'hive_keys.dart';

class FavoritesCacheService {
  Future<void> addFavoritesList({required Blog blog}) async {
    await Hive.openBox(HiveBoxKey.favorites.name);

    var favoritesBox = Hive.box(HiveBoxKey.favorites.name);
    if (!favoritesBox.values.toList().contains(jsonEncode(blog.toJson()))) {
      await favoritesBox.add(jsonEncode(blog.toJson()));
    }
  }

  List<Blog> getAllFavoriteBlogs() {
    var favoritesBox = Hive.box(HiveBoxKey.favorites.name);
    var allList = favoritesBox.values.toList();
    var localFavoritesList = <Blog>[];
    for (var element in allList) {
      localFavoritesList.add(Blog.fromJson(jsonDecode(element)));
    }
    return localFavoritesList;
  }

  Future<void> deleteFromFavoritesList({required int index}) async {
    await Hive.openBox(HiveBoxKey.favorites.name);

    var favoritesBox = Hive.box(HiveBoxKey.favorites.name);
    await favoritesBox.deleteAt(index);
  }
}
