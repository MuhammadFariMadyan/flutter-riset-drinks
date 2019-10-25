import 'package:drinks_flutter_before/src/util/appTheme.dart';
import 'package:drinks_flutter_before/src/ui/home/home_screen.dart';
import 'package:drinks_flutter_before/src/ui/favorit/favoritScreen.dart';
import 'package:drinks_flutter_before/src/ui/aboutUs/aboutUsScreen.dart';
import 'package:drinks_flutter_before/src/ui/aboutApps/aboutAppsScreen.dart';
import 'package:drinks_flutter_before/src/ui/customDrawer/drawerUserController.dart';
import 'package:drinks_flutter_before/src/ui/customDrawer/homeDrawer.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = HomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.Favorit) {
        setState(() {
          screenView = FavoritScreen();
        });
      } else if (drawerIndex == DrawerIndex.AboutUs) {
        setState(() {
          screenView = AboutUsScreen();
        });
      } else if (drawerIndex == DrawerIndex.AboutApps) {
        setState(() {
          screenView = AboutAppsScreen();
        });
      } else if (drawerIndex == DrawerIndex.Exit) {
        setState(() {
          // Exit App
        });
      } else {
        //do in your way......
      }
    }
  }
}
