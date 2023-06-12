
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat/screens/Appiontment_screen.dart';
import 'package:hayat/screens/account_screen.dart';
import 'package:hayat/screens/center_screen.dart';
import 'package:hayat/screens/complaint_screen.dart';
import 'package:hayat/screens/home_screen.dart';
import 'package:hayat/screens/question_screen.dart';


import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

// PersistentTabController _controller;
//
// _controller = PersistentTabController(initialIndex: 0);
class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  List<Widget> _screens() {
    return [
      HomeScreen(),
      QuestionScreen(),
      CenterScreen(),
      ComplaintsScreen(),
      AccountScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.home,
          size: 21.sp,
        ),
        textStyle: TextStyle(fontSize: 10.sp),
        title: ("Home".tr()),
        contentPadding: 5.5,
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.question_circle,
          size: 21.sp,
        ),
        textStyle: TextStyle(fontSize: 10.sp),
        title: ("Questions".tr()),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Align(
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: .9.sign,
            child: Container(
              height: 48.h,
              width: 48.h,
              decoration: BoxDecoration(
                color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 2,
                      spreadRadius: .8,
                    )
                  ],
                  borderRadius: BorderRadius.circular(13.r),
                  //     border: Border.all(color: Colors.red),
                  // color: Colors.white,
                 ),
              child: Transform.rotate(
                angle: -.099.sign,
                child: Image(
                  fit: BoxFit.cover,
                    image: AssetImage(

                      'assets/WhatsApp_Image_2023-05-30_at_3.44.38_PM-removebg-preview.png',
                        ),
                  height: 100.h,
                  width: 100.h,
                ),
              ),
            ),
          ),
        ),
        activeColorPrimary: Colors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          FluentSystemIcons.ic_fluent_notebook_question_mark_regular,
          size: 21.sp,
        ),
        textStyle: TextStyle(fontSize: 10.sp),
        title: ("Complaints".tr()),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.person,
          size: 21.sp,
        ),
        textStyle: TextStyle(fontSize: 10.sp),
        title: ("Account".tr()),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: Colors.black54,
      ),
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarHeight: 68.h,


      backgroundColor: Color(0xff22D27F), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          false, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
padding: NavBarPadding.only(bottom: 10.h),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style16,
    );
  }
}
