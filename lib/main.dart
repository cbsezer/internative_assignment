import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'product/service/user_state.dart';
import 'package:provider/provider.dart';

import 'core/init/navigation/router.dart';
import 'core/init/theme/custom_theme.dart';

Future<void> main() async {
  await Hive.initFlutter();

  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => UserProvider())], child: const MyApp())
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => _MyApp(), // Wrap your app
      // ),
      //),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //   theme: ThemeManager.craeteTheme(),
        //   home: HomeView(),
        // );
        MaterialApp.router(
      // builder: (context, widget) => ResponsiveInitialize.builder(child: widget),
      routerDelegate: AppRouter().delegate(),
      routeInformationParser: AppRouter().defaultRouteParser(),
      theme: ThemeManager.craeteTheme(),
    );
  }
}
