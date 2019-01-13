import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/zoom_scaffold.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Widget createMenuList(MenuController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MenuListItem(
          title: 'Restaurants',
          isSelected: true,
          onTap: (){
            controller.close();
          },
        ),
        MenuListItem(
          title: 'Others',
          isSelected: false,
          onTap: (){
            controller.close();
          },
        ),
        MenuListItem(
          title: 'Help us Grow',
          isSelected: false,
          onTap: (){
            controller.close();
          },
        ),
        MenuListItem(
          title: 'Settings',
          isSelected: false,
          onTap: (){
            controller.close();
          },
        ),
      ],
    );
  }

  //TODO:(5.3.2)Use ZoomScaffoldMenuController to pass the menuController to the Menu

  @override
  Widget build(BuildContext context) {
//    return ZoomScaffoldMenuController(
//        builder: (BuildContext context, MenuController menuController) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/dark_grunge_bk.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Transform(
                transform: Matrix4.translationValues(-100.0, 0.0, 0.0),
                child: OverflowBox(
                  maxWidth: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontFamily: 'mermaid',
                        fontSize: 300.0,
                        color: Color(0x88444444),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(0.0, 260.0, 0.0),
                child: createMenuList()
//                child: createMenuList(menuController),
              ),
            ],
          ),
        ),
      );
//    });
  }
}

//TODO(5.3.3)Give a onTap Function to the MenuListItem
class MenuListItem extends StatelessWidget {
  final String title;
  final bool isSelected;
//  final Function() onTap;

  const MenuListItem({
    Key key,
    this.title,
    this.isSelected,
//    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0x44000000),
      highlightColor: Colors.transparent,
      onTap: isSelected
          ? null
          : () {
              print(title);
            },
//      onTap: isSelected ? null : onTap,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 15.0, bottom: 15.0),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'bebas-neue',
              fontSize: 35.0,
              color: isSelected ? Colors.red : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
