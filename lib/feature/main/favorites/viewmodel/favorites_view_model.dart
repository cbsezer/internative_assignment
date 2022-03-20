import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../product/mixin/get_current_position.dart';
import '../../../../product/service/get_user_info.dart';
import '../../../../product/service/user_state.dart';
import 'package:mobx/mobx.dart';

import '../../blog/model/blog_model.dart';
import '../../blog/viewmodel/blog_view_model.dart';

part 'favorites_view_model.g.dart';

class FavoriteViewModel = _FavoriteViewModel with _$FavoriteViewModel;

abstract class _FavoriteViewModel with Store {
  @observable
  List<Blog> favorites = [];

  @action
  Future<void> allFavoriteBlogs(BlogViewModel blogViewModel, BuildContext context) async {
    await blogViewModel.fetchBlogs('');
    var currentUser = Provider.of<UserProvider>(context, listen: false).currentUser;
    for (var i = 0; i < blogViewModel.blogs.length; i++) {
      if (currentUser!.user!.favoriteBlogIds!.contains(blogViewModel.blogs[i].id.toString())) {
        favorites.add(blogViewModel.blogs[i]);
      }
    }
  }
}
