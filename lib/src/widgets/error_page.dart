import 'package:flutter/material.dart';
import 'package:wisata_surabaya/locator.dart';
import 'package:wisata_surabaya/src/utils/route_path.dart' as routes;
import 'package:wisata_surabaya/src/services/navigation_service.dart';
import 'package:wisata_surabaya/src/utils/textstyle.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(child: Center(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                width: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/error_404.jpg")
                  )
                ),
              ),
              SizedBox(height: 10,),
              FlatButton(
                onPressed: (){
                  locator<NavigationService>().navigateTo(routes.HomeScreenRoute);
                },
                child: Text("Retry Now", style: retryButton,),
              )
            ],
          ),
        ),
      ),),
    );
  }
}
