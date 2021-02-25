import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:wisata_surabaya/src/model/wisata_model/item_wisata_model.dart';
import 'package:wisata_surabaya/src/utils/constant.dart';

class WidgetMapWisata extends StatelessWidget {
  final List<Datum> listWisata;

  WidgetMapWisata({this.listWisata});
  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[];
    listWisata.forEach((f){
      markers.add(Marker(
        width: 120.0,
        height: 110.0,
        point: LatLng(f.latitude, f.longitude),
        builder: (ctx) => Container(
          key: Key('blue'),
          child: Column(
            children: <Widget>[
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(f.caption, overflow: TextOverflow.ellipsis,),
                ),
              ),
              SizedBox(height: 2,),
              Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/marker.png")
                  )
                ),
              )
            ],
          ),
        ),
      ));
    });

    return FlutterMap(
      options: new MapOptions(
        center: LatLng(listWisata[0].latitude, listWisata[0].longitude),
        zoom: 11.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': Constant.mapsToken,
            'id': 'mapbox.streets',
          },
        ),
        new MarkerLayerOptions(
          markers: markers
        ),
      ],
    );
  }
}
