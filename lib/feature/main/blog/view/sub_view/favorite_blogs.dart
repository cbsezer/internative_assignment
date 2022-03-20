part of '../home_view.dart';

extension BlogGridList on HomeView {
  Observer favoriteBlogs({required BuildContext context, required bool isFavorite, required viewModel}) {
    return Observer(builder: (_) {
      return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.blogs.length,
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
                        image: DecorationImage(
                            image: NetworkImage(viewModel.blogs[index].image ?? ''), fit: BoxFit.cover)),
                  ),
                  StatefulBuilder(builder: (context, customSetState) {
                    return Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            await viewModel.toggleIsFavorite(viewModel.blogs[index].id ?? '', context);
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
                        viewModel.blogs.isNotEmpty ? viewModel.blogs[index].title ?? '' : '',
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
}
