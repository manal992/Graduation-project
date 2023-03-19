import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:nicu/screen/home_screen/advice/advice.dart';
import 'package:nicu/screen/home_screen/taps/home_tap.dart';
import 'package:nicu/screen/home_screen/taps/notification_page.dart';
import 'package:nicu/screen/home_screen/taps/profile_tap.dart';
import 'package:nicu/screen/map/map.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import '../../const/color.dart';
import '../../controller/controller.dart';
import '../nicu_chat/screens/home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> page = [
    const HomeTap(),
    const NotificationScreen(),
    const HomeChat(),
    const Profile(),
  ];

  List<String> title = [
    'NICU',
    'Notification',
    'Chat',
    'Profile',
  ];

  int index = 0;
  bool isMaped = false;

  late final FirebaseMessaging _fbm;
  late NotificationModel _notificationModel;

  @override
  void initState() {
    notificationConfigure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).splashColor,
        centerTitle: true,
        title: Text(
          title[index],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).secondaryHeaderColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {


                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Advice()));
                },
                child: Lottie.asset('asset/lottiefiles/advice1.json')),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: Stack(
          children: [
            page[index],
            !isMaped
                ? Container()
                : Center(
                    child: Lottie.network(
                        'https://assets6.lottiefiles.com/packages/lf20_usmfx6bp.json',
                        width: 300,
                        height: 300),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        rippleColor: Colors.grey.shade800,
        // tab button ripple color when pressed
        hoverColor: Colors.grey.shade700,
        // tab button hover color
        haptic: true,
        // haptic feedback
        tabBorderRadius: 10,

        // tab button border

        // tab button border
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 30)
        ],
        // tab button shadow
        curve: Curves.easeOutExpo,
        // tab animation curves
        duration: const Duration(milliseconds: 900),
        // tab animation duration
        gap: 12,
        // the tab button gap between icon and text
        color: Colors.grey[800],
        // unselected icon color
        activeColor: Theme.of(context).primaryColor,
        // selected icon and text color
        iconSize: 28,
        // tab button icon size
        tabBackgroundColor: Colors.purple.withOpacity(0.1),
        // selected tab background color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        // navigation bar padding
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.notifications_active_rounded,
            text: 'Notification',
          ),
          GButton(
            icon: Icons.message_rounded,
            text: 'Chat',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          )
        ],
        onTabChange: (index1) {
          setState(() {
            index = index1;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          setState(() {
            isMaped = true;
          });
          context
              .read<ProviderController>()
              .getCurrentLocation()
              .whenComplete(() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MapPage()));
            setState(() {
              isMaped = false;
            });
          });
        },
        child: const Icon(Icons.location_on),
      ),
      // bottomNavigationBar: DiamondBottomNavigation(
      //
      //   itemIcons: const [
      //     Icons.home,
      //     Icons.notifications,
      //     Icons.message,
      //     Icons.account_box,
      //   ],
      //   centerIcon: Icons.place,
      //   selectedIndex: 0,
      //   onItemPressed: (value) {},
      //
      // ),
    );
  }

  void notificationConfigure() async {
    _fbm = FirebaseMessaging.instance;
    NotificationSettings setting = await _fbm.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      provisional: false,
    );
    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((message) {
        NotificationModel notificationModel = NotificationModel(
          title: message.notification!.title,
          body: message.notification!.body,
          dateTilte: message.data['title'],
          dateBody: message.data['body'],
        );
        setState(() {
          _notificationModel = notificationModel;
        });
        showSimpleNotification(
          Text(
            _notificationModel.title!,
            style: GoogleFonts.b612(
                fontSize: 20, color: Colors.grey.shade700, fontWeight: FontWeight.w600),
          ),
          subtitle:  Text(_notificationModel.body!,style: const TextStyle(fontSize:18,color: Colors.grey),),
          trailing:  Icon(
            Icons.notifications_active,
            color: Theme.of(context).primaryColor,
          ),
          leading: Image.asset('asset/Images/b.png',width: 50,height: 50,),
          background:Theme.of(context).splashColor,
          contentPadding: const EdgeInsets.all(12),
          duration: const Duration(seconds: 4),
          slideDismiss: true,
        );
      });
    }
  }
}
