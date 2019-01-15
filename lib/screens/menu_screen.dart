import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/menu.dart';
import 'package:hidden_drawer_menu/widgets/item_selector.dart';
import 'package:hidden_drawer_menu/zoom_scaffold.dart';

//TODO:(8.2) Send the renderBox info to the MenuScreen

//final menuScreenKey = GlobalKey(debugLabel: 'MenuScreen');

class MenuScreen extends StatefulWidget {
  final Menu menu;
  final Function(String) onMenuItemSelected;
  final String selectedID;

  MenuScreen({
    Key key,
    this.menu,
    this.onMenuItemSelected,
    this.selectedID,
  });

//  }) : super(key: menuScreenKey);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

//TODO:(8.4) set the selectedRenderBox
//TODO:(8.5) set the selectorYTop and selectorYBottom
class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  AnimationController titleAnimationController;

//  RenderBox _selectedRenderBox;
//  double selectorYTop = 250.0;
//  double selectorYBottom = 300.0;
//  double selectorYTop;
//  double selectorYBottom;

//  setSelectedRenderBox(RenderBox newRenderBox) async {
//    final newYTop = newRenderBox.localToGlobal(Offset(0.0, 0.0)).dy;
//    final newYBottom = newYTop + newRenderBox.size.height;
//
//    if (newYTop != selectorYTop) {
//      setState(() {
//        selectorYTop = newYTop;
//        selectorYBottom = newYBottom;
//      });
//    }
//  }

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
    final perItemDelay = controller.menuState == MenuState.closing ? 0.0 : 0.15;
    final List<Widget> items = [];

    for (int i = 0; i < widget.menu.menuItems.length; i++) {
      final animationIntervalStart = i * perItemDelay;
      final animationIntervalEnd = animationIntervalStart + 0.5;
      final isSelected = widget.menu.menuItems[i].id == widget.selectedID;
      items.add(
        AnimatedMenuListItem(
//          isSelected: isSelected,
          duration: Duration(milliseconds: 600),
          curve: Interval(
            animationIntervalStart,
            animationIntervalEnd,
            curve: Curves.easeOut,
          ),
          menuController: controller,
          menuListItem: MenuListItem(
            title: widget.menu.menuItems[i].title,
            isSelected: isSelected,
            onTap: () {
              widget.onMenuItemSelected(widget.menu.menuItems[i].id);
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
//    print('Selcetd renderbox for y position: $selectorYTop');
// TODO:(8.7)Bring in the ItemSelector
    //TODO:(8.8) we need the actual Y values to let the selector slide up and down

    return ZoomScaffoldMenuController(
        builder: (BuildContext context, MenuController menuController) {
//          var shouldRenderSelector = true;
//      var actualYTop = selectorYTop;
//      var actualYBottom = selectorYBottom;
//      var selectorOpacity = 1.0;

//      if (menuController.menuState == MenuState.closing ||
//          menuController.menuState == MenuState.closed||selectorYTop == null) {
//        final RenderBox menuScreenBox = context.findRenderObject() as RenderBox;
//        if (menuScreenBox != null) {
//          final menuScreenHeight = menuScreenBox.size.height;
//          actualYTop = menuScreenHeight - 50.0;
//          actualYBottom = menuScreenHeight;
//          selectorOpacity = 0.0;
//        } else {
//          actualYBottom = 0.0;
//          actualYTop = 0.0;
//          selectorOpacity = 0.0;
//        }
//      }else{
//        shouldRenderSelector = false;
//      }

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
//              shouldRenderSelector?
//              ItemSelector(
////                opacity: selectorOpacity,
////                topY: actualYTop,
////                bottomY: actualYBottom,
//                opacity: 1.0,
//                topY: selectorYTop,
//                bottomY: selectorYBottom,
//              ):Container(),
            ],
          ),
        ),
      );
    });
  }
}

//TODO:(8.3) give isSelected property to the AnimatedMenu to only get the selected RenderBox

class AnimatedMenuListItem extends ImplicitlyAnimatedWidget {
  final MenuController menuController;
  final MenuListItem menuListItem;
  final Duration duration;

//  final bool isSelected;

  AnimatedMenuListItem({
    this.menuController,
    this.duration,
    this.menuListItem,
//    this.isSelected,
    curve,
  }) : super(
          duration: duration,
          curve: curve,
        );

  @override
  _AnimatedMenuListItemState createState() => _AnimatedMenuListItemState();
}
//TODO:(8.1) Create a function to get the selected RenderBox from the RenderTree

class _AnimatedMenuListItemState
    extends AnimatedWidgetBaseState<AnimatedMenuListItem> {
  final closedSlidePosition = 200.0;
  final openSlidePosition = 0.0;
  Tween<double> _opacity;
  Tween<double> _translation;

//  updateSelectedRenderBox() {
//    final renderBox = context.findRenderObject() as RenderBox;
//    if (renderBox != null) {
////    if (renderBox != null && widget.isSelected) {
//      print(renderBox.localToGlobal(Offset(0.0, 0.0)));
////      (menuScreenKey.currentState as _MenuScreenState).selectedRenderBox =
////          renderBox;
//////      (menuScreenKey.currentState as _MenuScreenState)
//////        .setSelectedRenderBox(renderBox);
//    }
//  }

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
//    updateSelectedRenderBox();

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
