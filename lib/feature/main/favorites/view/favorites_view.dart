import 'package:flutter/material.dart';

import '../../../../core/constants/text_constants.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text(TextConstants.instance.favorites), centerTitle: true),
    );
  }
}
