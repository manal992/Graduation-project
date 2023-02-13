import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nicu/screen/home_screen/first.dart';
import 'package:nicu/screen/home_screen/home.dart';
import 'package:nicu/screen/verifay/verifay_email.dart';
import '../../component/button.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late String _emailController;
  late String _passwordController;
  String? _phoneController;
  String? _nameController;
  CollectionReference? addUser;
  User? user = FirebaseAuth.instance.currentUser;

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
          child: SvgPicture.asset(
            "asset/Images/b.svg",
            width: 200,
            height: 170,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
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
                        "SIGN UP",
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
                          prefixIcon: Icon(Icons.person),
                          hintText: "Name",
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
                        keyboardType: TextInputType.name,
                        onSaved: (val) {
                          setState(() {
                            _nameController = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Invalid name!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone_in_talk_outlined),
                          hintText: "Phone Number",
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
                        keyboardType: TextInputType.phone,
                        onSaved: (val) {
                          setState(() {
                            _phoneController = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Invalid number!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
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
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        obscureText: true,
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
                        height: 20,
                      ),
                      DefaultButton(
                        text: 'SIGN UP',
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
                        "OR SIGN UP WITH",
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
                                print("gmail");
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
                            "Already a member ? ",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("signIn");
                              },
                              child: Text(
                                "SIGN IN",
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
      UserCredential response = await signUp();
      User? userID = FirebaseAuth.instance.currentUser;
      setState(() {
        user = userID;
      });
      await addDataEmail();
      if (response != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const  Verifying_Email()));
      }
      return;
    }
  }

  signUp() async {
    try {
      if (_emailController.isNotEmpty &&
          _passwordController.isNotEmpty &&
          _nameController!.isNotEmpty &&
          _phoneController!.isNotEmpty) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController, password: _passwordController);
        return userCredential;
      } else {}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Attend  !',
          desc: 'The password is weak',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      } else if (e.code == 'email-already-in-use') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Attend  !',
          desc: 'This Account is Already Exist',
          btnOkOnPress: () {},
        ).show();
      }
    } catch (e) {
      print(e);
    }
  }

  addDataEmail() async {
    addUser = FirebaseFirestore.instance.collection('users');
    addUser?.doc('${user?.uid}').set({
      'Email': _emailController,
      'Username': _nameController,
      'Phone': _phoneController,
      'ID': user?.uid,
      'Image': 'null'
    });
  }
}
