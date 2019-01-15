import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/menu.dart';
import 'package:hidden_drawer_menu/screens/menu_screen.dart';
import 'package:hidden_drawer_menu/screens/other_screen.dart';
import 'package:hidden_drawer_menu/screens/restaurant_screen.dart';
import 'package:hidden_drawer_menu/models/screen.dart';
import 'package:hidden_drawer_menu/zoom_scaffold.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  Screen activeScreen = restaurantScreen;
  String selectedID = '0';
  @override
  Widget build(BuildContext context) {
    return ZoomScaffold(
      contentScreen: activeScreen,
      menuScreen: MenuScreen(
        menu: Menu(
          menuItems: items,
        ),
        onMenuItemSelected: (selectedItem) {
          selectedID = selectedItem;
          activeScreen = selectedItem == '0' ? restaurantScreen : otherScreen;
          setState(() {});
        },
        selectedID: selectedID,
      ),
    );
  }
}
