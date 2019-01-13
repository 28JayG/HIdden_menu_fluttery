import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/models/screen.dart';
import 'package:hidden_drawer_menu/screens/menu_screen.dart';

class ZoomScaffold extends StatefulWidget {
  final Screen contentScreen;
  final MenuScreen menuScreen;

  const ZoomScaffold({Key key, this.contentScreen, this.menuScreen})
      : super(key: key);

  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}
//TODO:(5.5.1)Introduce Curves to your Animation
class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
  //TODO:(5.2.1) init your menuController and don't forget to listen to it nad dispose it when done
//  MenuController menuController;
////  Curve scaleDownCurve = Interval(0.0, 0.3, curve: Curves.easeOut);
////  Curve slideDownCurve = Interval(0.0, 0.0, curve: Curves.easeOut);
////  Curve scaleUpCurve = Interval(0.0, 0.0, curve: Curves.easeOut);
////  Curve slideUpCurve = Interval(0.0, 0.0, curve: Curves.easeOut);
//
//
//  @override
//  void initState() {
//    super.initState();
//    menuController = MenuController(
//      vsync: this,
//    )..addListener(() {
//        setState(() {});
//      });
//  }
//
//  @override
//  void dispose() {
//    menuController.dispose();
//    super.dispose();
//  }

//TODO:(5.2.3)give the menu icon the power to toggle
  createContentDisplay() {
    return zoomAndSlide(
      Container(
        decoration: BoxDecoration(
          image: widget.contentScreen.backgroundImage,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              widget.contentScreen.title,
              style: TextStyle(
                fontFamily: 'bebas-neue',
                fontSize: 25.0,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print('Menu');
//                menuController.toggle();
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: widget.contentScreen.contentBuilder(context),
        ),
      ),
    );
  }
//TODO(5.5.2) Calculate new slide and scale
//TODO:(5.2.2) Control the zoomAndSlide
  zoomAndSlide(Widget content) {
    final slideAmount = 275.0 * menuController.openPercent;
    final scaleAmount = 1.0 - (0.2 * menuController.openPercent);
    final radiusLength = 10.0 * menuController.openPercent;

//    var scalePercent, slidePercent;
//    switch(menuController.menuState){
//      case MenuState.closed:
//        scalePercent = 0.0;
//        slidePercent = 0.0;
//        break;
//      case MenuState.closing:
//        scalePercent = scaleUpCurve.transform(menuController.openPercent);
//        slidePercent = slideUpCurve.transform(menuController.openPercent);
//        break;
//      case MenuState.open:
//        scalePercent = 1.0;
//        slidePercent = 1.0;
//        break;
//      case MenuState.opening:
//        scalePercent = scaleDownCurve.transform(menuController.openPercent);
//        slidePercent = slideDownCurve.transform(menuController.openPercent);
//    }

//    final slideAmount = 275.0 * slidePercent;
//    final scaleAmount = 1.0 - (0.2 * scalePercent);
//    final radiusLength = 10.0 * menuController.openPercent;

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(scaleAmount, scaleAmount),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x88000000),
              spreadRadius: 10.0,
              blurRadius: 20.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radiusLength),
          child: content,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.menuScreen,
        createContentDisplay(),
      ],
    );
  }
}

//TODO:(5.1) make a MenuController that notifies whenever state changes

//enum MenuState {
//  open,
//  closed,
//  opening,
//  closing,
//}

//TODO:(5.3.1)Build a widget that finds the MenuContoller and gives it to the menu

//class ZoomScaffoldMenuController extends StatelessWidget {
//  final ZoomScaffoldBuilder builder;
//
//  const ZoomScaffoldMenuController({Key key, this.builder}) : super(key: key);
//
//  getMenuController(BuildContext context) {
//    final scaffoldState =
//        context.ancestorStateOfType(TypeMatcher<_ZoomScaffoldState>())
//            as _ZoomScaffoldState;
//
//    return scaffoldState.menuController;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return builder(context, getMenuController(context));
//  }
//}
//
//typedef Widget ZoomScaffoldBuilder(
//  BuildContext context,
//  MenuController menuController,
//);

//TODO:(5.4)Animate the Controller
//class MenuController extends ChangeNotifier {
//  double openPercent = 0.0;
//  MenuState menuState = MenuState.closed;
////  final TickerProvider vsync;
////  final AnimationController _animationController;
//
////  MenuController({this.vsync})
////      : _animationController = AnimationController(vsync: vsync) {
////    _animationController
////      ..addListener(() {
////        notifyListeners();
////      })
////      ..duration = Duration(milliseconds: 250)
////      ..addStatusListener((AnimationStatus status) {
////        switch (status) {
////          case AnimationStatus.completed:
////            menuState = MenuState.open;
////            break;
////          case AnimationStatus.reverse:
////            menuState = MenuState.closing;
////            break;
////          case AnimationStatus.dismissed:
////            menuState = MenuState.closed;
////            break;
////          case AnimationStatus.forward:
////            menuState = MenuState.opening;
////        }
////        notifyListeners();
////      });
////  }
//
////  @override
////  dispose() {
////    _animationController.dispose();
////    super.dispose();
////  }
////
////  get openPercent {
////    return _animationController.value;
////  }
//
//  open() {
//    openPercent = 1.0;
//    menuState = MenuState.open;
//    notifyListeners();
//  }
//
//  close() {
//    openPercent = 0.0;
//    menuState = MenuState.closed;
//    notifyListeners();
//  }
//
////  open() {
////    _animationController.forward();
////  }
////
////  close() {
////    _animationController.reverse();
////  }
//
//  toggle() {
//    if (menuState == MenuState.open) {
//      close();
//    } else if (menuState == MenuState.closed) {
//      open();
//    }
//  }
//}
