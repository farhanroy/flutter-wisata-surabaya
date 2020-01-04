import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisata_surabaya/src/model/wisata_model/item_wisata_model.dart';
import 'package:wisata_surabaya/src/utils/textstyle.dart';

class DetailPlace extends StatelessWidget {
  final Datum listWisata;

  DetailPlace({Key key, this.listWisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                    tag: "Image ${listWisata.image2}",
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Image(
                          image: NetworkImage(listWisata.image2),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    bottom: 20.0,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white70,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: "Caption ${listWisata.caption}",
                      child: Text(
                        listWisata.caption,
                        style: titleToolbarTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Hero(
                            tag: "Rating ${listWisata.rating}",
                            child: Text("Like ${listWisata.rating}")),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Favorite ${listWisata.like}"),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Description",
                      style: placeListName,
                    ),
                    SizedBox(height: 10),
                    Text(
                      listWisata.description,
                      style: shortDescListName,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
