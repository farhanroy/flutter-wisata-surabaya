import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisata_surabaya/src/screen/homepage/list_wisata.dart';
import 'package:wisata_surabaya/src/screen/homepage/maps_wisata.dart';
import 'package:wisata_surabaya/src/utils/color_extension.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  bool _willPop = false;

  final List<Widget> listPage = <Widget>[ListWisata(), MapsWisata()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: HexColor.fromHex("#ffffff"),
        body: Container(
          child: listPage[_index],
        ),
        bottomNavigationBar: bottomNavigationBar(context),
      ),
    );
  }

  Widget bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("")),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[700],
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: _index,
      onTap: _onItemTapped,
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
