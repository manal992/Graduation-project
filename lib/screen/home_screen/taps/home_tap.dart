import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:nicu/screen/add_comment/add_comment.dart';
import 'package:nicu/screen/home_screen/create_post.dart';
import 'package:nicu/screen/other_profile/other_profile.dart';

import '../../../const/color.dart';
import '../../../we_chat/helper/dialogs.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({Key? key}) : super(key: key);

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  CollectionReference posts = FirebaseFirestore.instance.collection('Post');
  User? user = FirebaseAuth.instance.currentUser;

  bool comment = false;
  int currentIndex = 0;
  TextEditingController comm = TextEditingController();
  Widget float = Container();
  String? name;
  String? imageProfile;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          FutureBuilder(
              future: getProfileData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  name = data['name'];
                  imageProfile = data['image'];
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: data['image'] != 'null'
                              ? NetworkImage(data['image'])
                              : const NetworkImage(
                                  'https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 95,
                          height: 50,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreatePost()));
                            },
                            decoration: InputDecoration(
                              hintText: "What's on your mind ?",
                              hintStyle: const TextStyle(
                                fontSize: 18,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          StreamBuilder<QuerySnapshot>(
            stream: posts.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  print(snapshot.data?.docs);
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
                                snapshot.data?.docs[index]['imageProfile'] !=
                                        'null'
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OtherProfile(
                                                          uid: snapshot.data
                                                                  ?.docs[index]
                                                              ['user'])));
                                        },
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(snapshot
                                              .data
                                              ?.docs[index]['imageProfile']),
                                        ),
                                      )
                                    : const CircleAvatar(
                                        child: Icon(Icons.person),
                                      ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data?.docs[index]['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(snapshot.data?.docs[index]['date']),
                                  ],
                                ),
                                Expanded(child: Container()),
                                Text(snapshot.data?.docs[index]['time']),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data?.docs[index]['Description'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            snapshot.data?.docs[index]['imageurl'] != 'null'
                                ? Image.network(
                                    snapshot.data?.docs[index]['imageurl'])
                                : Container(),
                            const SizedBox(
                              height: 15,
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                LikeButton(
                                  size: 25,
                                  isLiked: snapshot.data?.docs[index]['likes']
                                          [user!.uid] ??
                                      false,
                                  circleColor: const CircleColor(
                                      start: Color(0xff00ddff),
                                      end: Color(0xff0099cc)),
                                  bubblesColor: const BubblesColor(
                                    dotPrimaryColor: Color(0xff33b5e5),
                                    dotSecondaryColor: Color(0xff0099cc),
                                  ),
                                  likeBuilder: (bool isTaped) {
                                    return Icon(
                                      isTaped
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isTaped ? Colors.red : Colors.grey,
                                      size: 30,
                                    );
                                  },
                                  onTap: (isLiked) => onLikeButtonTapped(
                                      !isLiked,
                                      snapshot.data?.docs[index]['docID']),
                                ),
                                Center(
                                  child: Container(
                                    width: 2,
                                    height: 25,
                                    decoration:
                                        const BoxDecoration(color: Colors.grey),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(AddComment(
                                        title: 'This is a title',
                                        description:
                                            'Just some dummy description text',
                                        id: snapshot.data?.docs[index]['docID'],
                                        name: name!,
                                        image: imageProfile!));
                                  },
                                  child: const Icon(Icons.mode_comment_outlined),
                                ),
                                Container(
                                  width: 2,
                                  height: 25,
                                  decoration:
                                      const BoxDecoration(color: Colors.grey),
                                ),
                                InkWell(
                                    onTap: () async {
                                      await savePost(
                                          snapshot.data?.docs[index]['docID'],
                                          user!.uid);
                                      Dialogs.showSnackbar(
                                          context, 'Post Saved');
                                    },
                                    child: const Icon(Icons.save)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: snapshot.data?.docs.length,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }

  addLike(String id, bool val) async {
    String? currentUser = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection('Post')
        .doc(id)
        .get()
        .then((value) {
      DocumentReference addLike =
          FirebaseFirestore.instance.collection('Post').doc(id);
      addLike.set(
        {
          'likes': {'$currentUser': val}
        },
        SetOptions(merge: true),
      );
    });
  }

  Future<bool> onLikeButtonTapped(bool isLiked, String id) async {
    print(isLiked);
    await addLike(id, isLiked);

    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  Future getProfileData() async {
    String user = FirebaseAuth.instance.currentUser!.uid;
    var firestore = FirebaseFirestore.instance;
    CollectionReference qn = firestore.collection("users");
    DocumentReference itemIdRef = qn.doc(user);
    DocumentSnapshot itemIdSnapshot = await itemIdRef.get();
    print(itemIdSnapshot['name']);
    return itemIdSnapshot;
  }

  savePost(String id, String? userID) async {
    CollectionReference addUser =
        FirebaseFirestore.instance.collection('users');
    addUser.doc('$userID').set({
      "Posts": FieldValue.arrayUnion([id])
    }, SetOptions(merge: true));
  }

  addComment(String id, String comment, String name) async {
    var currentUser = FirebaseAuth.instance.currentUser?.uid;
    DocumentReference addPost =
        FirebaseFirestore.instance.collection('Post').doc(id);
    addPost.collection('comments').add({
      'name': name,
      'image': imageProfile,
      'iD': currentUser,
      'description': comment,
      'time': DateFormat('hh:mm a').format(DateTime.now()).toString(),
      'date': DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
    });
  }
}
