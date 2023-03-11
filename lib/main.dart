import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nicu/screen/hospital_info/apply.dart';
import 'package:nicu/component/colors.dart';
import 'package:nicu/controller/controller.dart';
import 'package:nicu/screen/check_permission/check_permission.dart';
import 'package:nicu/screen/doctor_screen/doctor_booking.dart';
import 'package:nicu/screen/doctor_screen/doctors.dart';
import 'package:nicu/screen/forget_password_screen/forget_password.dart';
import 'package:nicu/screen/home_screen/create_post.dart';
import 'package:nicu/screen/home_screen/first.dart';
import 'package:nicu/screen/home_screen/home.dart';
import 'package:nicu/screen/home_screen/taps/messages/chats_tap.dart';
import 'package:nicu/screen/home_screen/taps/messages/message_screen.dart';
import 'package:nicu/screen/hospital_info/hospital_info.dart';
import 'package:nicu/screen/introduction_animation/introduction_animation_screen.dart';
import 'package:nicu/screen/map/map.dart';
import 'package:nicu/screen/sign_in/sign_in.dart';
import 'package:nicu/screen/sign_up/sign_up.dart';
import 'package:nicu/screen/splash_screen/splash.dart';
import 'package:provider/provider.dart';
import 'screen/first_page/first_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  HospitalInfo(),
        routes: {
          "signIn": (context) => SignIn(),
          "signUp": (context) => SignUp(),
          "firstPage": (context) => FirstPage()
        },
        themeMode: ThemeMode.system,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: HexColor.fromHex("#5F7EAA"),
          secondaryHeaderColor: HexColor.fromHex("#1C3879"),
          splashColor: HexColor.fromHex("#EAE3D1"),
          backgroundColor: Colors.white,
        ),
        darkTheme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.white),
      ),
    );
  }
}
