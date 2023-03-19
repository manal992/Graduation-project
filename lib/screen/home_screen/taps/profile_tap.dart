import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nicu/screen/nicu_chat/screens/home_screen.dart';

import '../../nicu_chat/api/apis.dart';
import '../../nicu_chat/helper/dialogs.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String user = FirebaseAuth.instance.currentUser!.uid;
  String name = '';
  String email = '';
  String? imageProfole;
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).splashColor,
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: getProfileData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      print(data['name']);
                      return Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          elevation: 6,
                          color: Theme.of(context).splashColor,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).splashColor,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: data['image'] != 'null'
                                          ? NetworkImage(data['image'])
                                          : const NetworkImage(
                                              'https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),
                                      radius: 25,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['name'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.email,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              data['email'],
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.call,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text('',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text('kom_hamada,elbehera',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),

                FutureBuilder(
                  future: getPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List data = snapshot.data as List;
                      print(data);
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: const BorderSide(color: Colors.grey)),
                          child: Container(
                            padding: const EdgeInsets.all(13),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35.0),
                                  topRight: Radius.circular(35.0)),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index]['name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(data[index]['date']),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Text(data[index]['time']),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data[index]['Description'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                data[index]['imageurl'] != 'null'
                                    ? Image.network(data[index]['imageurl'])
                                    : Container(),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.favorite_border_outlined),
                                        Text('50'),
                                      ],
                                    ),
                                    Center(
                                      child: Container(
                                        width: 2,
                                        height: 25,
                                        decoration: const BoxDecoration(
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.mode_comment_outlined),
                                        Text('7'),
                                      ],
                                    ),
                                    Center(
                                      child: Container(
                                        width: 2,
                                        height: 25,
                                        decoration: const BoxDecoration(
                                            color: Colors.grey),
                                      ),
                                    ),
                                    const Icon(Icons.save),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        itemCount: data.length,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }

  void _addChatUserDialog() {
    String email = '';

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              contentPadding: const EdgeInsets.only(
                  left: 24, right: 24, top: 20, bottom: 10),

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),

              //title
              title: Row(
                children: const [
                  Icon(
                    Icons.person_add,
                    color: Colors.blue,
                    size: 28,
                  ),
                  Text('  Add User')
                ],
              ),

              //content
              content: TextFormField(
                maxLines: null,
                onChanged: (value) => email = value,
                decoration: InputDecoration(
                    hintText: 'Email Id',
                    prefixIcon: const Icon(Icons.email, color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),

              //actions
              actions: [
                //cancel button
                MaterialButton(
                    onPressed: () {
                      //hide alert dialog
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.blue, fontSize: 16))),

                //add button
                MaterialButton(
                    onPressed: () async {
                      //hide alert dialog
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeChat()));
                      if (email.isNotEmpty) {
                        await APIs.addChatUser(email).then((value) {
                          if (!value) {
                            Dialogs.showSnackbar(
                                context, 'User does not Exists!');
                          }
                        });
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ))
              ],
            ));
  }

  getPosts() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn =
        await firestore.collection("Post").where('user', isEqualTo: user).get();
    return qn.docs;
  }

  Future getProfileData() async {
    var firestore = FirebaseFirestore.instance;
    CollectionReference qn = firestore.collection("users");
    DocumentReference itemIdRef = qn.doc(user);
    DocumentSnapshot itemIdSnapshot = await itemIdRef.get();
    print(itemIdSnapshot['name']);
    return itemIdSnapshot;
  }
}
