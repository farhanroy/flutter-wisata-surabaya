import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wisata_surabaya/locator.dart';
import 'package:wisata_surabaya/src/services/navigation_service.dart';
import 'package:wisata_surabaya/src/utils/route_path.dart' as routes;

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    locator<NavigationService>().navigateTo(routes.HomeScreenRoute);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Container(
        height: 230,
        width: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/logo_surabaya.png")
            )
        ),
      )),
    );
  }
}

