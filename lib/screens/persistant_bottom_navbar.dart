import 'package:e_commerce/screens/dashboard/cart_screen/cart.dart';
import 'package:e_commerce/screens/dashboard/fav_screen/fav.dart';
import 'package:e_commerce/screens/dashboard/home_screen/home.dart';

import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PersistantBottoNavbar extends StatefulWidget {
  const PersistantBottoNavbar({ Key? key }) : super(key: key);

  @override
  _PersistantBottoNavbarState createState() => _PersistantBottoNavbarState();
}

class _PersistantBottoNavbarState extends State<PersistantBottoNavbar> {

List<Widget> _buildScreens() {
        return [
          Home(),
          Cart(),
          Fav()
        ];
    }
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(Icons.home),
                title: ("Home"),
                 //textStyle:TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                activeColorPrimary: AppColors.appColor,
                inactiveColorPrimary: AppColors.greyOp9,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.shopping_bag),
                title:("Cart"),
                 //textStyle:TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                activeColorPrimary: AppColors.appColor,
                inactiveColorPrimary: AppColors.greyOp9,
            ),
             PersistentBottomNavBarItem(
                icon: Icon(Icons.favorite),
                title: ("Favorite"),
                //textStyle:TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                activeColorPrimary: AppColors.appColor,
                inactiveColorPrimary:AppColors.greyOp9,
            ),
        ];
    }
final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
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
        navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
 
      );
  }
}