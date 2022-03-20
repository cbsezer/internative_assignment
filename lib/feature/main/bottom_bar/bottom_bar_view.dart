import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import '../../../product/utils/size/widget_size.dart';
import '../blog/view/home_view.dart';
import '../favorites/view/favorites_view.dart';
import '../profile/view/profile_view.dart';

enum _BlogTabItems { favorites, home, person }

class TabBlogView extends StatefulWidget {
  const TabBlogView({Key? key}) : super(key: key);

  @override
  State<TabBlogView> createState() => _TabBlogViewState();
}

class _TabBlogViewState extends State<TabBlogView> with TickerProviderStateMixin {
  late TabController _tabController;

  void _changePage(_BlogTabItems value) {
    setState(() {
      _tabController.animateTo(value.index);
    });
  }

  Color? _activatedColor(_BlogTabItems value) {
    return _tabController.index == value.index ? context.colorScheme.onSecondary : context.colorScheme.onSurface;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _BlogTabItems.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _BlogTabItems.values.length,
      child: Scaffold(
        extendBody: true,
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [const FavoritesView(), HomeView(), ProfileView()]),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: context.normalRadius),
          child: BottomAppBar(
            notchMargin: WidgetSizes.spacingXsMid,
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () => _changePage(_BlogTabItems.favorites),
                          child: Icon(FontAwesomeIcons.solidHeart, color: _activatedColor(_BlogTabItems.favorites)))),
                  Expanded(
                      child: TextButton(
                          onPressed: () => _changePage(_BlogTabItems.home),
                          child: Icon(FontAwesomeIcons.home, color: _activatedColor(_BlogTabItems.home)))),
                  Expanded(
                      child: TextButton(
                          onPressed: () => _changePage(_BlogTabItems.person),
                          child: Icon(FontAwesomeIcons.solidUser, color: _activatedColor(_BlogTabItems.person)))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
