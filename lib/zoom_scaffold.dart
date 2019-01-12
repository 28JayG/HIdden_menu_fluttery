import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/screen.dart';
import 'package:hidden_drawer_menu/screens/menu_screen.dart';

//TODO:(4.1) Its time to zoom our homescreen

//TODO:(4.2) Okay! Now this needs to Zoom and Slide, well, sort of for now.

//class ZoomScaffold extends StatefulWidget {
//  final Screen contentScreen;
//  final MenuScreen menuScreen;
//
//  const ZoomScaffold({Key key, this.contentScreen, this.menuScreen})
//      : super(key: key);
//
//  @override
//  _ZoomScaffoldState createState() => _ZoomScaffoldState();
//}
//
//class _ZoomScaffoldState extends State<ZoomScaffold> {
//
//  createContentDisplay() {
//    return Container(
//      decoration: BoxDecoration(
//        image: widget.contentScreen.backgroundImage,
//      ),
//      child: Scaffold(
//        backgroundColor: Colors.transparent,
//        appBar: AppBar(
//          title: Text(
//            widget.contentScreen.title,
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
//        body: widget.contentScreen.contentBuilder(context),
//      ),
//    );
//
////    return zoomAndSlide(
////      Container(
////        decoration: BoxDecoration(
////          image: widget.contentScreen.backgroundImage,
////        ),
////        child: Scaffold(
////          backgroundColor: Colors.transparent,
////          appBar: AppBar(
////            title: Text(
////              widget.contentScreen.title,
////              style: TextStyle(
////                fontFamily: 'bebas-neue',
////                fontSize: 25.0,
////              ),
////            ),
////            leading: IconButton(
////              icon: Icon(Icons.menu),
////              onPressed: () {
////                print('Menu');
////              },
////            ),
////            backgroundColor: Colors.transparent,
////            elevation: 0.0,
////          ),
////          body: widget.contentScreen.contentBuilder(context),
////        ),
////      ),
////    );
//  }
////
////  zoomAndSlide(Widget content) {
////    return Transform(
////      transform: Matrix4.translationValues(275.0, 0.0, 0.0)..scale(0.8, 0.8),
////      alignment: Alignment.centerLeft,
////      child: Container(
////        decoration: BoxDecoration(
////          boxShadow: [
////            BoxShadow(
////              color: Color(0x88000000),
////              spreadRadius: 10.0,
////              blurRadius: 20.0,
////            ),
////          ],
////        ),
////        child: ClipRRect(
////            borderRadius: BorderRadius.circular(10.0), child: content),
////      ),
////    );
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        widget.menuScreen,
//        createContentDisplay(),
//      ],
//    );
//  }
//}
