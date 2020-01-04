import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:wisata_surabaya/locator.dart';
import 'package:wisata_surabaya/src/model/wisata_model/item_wisata_model.dart';
import 'package:wisata_surabaya/src/services/navigation_service.dart';
import 'package:wisata_surabaya/src/utils/textstyle.dart';

import '../utils/route_path.dart' as routes;

class WidgetListWisata extends StatelessWidget {
  final List<Datum> listWisata;
  final navService = locator<NavigationService>();

  WidgetListWisata({this.listWisata});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Wisata Surabaya",
                      style: titleToolbarTextStyle,
                    ),
                    Text(
                      "Kota Seribu Cerita",
                      style: subTitleToolbarTextStyle,
                    ),
                  ],
                ),
                Icon(
                  Icons.person,
                  color: Colors.black,
                )
              ],
            ),
            Container(
              height: 380,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listWisata.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => navService.navigateTo(
                          routes.DetailScreenRoute,
                          arguments: listWisata[index]),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Card(
                            child: Hero(
                              tag: "Image ${listWisata[index].image2}",
                              child: Container(
                                height: 300,
                                width: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            listWisata[index].image2),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                          Positioned(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              child: Container(
                                height: 125,
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                          child: Hero(
                                        tag:
                                            "Caption ${listWisata[index].caption}",
                                        child: Text(
                                          listWisata[index].caption,
                                          style: placeListName,
                                        ),
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Flexible(
                                          child: Text(
                                        listWisata[index].description,
                                        style: shortDescListName,
                                        maxLines: 1,
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Hero(
                                            tag:"Rating ${listWisata[index].rating}",
                                            child: Text(
                                                "Like ${listWisata[index].rating}"),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              elevation: 3.0,
                            ),
                            bottom: 0,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Recommend",
              style: placeListName,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 500,
              child: ListView.builder(
                  itemCount: listWisata.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () => navService.navigateTo(
                          routes.DetailScreenRoute,
                          arguments: listWisata[i]),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(listWisata[i].image1),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        listWisata[i].caption,
                                        style: recommendListName,
                                        overflow: TextOverflow.clip,
                                        softWrap: true,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RatingBar.readOnly(
                                        initialRating: listWisata[i].rating,
                                        size: 16,
                                        filledIcon: Icons.star,
                                        emptyIcon: Icons.star_border,
                                        emptyColor: Colors.amber,
                                        filledColor: Colors.amber,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        listWisata[i].description,
                                        style: shortDescListName,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        softWrap: true,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
