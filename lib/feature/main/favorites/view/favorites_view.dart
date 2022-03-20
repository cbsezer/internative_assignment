import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internative_assignment/feature/main/blog/model/blog_model.dart';
import 'package:internative_assignment/feature/main/blog/viewmodel/blog_view_model.dart';
import 'package:internative_assignment/product/manager/cache/favorite_blogs._cache_service.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/text_constants.dart';
import '../../../../product/utils/padding/page_padding.dart';
import '../../../../product/utils/radius/general_radius.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    var _viewModel = BlogViewModel();
    var blogList = FavoritesCacheService().getAllFavoriteBlogs();
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, title: Text(TextConstants.instance.favorites), centerTitle: true),
        body: Padding(
            padding: const PagePadding.horizontalSymmetric(),
            child: favoriteList(blogList, context, _viewModel, isFavorite)));
  }

  GridView favoriteList(List<Blog> blogList, BuildContext context, BlogViewModel _viewModel, bool isFavorite) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: blogList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3 / 4),
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const PagePadding.allLow(),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: context.width * 0.42,
                  decoration: BoxDecoration(
                      borderRadius: const GeneralRadius.allNormal(),
                      image: DecorationImage(image: NetworkImage(blogList[index].image ?? ''), fit: BoxFit.cover)),
                ),
                Observer(builder: (_) {
                  return StatefulBuilder(builder: (context, customSetState) {
                    return Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            await _viewModel.toggleIsFavorite(blogList[index].id ?? '', context);
                            customSetState(() {
                              isFavorite = !isFavorite;
                            });
                            if (isFavorite) {
                              FavoritesCacheService().addFavoritesList(blog: blogList[index]);
                            } else {
                              FavoritesCacheService().deleteFromFavoritesList(index: index);
                            }
                          },
                          icon: Icon(isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart),
                        ));
                  });
                }),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: GeneralRadius.onlyBottom(),
                      color: Colors.grey.shade300,
                    ),
                    width: context.width * 0.45,
                    height: 40,
                    child: Text(
                      blogList.isNotEmpty ? blogList[index].title ?? '' : '',
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
