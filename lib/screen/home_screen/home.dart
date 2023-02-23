import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nicu/screen/home_screen/advice/advice.dart';
import 'package:nicu/screen/home_screen/taps/home_tap.dart';
import 'package:nicu/screen/home_screen/taps/messages/chats_tap.dart';
import 'package:nicu/screen/home_screen/taps/notifcation_tap.dart';
import 'package:nicu/screen/home_screen/taps/profile_tap.dart';
import 'package:nicu/screen/map/map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Widget> page = [
  const HomeTap(),
  const Notifcation(),
  MapPage(),
  Chats(),
  const Profile(),
];

List<String> title = [
  'NICU',
  'Notification',
  'Map',
  'Chat',
  'Profile',
];

int index = 0;

class _HomeScreenState extends State<HomeScreen> {
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Advice()));
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
            Align(
              alignment: Alignment.bottomCenter,
              child: DiamondBottomNavigation(
                itemIcons: const [
                  Icons.home,
                  Icons.notifications,
                  Icons.message,
                  Icons.account_circle_outlined,
                ],
                centerIcon: Icons.place,
                selectedIndex: index,
                onItemPressed: (value) {
                  setState(() {
                    index = value;
                  });
                },
                selectedColor: Colors.grey.shade400,
                unselectedColor: Colors.white,
                selectedLightColor: Theme.of(context).splashColor,
              ),
            ),
          ],
        ),
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
}
