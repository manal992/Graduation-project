import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../const/color.dart';

class AddComment extends ModalRoute {
  // variables passed from the parent widget
  final String title;
  final String description;
  final String name;
  final String image;
  final String id;

  // constructor
  AddComment({
    required this.title,
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  TextEditingController comm = TextEditingController();

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 3),
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).splashColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Add Comment',
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 20, top: 9, bottom: 5, right: 5),
                padding: const EdgeInsets.only(left: 20),
                width: double.maxFinite,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: ColorManager.primary),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: comm,
                        showCursor: true,
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Type something...',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 0,
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 0,
                          )),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.comment_bank,
                        size: 28,
                        color: ColorManager.primary,
                      ),
                      onPressed: () async {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent, //New
                            isScrollControlled: true, //New
                            context: context,
                            builder: (context) => buildSheet(context));
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        size: 28,
                        color: Colors.blue,
                      ),
                      onPressed: () async {
                        await addComment(id, comm.text, name, image);
                        Navigator.pop(context);
                        // sendPushMessage(
                        //     snapshot.data?.docs[index]
                        //         ['token'],
                        //     'ADD NEW COMMENT ON YOUR POST',
                        //     name!);
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // close the modal dialog and return some data if needed
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                label: const Text('Close'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // add fade animation
    return FadeTransition(
      opacity: animation,
      // add slide animation
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        // add scale animation
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      ),
    );
  }

  addComment(String id, String comment, String name, String image) async {
    var currentUser = FirebaseAuth.instance.currentUser?.uid;
    DocumentReference addPost =
        FirebaseFirestore.instance.collection('Post').doc(id);
    addPost.collection('comments').add({
      'name': name,
      'image': image,
      'id': currentUser,
      'description': comment,
      'time': DateFormat('hh:mm a').format(DateTime.now()).toString(),
      'date': DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
    });
  }

  Widget setupAlertDialogContainer(context, CollectionReference ss) {
    return StreamBuilder<QuerySnapshot>(
        stream: ss.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 4,
            ));
          }
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, i) => const Divider(
                color: Colors.black,
                thickness: 1.2,
                indent: 18,
                endIndent: 18,
              ),
              shrinkWrap: true,
              itemCount: snapshot.data!.size,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${snapshot.data?.docs[index]['name']}',
                        style: GoogleFonts.roboto(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '${snapshot.data?.docs[index]['time']}',
                        style: GoogleFonts.b612(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  leading: snapshot.data?.docs[index]['image'] != null
                      ? CircleAvatar(
                          radius: 23,
                          backgroundImage:
                              NetworkImage(snapshot.data?.docs[index]['image']),
                        )
                      : const CircleAvatar(
                          radius: 35,
                          child: Icon(Icons.person),
                        ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${snapshot.data?.docs[index]['date']}',
                        style: GoogleFonts.b612(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${snapshot.data?.docs[index]['description']}',
                        style: GoogleFonts.artifika(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Container(
              color: Colors.red,
              width: 200,
              height: 200,
            );
          }
        });
  }

  Widget buildSheet(context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6, //New
        maxChildSize: 0.9, // New
        minChildSize: 0.5, //New
        builder: (_, controller) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).splashColor,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(30))),
              padding: const EdgeInsets.all(16),
              child: ListView(
                //New
                controller: controller, //New
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(
                          'asset/Images/b.png',
                        ),
                      ),
                    ),
                  ),
                  setupAlertDialogContainer(
                      context,
                      FirebaseFirestore.instance
                          .collection('Post')
                          .doc(id)
                          .collection('comments'))
                ],
              ),
            ));
  }
}
