import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_assignment/product/utils/radius/general_radius.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/text_constants.dart';
import '../../../../product/utils/padding/page_padding.dart';
import '../viewmodel/blog_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final _viewModel = BlogViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.fetchCategories();
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
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const PagePadding.allLow(),
                    child: Stack(
                      children: [
                        Container(
                          height: 180,
                          width: context.width * 0.42,
                          decoration: BoxDecoration(
                              borderRadius: GeneralRadius.allNormal(),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg'),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              borderRadius: GeneralRadius.onlyBottom(),
                              color: Colors.grey.shade300,
                            ),
                            width: context.width,
                            height: 30,
                            child: Text(
                              'Article',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
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
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _viewModel.categories.length,
          itemBuilder: (context, index) {
            return Column(
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
            );
          },
        );
      }
    });
  }
}
