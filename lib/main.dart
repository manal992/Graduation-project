import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nicu/component/colors.dart';
import 'package:nicu/controller/controller.dart';
import 'package:nicu/screen/home_screen/first.dart';
import 'package:nicu/screen/sign_in/sign_in.dart';
import 'package:nicu/screen/sign_up/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nicu/screen/splash_screen/splash.dart';
import 'package:nicu/screen/verifay/verifay_email.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'screen/first_page/first_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();
late Size mq;

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
      child: OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FirebaseAuth.instance.currentUser == null
              ? const SplashScreen()
              : const HomePage(),


          routes: {
            "signIn": (context) => SignIn(),
            "signUp": (context) => SignUp(),
            "firstPage": (context) => FirstPage()
          },
          themeMode: ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: HexColor.fromHex("#5F7EAA"),
            secondaryHeaderColor: HexColor.fromHex("#1C3879"),
            splashColor: HexColor.fromHex("#EAE3D1"),
            backgroundColor: Colors.white,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.white,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
