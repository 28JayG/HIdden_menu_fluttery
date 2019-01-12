import 'package:flutter/material.dart';

//TODO:(4.0)Make MenuScreen Stateful

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {


  Widget createMenuList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MenuListItem(
          title: 'Restaurants',
          isSelected: true,
        ),
        MenuListItem(
          title: 'Others',
          isSelected: false,
        ),
        MenuListItem(
          title: 'Help us Grow',
          isSelected: false,
        ),
        MenuListItem(
          title: 'Settings',
          isSelected: false,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                child: createMenuList()),
          ],
        ),
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const MenuListItem({
    Key key,
    this.title,
    this.isSelected,
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
