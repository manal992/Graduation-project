import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nicu/apply.dart';
import 'package:nicu/component/colors.dart';
import 'package:nicu/screen/doctor_screen/doctor_booking.dart';
import 'package:nicu/screen/doctor_screen/doctors.dart';
import 'package:nicu/screen/forget_password_screen/forget_password.dart';
import 'package:nicu/screen/home_screen/create_post.dart';
import 'package:nicu/screen/home_screen/first.dart';
import 'package:nicu/screen/home_screen/home.dart';
import 'package:nicu/screen/home_screen/taps/messages/chats_tap.dart';
import 'package:nicu/screen/home_screen/taps/messages/message_screen.dart';
import 'package:nicu/screen/sign_in/sign_in.dart';
import 'package:nicu/screen/sign_up/sign_up.dart';
import 'package:nicu/screen/splash_screen/splash.dart';
import 'screen/first_page/first_page.dart';
import 'package:localization/localization.dart';
import 'package:nicu/component/applocal.dart';
import 'package:nicu/screen/maps/map.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Map(),
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
      //-----------------localization--------------------
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("en", ""), Locale("ar", "")],
      localeResolutionCallback: (locales, supportedLocales) {
        if (locales != null) {
          for (Locale myLocale in supportedLocales) {
            if (myLocale.languageCode == locales.languageCode) {
              return locales;
            }
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
