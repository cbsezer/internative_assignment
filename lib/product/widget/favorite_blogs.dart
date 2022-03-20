import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../utils/padding/page_padding.dart';
import '../utils/radius/general_radius.dart';

Observer favoriteBlogs(BuildContext context, bool isFavorite, _viewModel) {
  return Observer(builder: (_) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _viewModel.blogs.length,
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
                      image:
                          DecorationImage(image: NetworkImage(_viewModel.blogs[index].image ?? ''), fit: BoxFit.cover)),
                ),
                Observer(builder: (_) {
                  return StatefulBuilder(builder: (context, customSetState) {
                    return Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            await _viewModel.toggleIsFavorite(_viewModel.blogs[index].id ?? '', context);
                            customSetState(() {
                              isFavorite = !isFavorite;
                            });
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
                      _viewModel.blogs.isNotEmpty ? _viewModel.blogs[index].title ?? '' : '',
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
  });
}
