import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/restaurant.dart';
import 'package:hidden_drawer_menu/widgets/restaurant_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

//TODO:(1.1) Let's take care of the appbar and scaffold background

//TODO:(1.2.1) Make a List[of RestaurantCards]



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
//    return Container(
//      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage('assets/wood_bk.jpg'),
//          fit: BoxFit.cover,
//        ),
//      ),
//      child: Scaffold(
//        backgroundColor: Colors.transparent,
//        appBar: AppBar(
//          title: Text(
//            'RESTAURANTS',
//            style: TextStyle(
//              fontFamily: 'bebas-neue',
//              fontSize: 25.0,
//            ),
//          ),
//          leading: IconButton(
//            icon: Icon(Icons.menu),
//            onPressed: () {
//              print('Menu');
//            },
//          ),
//          backgroundColor: Colors.transparent,
//          elevation: 0.0,
//        ),
////        body: ListView(
////          children: <Widget>[
////            RestaurantCard(),
//////          RestaurantCard(
//////            restaurant: restaurants[0],
//////          ),
//////          RestaurantCard(
//////            restaurant: restaurants[1],
//////          ),
//////          RestaurantCard(
//////            restaurant: restaurants[2],
//////          ),
////          ],
////        ),
//      ),
//    );
  }
}
