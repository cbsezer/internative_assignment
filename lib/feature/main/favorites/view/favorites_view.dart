import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internative_assignment/feature/main/blog/viewmodel/blog_view_model.dart';
import 'package:internative_assignment/feature/main/favorites/viewmodel/favorites_view_model.dart';
import 'package:internative_assignment/feature/main/profile/viewmodel/profile_view_model.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/text_constants.dart';
import '../../../../product/service/user_state.dart';
import '../../../../product/utils/padding/page_padding.dart';
import '../../../../product/utils/radius/general_radius.dart';
import '../../blog/model/blog_model.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final _blogViewModel = BlogViewModel();
  final _favoriteViewModel = FavoriteViewModel();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    await _favoriteViewModel.allFavoriteBlogs(_blogViewModel, context);
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;

    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.arrow_back_ios_outlined),
            backgroundColor: Colors.white,
            title: Text(TextConstants.instance.favorites),
            centerTitle: true),
        body: Padding(padding: const PagePadding.horizontalSymmetric(), child: favoriteList(context, isFavorite)));
  }

  Observer favoriteList(BuildContext context, bool isFavorite) {
    List<Blog> favorites = _favoriteViewModel.favorites;
    print(favorites.length);

    return Observer(builder: (context) {
      if (_blogViewModel.isServiceRequestLoading) {
        return Center(child: CircularProgressIndicator(color: context.colorScheme.onSecondary));
      } else {
        return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: favorites.length,
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
                          image: DecorationImage(image: NetworkImage(favorites[index].image ?? ''), fit: BoxFit.cover)),
                    ),
                    StatefulBuilder(builder: (context, customSetState) {
                      return Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () async {
                              await _blogViewModel.toggleIsFavorite(favorites[index].id ?? '', context);
                              customSetState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            icon: Icon(isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart),
                          ));
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
                          favorites.isNotEmpty ? favorites[index].title ?? '' : '',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      }
    });
  }
}
