import 'package:flutter/material.dart';
import 'package:nicu/screen/custom_drawer/drawer_user_controller.dart';
import 'package:nicu/screen/custom_drawer/home_drawer.dart';
import 'package:nicu/screen/drawer_screen/feedback_screen.dart';
import 'package:nicu/screen/drawer_screen/help_screen.dart';
import 'package:nicu/screen/drawer_screen/invite_friend_screen.dart';
import 'package:nicu/screen/home_screen/home.dart';

import '../doctor_screen/doctors.dart';
import '../request/requests.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget? screenView;

  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: DrawerUserController(
        screenIndex: drawerIndex,
        drawerWidth: MediaQuery.of(context).size.width * 0.75,
        onDrawerCall: (DrawerIndex drawerIndexdata) {
          changeIndex(drawerIndexdata);
          //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
        },
        screenView: screenView,
        //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const HomeScreen();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = InviteFriend();
          });
          break;
        case DrawerIndex.DOCTOR:
          setState(() {
            screenView = const Doctors();
          });
          break;
        case DrawerIndex.Request:
          setState(() {
            screenView = const Requests();
          });
          break;
        default:
          break;
      }
    }
  }
}
