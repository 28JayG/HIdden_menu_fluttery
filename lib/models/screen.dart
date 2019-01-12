import 'package:flutter/material.dart';

class Screen {
  final String title;
  final WidgetBuilder contentBuilder;
  final DecorationImage backgroundImage;

  const Screen({
    this.title,
    this.contentBuilder,
    this.backgroundImage,
  });
}
