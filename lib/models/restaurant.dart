import 'package:flutter/material.dart';
class Restaurant {
  final String imageURI;
  final String name;
  final String address;
  final int likes;
  final IconData icon;
  final Color iconBackgroundColor;

  const Restaurant({
    this.imageURI = '',
    this.name = '',
    this.address = '',
    this.likes = 0,
    this.icon,
    this.iconBackgroundColor,
  });
}

const restaurants = [
  Restaurant(
    imageURI: 'assets/eggs_in_skillet.jpg',
    address: 'Main Road, Bistupur',
    likes: 45,
    icon: Icons.fastfood,
    iconBackgroundColor: Colors.red,
    name: 'Le Bon',
  ),
  Restaurant(
    imageURI: 'assets/steak_on_cooktop.jpg',
    address: 'C.H.Area, Sonari',
    likes: 32,
    icon: Icons.restaurant,
    iconBackgroundColor: Colors.blue,
    name: 'The Naan Sense',
  ),
  Restaurant(
    imageURI: 'assets/spoons_of_spices.jpg',
    address: 'Market Area, Sakchi',
    likes: 25,
    icon: Icons.fastfood,
    iconBackgroundColor: Colors.green,
    name: 'Sukh Sagar',
  ),
];
