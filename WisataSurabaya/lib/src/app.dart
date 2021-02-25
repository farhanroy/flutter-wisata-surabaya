import 'package:flutter/material.dart';
import 'package:wisata_surabaya/src/screen/splash_screen.dart';
import 'package:wisata_surabaya/src/utils/color_extension.dart';

import '../locator.dart';
import 'services/navigation_service.dart';
import 'routers/router.dart' as router;
import 'utils/route_path.dart' as routes;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wisata Surabaya',
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
        initialRoute: routes.SplashScreenRoute,
        theme: ThemeData(
          primaryColor: HexColor.fromHex("#11adcf"),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
