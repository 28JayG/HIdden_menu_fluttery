import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/screens/menu_screen.dart';
import 'package:hidden_drawer_menu/screens/other_screen.dart';
import 'package:hidden_drawer_menu/screens/restaurant_screen.dart';
import 'package:hidden_drawer_menu/models/screen.dart';

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

//TODO:(3.1.1)Create the MenuScreen

class _MyHomePageState extends State<MyHomePage> {
  final Screen screen = restaurantScreen;

//  _MyHomePageState({this.screen});

  createContentDisplay() {
    return Container(
      decoration: BoxDecoration(
        image: screen.backgroundImage,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            screen.title,
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
        body: screen.contentBuilder(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
//        createMenuScreen(),
        createContentDisplay(),
      ],
    );
  }
}
