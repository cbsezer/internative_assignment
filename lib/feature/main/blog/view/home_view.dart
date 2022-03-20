import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../product/utils/radius/general_radius.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/text_constants.dart';
import '../../../../product/utils/padding/page_padding.dart';
import '../viewmodel/blog_view_model.dart';

part './sub_view/favorite_blogs.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final _viewModel = BlogViewModel();

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    _viewModel.fetchCategories(context);
    _viewModel.fetchBlogs('');

    return Scaffold(
      appBar:
          AppBar(leading: const Icon(Icons.search), title: Text(TextConstants.instance.homePage), centerTitle: true),
      body: Padding(
        padding: const PagePadding.horizontalSymmetric(),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 100, child: _categoryList(context)),
            Padding(
              padding: const PagePadding.verticalLowSymmetric(),
              child: Text('Blog', style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold)),
            ),
            favoriteBlogs(context: context, isFavorite: isFavorite, viewModel: _viewModel)
          ],
        ),
      ),
    );
  }

  Observer _categoryList(BuildContext context) {
    return Observer(builder: (_) {
      if (_viewModel.isServiceRequestLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onSecondary
          ),
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _viewModel.categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                _viewModel.fetchBlogs(_viewModel.categories[index].id ?? '');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const PagePadding.allLow(),
                    child: ClipRRect(
                        borderRadius: const GeneralRadius.allNormal(),
                        child: Image.network(_viewModel.categories[index].image ?? '',
                            height: 60, width: context.width * 0.35, fit: BoxFit.cover)),
                  ),
                  context.emptySizedHeightBoxLow,
                  Text(_viewModel.categories[index].title ?? '')
                ],
              ),
            );
          },
        );
      }
    });
  }
}
