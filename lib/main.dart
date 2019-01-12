import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/restaurant.dart';
import 'package:hidden_drawer_menu/sceerns/other_screen.dart';
import 'package:hidden_drawer_menu/sceerns/restaurant_screen.dart';
import 'package:hidden_drawer_menu/models/screen.dart';
import 'package:hidden_drawer_menu/widgets/restaurant_card.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// TODO:(2.1) Give your HomePage A Screen.

class _MyHomePageState extends State<MyHomePage> {

//  final Screen screen = otherScreen;

//  _MyHomePageState({this.screen});

//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      decoration: BoxDecoration(
//        image: screen.backgroundImage,
//      ),
//      child: Scaffold(
//          backgroundColor: Colors.transparent,
//          appBar: AppBar(
//            title: Text(
//              screen.title,
//              style: TextStyle(
//                fontFamily: 'bebas-neue',
//                fontSize: 25.0,
//              ),
//            ),
//            leading: IconButton(
//              icon: Icon(Icons.menu),
//              onPressed: () {
//                print('Menu');
//              },
//            ),
//            backgroundColor: Colors.transparent,
//            elevation: 0.0,
//          ),
//          body: screen.contentBuilder(context),
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wood_bk.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'RESTAURANTS',
            style: TextStyle(
              fontFamily: 'bebas-neue',
              fontSize: 25.0,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Menu');
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView(
            children:[
                RestaurantCard(
                restaurant: restaurants[0],
                ),
                RestaurantCard(
                restaurant: restaurants[1],
                ),
                RestaurantCard(
                restaurant: restaurants[2],
                ),
            ],
        ),
      ),
    );
  }
}
