import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nicu/controller/controller.dart';
import 'package:nicu/screen/forget_password_screen/forget_password.dart';
import 'package:nicu/screen/home_screen/first.dart';
import 'package:provider/provider.dart';
import '../../component/button.dart';
import '../nicu_chat/api/apis.dart';
import '../nicu_chat/helper/dialogs.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignInState();
  }
}

class SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool pass = true;
  late String _emailController;
  late String _passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 20),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: SvgPicture.asset(
            "asset/Images/b.svg",
            width: 200,
            height: 170,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 200),
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(120))),

            //================== محتوي الصفحة =================

            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          hintText: "Email",
                          hintStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (val) {
                          setState(() {
                            _emailController = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty || !val.contains('@')) {
                            return "Invalid email!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        obscureText: true,
                        scrollPadding: const EdgeInsets.all(5),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_rounded),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (val) {
                          setState(() {
                            _passwordController = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty || val.length <= 8) {
                            return "Password is too short!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ForgetBassword()));
                        },
                        child: Container(
                          height: 20,
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot password ?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      DefaultButton(
                        text: 'LOGIN',
                        textColor: Theme.of(context).backgroundColor,
                        backGroundButton:
                            Theme.of(context).secondaryHeaderColor,
                        function: () {
                          _submit();
                        },
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        "OR SIGN IN WITH ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: GestureDetector(
                              onTap: () {
                               _handleGoogleBtnClick();
                              },
                              child: Image.asset(
                                'asset/Images/2.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'asset/Images/1.svg.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'asset/Images/3.webp',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do you create new account ? ",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("signUp");
                              },
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    ));
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var user = await login();
      if (user != null) {
       context.read<ProviderController>().getCurrentLocation().whenComplete(() {
         Navigator.of(context).pushReplacement(
             MaterialPageRoute(builder: (context) => const HomePage()));
       });
      }
    } else {
      print('error');
      print('Not Valid');
    }

    // Sign user up
  }

  login() async {
    try {
      if (_emailController.isNotEmpty && _passwordController.isNotEmpty) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController, password: _passwordController);
        return userCredential;
      } else {
        print('isEmpty');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Attend  !',
          desc: 'This Account IsNot Exist',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      } else if (e.code == 'wrong-password') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Attend  !',
          desc: 'The password is Wrong',
          btnOkOnPress: () {},
        ).show();
      }
    } catch (e) {
      print(e);
    }
  }

  // handles google login button click
  _handleGoogleBtnClick() {
    //for showing progress bar
    Dialogs.showProgressBar(context);

    _signInWithGoogle().then((user) async {
      //for hiding progress bar
      Navigator.pop(context);

      if (user != null) {
        log('\nUser: ${user.user}');
        log('\nUserAdditionalInfo: ${user.additionalUserInfo}');

        if ((await APIs.userExists())) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomePage()));
        } else {
          await APIs.createUser().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomePage()));
          });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle: $e');
      Dialogs.showSnackbar(context, 'Something Went Wrong (Check Internet!)');
      return null;
    }
  }
}
