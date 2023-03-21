import 'dart:async';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nicu/const/color.dart';
import 'package:nicu/screen/home_screen/first.dart';



class Verifying_Email extends StatefulWidget {
  const Verifying_Email({Key? key}) : super(key: key);

  @override
  State<Verifying_Email> createState() => _Verifying_EmailState();
}

class _Verifying_EmailState extends State<Verifying_Email> {
  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void initState() {
    user = auth.currentUser;
    user?.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      checkVerifyingEmail();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:  const BoxDecoration(
          image: DecorationImage(
              opacity :0.5,

            image:AssetImage("asset/Images/b.png"),
            fit: BoxFit.none,
          ),
        ),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             CircleAvatar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              radius: 60,
              child: const Icon(Icons.verified_outlined, size: 79),),
            const SizedBox(height: 40,),
             Padding(
               padding: const EdgeInsets.all(12.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text('We Send Verification Link To \n ${user?.email}',
                     textAlign: TextAlign.center,
                     style: GoogleFonts.vesperLibre(
                         color: Theme.of(context).secondaryHeaderColor,
                         fontSize: 24,
                         fontWeight: FontWeight.w600,


                     ),),
                 ],
               ),
             ),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () async {
                  LaunchApp.openApp(
                      androidPackageName:'com.google.android.gm',
                      openStore: true
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all(
                      GoogleFonts.acme(fontSize: 17)),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal:
                        MediaQuery
                            .of(context)
                            .size
                            .width / 4),),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(
                            color: Theme.of(context).secondaryHeaderColor, width:2)),
                  ),
                  elevation: MaterialStateProperty.all(3),
                ),
                child: Text(
                  'Check Your Email' ,
                  style: GoogleFonts.archivo(
                      color:Theme.of(context).secondaryHeaderColor ,
                      fontSize: 20,
                      fontWeight: FontWeight.w900
                  ),
                )),
          ],
        )),
      ),
    );
  }

  Future<void> checkVerifyingEmail() async {
    user = auth.currentUser;
    await user?.reload();
    if (user!.emailVerified) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  const HomePage()));
    }

  }

}
