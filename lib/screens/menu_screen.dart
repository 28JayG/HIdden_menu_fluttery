import 'package:flutter/material.dart';


//TODO:(3.1.2) Transform the Menu Text() and solve the mystery of THE HIDDEN 'NU'
//
//Widget createMenuScreen() {
//  return Material(
//    child: Container(
//      width: double.infinity,
//      height: double.infinity,
//      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage('assets/dark_grunge_bk.jpg'),
//          fit: BoxFit.cover,
//        ),
//      ),
//      child: Stack(
//        children: <Widget>[
////          Transform(
////            transform: Matrix4.translationValues(-100.0, 0.0, 0.0),
////            child: OverflowBox(
////              maxWidth: double.infinity,
////              alignment: Alignment.topLeft,
////              child: Padding(
////                padding: const EdgeInsets.all(30.0),
////                child: Text(
////                  'Menu',
////                  style: TextStyle(
////                    fontFamily: 'mermaid',
////                    fontSize: 300.0,
////                    color: Color(0x88444444),
////                  ),
////                  softWrap: false,
////                ),
////              ),
////            ),
////          ),
//            Text(
//              'Menu',
//              style: TextStyle(
//                fontFamily: 'mermaid',
//                fontSize: 300.0,
//                color: Color(0x88444444),
//              ),
//              softWrap: false,
//            ),
////          Transform(
////            transform: Matrix4.translationValues(0.0, 260.0, 0.0),
////              child: createMenuList()),
//        ],
//      ),
//    ),
//  );
//}

//TODO(3.1.3)create menuList and MenuListItem
//
//Widget createMenuList() {
//  return Column(
//    crossAxisAlignment: CrossAxisAlignment.start,
//    children: <Widget>[
//      MenuListItem(
//        title:'Restaurants',
//        isSelected:true,
//      ),
//      MenuListItem(
//        title:'Others',
//        isSelected:false,
//      ),
//      MenuListItem(
//        title:'Help us Grow',
//        isSelected:false,
//      ),
//      MenuListItem(
//        title:'Settings',
//        isSelected:false,
//      ),
//    ],
//  );
//}
//
//class MenuListItem extends StatelessWidget {
//  final String title;
//  final bool isSelected;
//
//  const MenuListItem({Key key, this.title, this.isSelected,}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return InkWell(
//      onTap: isSelected ?
//      null :
//          () {
//        print(title);
//      },
//      child: Padding(
//        padding: const EdgeInsets.only(left:50.0, top: 15.0, bottom: 15.0),
//        child: Text(
//          title,
//          style: TextStyle(
//            fontFamily: 'bebas-neue',
//            fontSize: 35.0,
//            color: isSelected ? Colors.red : Colors.white,
//          ),
//        ),
//      ),
//    );
//  }
//}