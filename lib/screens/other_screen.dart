import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/screen.dart';


final otherScreen = Screen(
    backgroundImage: DecorationImage(
      image: AssetImage('assets/other_screen_bk.jpg'),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black54,
        BlendMode.multiply,
      ),
    ),
    title: 'OTHER',
    contentBuilder: (BuildContext context) {
      return Container(
        height: 300.0,
        child: Card(
          child: Column(
            children: <Widget>[
              Image.asset('assets/other_screen_card_photo.jpg'),
              Text(
                'Some random text',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'bebas-nueu',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );
    });
