import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {

  final Restaurant restaurant;

  const RestaurantCard({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Image.asset(
              restaurant.imageURI,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: restaurant.iconBackgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Icon(
                      restaurant.icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        restaurant.name,
                        style: TextStyle(fontSize: 20.0, fontFamily: 'mermaid'),
                      ),
                      Text(
                          restaurant.address,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'bebas-nueu',
                          color: Color(0x88444444),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xFFAAAAAA),
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      stops: [0.3, 1.0],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      Text('${restaurant.likes}'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
