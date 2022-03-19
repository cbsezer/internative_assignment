import 'package:flutter/material.dart';
import 'package:internative_assignment/core/constants/text_constants.dart';
import 'package:internative_assignment/product/utils/padding/page_padding.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.search),
        title: Text(TextConstants.instance.homePage),
        centerTitle: true,
      ),
      body: Padding(
        padding: const PagePadding.horizontalLowXss(),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const PagePadding.allLow2x(),
                        child: Image.network(
                            'https://www.alastyr.com/blog/wp-content/uploads/2021/01/blog-ile-para-nasil-kazanilir.png',
                            height: 60),
                      ),
                      Text('Category Tag ${index + 1}')
                    ],
                  );
                },
              ),
            ),
            Text('Blog', style: Theme.of(context).textTheme.headline6),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext ctx, index) {
                  return const Text('aaaaaa');
                })
          ],
        ),
      ),
    );
  }
}
