import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class RateScreen extends StatefulWidget {
  String id;

  RateScreen({super.key, required this.id});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  String? review;
  double? rate;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              const AppHeader(),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(18.0 * 2),
                child: Column(
                  children: [
                    Image.asset(
                      'asset/Images/b.png',
                      width: 150,
                    ),
                    Text(
                      'Your Driver:',
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 18),
                    ),
                    Text(
                      '*****************',
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 100),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          rate = rating;
                        });
                        print(rate);
                      },
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mark,',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'How is your trip?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 15,
                                offset: Offset(0.0, 15.0),
                                color: Colors.grey)
                          ]),
                      child: TextFormField(
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter valid review';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            review = val;
                          });
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Additional comment',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            if(formKey.currentState!.validate()){
                              formKey.currentState!.save();
                              getData();
                              Navigator.pop(context);
                            }

                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      addData(widget.id, value['name'], value['email'], value['image']);
    });
  }

  addData(String id, String name, email, image) async {
    CollectionReference request = FirebaseFirestore.instance
        .collection('hospital')
        .doc(id)
        .collection('review');
    request.add({
      'review': review,
      'rate': rate!,
      'time': DateFormat('hh:mm a').format(DateTime.now()).toString(),
      'date': DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
      'image': image,
      'name': name,
      'uid': FirebaseAuth.instance.currentUser!.uid
    });
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: double.infinity,
        height: 400,
        color: Theme.of(context).splashColor,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 170);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
