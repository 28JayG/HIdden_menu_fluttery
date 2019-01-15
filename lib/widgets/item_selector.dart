import 'package:flutter/material.dart';

//TODO:(8.6)Create an ItemSelector
//class ItemSelector extends ImplicitlyAnimatedWidget {
//  final double topY;
//  final double bottomY;
//  final double opacity;
//
//  ItemSelector({
//    this.topY,
//    this.bottomY,
//    this.opacity,
//  }) : super(duration: const Duration(milliseconds: 250));
//
//  @override
//  _ItemSelectorState createState() => _ItemSelectorState();
//}
//
//class _ItemSelectorState extends AnimatedWidgetBaseState<ItemSelector> {
//  Tween<double> _topY;
//  Tween<double> _bottomY;
//  Tween<double> _opacity;
//
//  @override
//  void forEachTween(visitor) {
//    _topY = visitor(
//      _topY,
//      widget.topY,
//      (dynamic value) => Tween<double>(begin: value),
//    );
//    _bottomY = visitor(
//      _bottomY,
//      widget.bottomY,
//      (dynamic value) => Tween<double>(begin: value),
//    );
//    _opacity = visitor(
//      _opacity,
//      widget.opacity,
//      (dynamic value) => Tween<double>(begin: value),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Positioned(
//      top: _topY.evaluate(animation),
//      child: Opacity(
//        opacity: _opacity.evaluate(animation),
//        child: Container(
//          width: 5.0,
//          height: _bottomY.evaluate(animation) - _topY.evaluate(animation),
//          color: Colors.red,
//        ),
//      ),
//    );
//  }
//}
