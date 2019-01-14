import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/menu.dart';
import 'package:hidden_drawer_menu/zoom_scaffold.dart';

//TODO:(7.2) Let menu screen take up the menu
//TODO:(7.3) Create a function that returns the id of the menu when it is selected
//TODO:(7.5) get the selected id
class MenuScreen extends StatefulWidget {
//  final Menu menu;
////  final Function(String) onMenuItemSelected;
//////  final String selectedID;

//  const MenuScreen({
//    Key key,
//    this.menu,
////    this.onMenuItemSelected,
//////    this.selectedID,
//  }) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  AnimationController titleAnimationController;

  @override
  void initState() {
    super.initState();

    titleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    titleAnimationController.dispose();
    super.dispose();
  }

  Widget createMenuList(MenuController controller) {
    final titles = ['RESTAURANTS', 'OTHER', 'HELP US GROW', 'SETTINGS'];
    final activeIndex = 0;
    final perItemDelay = controller.menuState == MenuState.closing ? 0.0 : 0.15;
    final List<Widget> items = [];

//    for (int i = 0; i < widget.menu.menuItems.length; i++) {
    for (int i = 0; i < titles.length; i++) {
      final animationIntervalStart = i * perItemDelay;
      final animationIntervalEnd = animationIntervalStart + 0.5;
      items.add(
        AnimatedMenuListItem(
          duration: Duration(milliseconds: 600),
          curve: Interval(
            animationIntervalStart,
            animationIntervalEnd,
            curve: Curves.easeOut,
          ),
          menuController: controller,
          menuListItem: MenuListItem(
            title: titles[i],
//            title: widget.menu.menuItems[i].title,
            isSelected: activeIndex == i,
//          isSelected: widget.menu.menuItems[i].id == widget.selectedID,
            onTap: () {
//              widget.onMenuItemSelected(widget.menu.menuItems[i].id);
              controller.close();
            },
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }

  menuTitle(MenuController menuController) {
    switch (menuController.menuState) {
      case MenuState.closed:
      case MenuState.closing:
        titleAnimationController.reverse();
        break;
      case MenuState.open:
      case MenuState.opening:
        titleAnimationController.forward();
        break;
    }

    return AnimatedBuilder(
      animation: titleAnimationController,
      child: OverflowBox(
        maxWidth: double.infinity,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            'Menu',
            style: TextStyle(
              fontFamily: 'mermaid',
              fontSize: 200.0,
              color: Color(0x88444444),
            ),
            softWrap: false,
          ),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Transform(
          transform: Matrix4.translationValues(
            250.0 * (1.0 - titleAnimationController.value) - 100.0,
            0.0,
            0.0,
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ZoomScaffoldMenuController(
        builder: (BuildContext context, MenuController menuController) {
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
              menuTitle(menuController),
              Transform(
                transform: Matrix4.translationValues(0.0, 240.0, 0.0),
                child: createMenuList(menuController),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AnimatedMenuListItem extends ImplicitlyAnimatedWidget {
  final MenuController menuController;
  final MenuListItem menuListItem;
  final Duration duration;

  AnimatedMenuListItem({
    this.menuController,
    this.duration,
    this.menuListItem,
    curve,
  }) : super(
          duration: duration,
          curve: curve,
        );

  @override
  _AnimatedMenuListItemState createState() => _AnimatedMenuListItemState();
}

class _AnimatedMenuListItemState
    extends AnimatedWidgetBaseState<AnimatedMenuListItem> {
  final closedSlidePosition = 200.0;
  final openSlidePosition = 0.0;
  Tween<double> _opacity;
  Tween<double> _translation;

  @override
  void forEachTween(visitor) {
    var slide, opacity;

    switch (widget.menuController.menuState) {
      case MenuState.closed:
      case MenuState.closing:
        slide = closedSlidePosition;
        opacity = 0.0;
        break;
      case MenuState.open:
      case MenuState.opening:
        slide = openSlidePosition;
        opacity = 1.0;
        break;
    }
    _opacity = visitor(
      _opacity,
      opacity,
      (dynamic value) => Tween<double>(begin: value),
    );

    _translation = visitor(
      _translation,
      slide,
      (dynamic value) => Tween<double>(begin: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity.evaluate(animation),
      child: Transform(
        transform: Matrix4.translationValues(
          0.0,
          _translation.evaluate(animation),
          0.0,
        ),
        child: widget.menuListItem,
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;

  const MenuListItem({
    Key key,
    this.title,
    this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0x44000000),
      highlightColor: Colors.transparent,
      onTap: isSelected ? null : onTap,
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
