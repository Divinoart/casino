import 'package:casino/HomePage.dart';
import 'package:casino/NavDreaver.dart';
import 'package:casino/Search.dart';
import 'package:casino/const.dart';
import 'package:casino/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'Profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PersistentTabController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.appName),
        actions: [
          IconButton(icon: Icon(Provider.of<AppProvider>(context).theme == Constants.lightTheme? Icons.brightness_2 : Icons.brightness_high_rounded, ),
              onPressed: Provider.of<AppProvider>(context).theme == Constants.lightTheme?
                  () {
                Provider.of<AppProvider>(context, listen: false)
                    .setTheme(Constants.darkTheme, "dark");
              } : () {
                Provider.of<AppProvider>(context, listen: false)
                    .setTheme(Constants.lightTheme, "light");

              },)
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).primaryColor, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(5.0),
          colorBehindNavBar: Theme.of(context).primaryColor,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }


  List<Widget> _buildScreens() {
    return [
      HomePage(),
      About(),
      UserProfile(),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(Icons.home),
        ),
        title: ("Home"),
        iconSize: 20,
        textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        activeColorPrimary: Theme.of(context).accentColor,
        inactiveColorPrimary: Theme.of(context).textTheme.caption.color,
      ),
      PersistentBottomNavBarItem(
        onSelectedTabPressWhenNoScreensPushed: (){
          print("TAb Pressed");
        },
        textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        // onPressed: _build,
        icon: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Icon(Icons.info),
        ),
        title: ("About"),
        iconSize: 25,
        activeColorPrimary: Theme.of(context).accentColor,
        inactiveColorPrimary: Theme.of(context).textTheme.caption.color,
      ),
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(Icons.people_rounded),
        ),
        // onPressed: _build2,
        title: ("Account"),
        textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        iconSize: 20,
        activeColorPrimary: Theme.of(context).accentColor,
        inactiveColorPrimary: Theme.of(context).textTheme.caption.color,
      ),

    ];
  }


}
