import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<dynamic> notifications = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('asset/notifications.json');
    final data = await json.decode(response);

    setState(() {
      notifications = data['notifications']
          .map((data) => InstagramNotification.fromJson(data))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Activity",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('notification')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount:  snapshot.data!.size,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: const SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: notificationItem(snapshot.data?.docs[index]),
                      secondaryActions: <Widget>[
                        Container(
                            height: 60,
                            color: Colors.grey.shade500,
                            child: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )),
                        Container(
                            height: 60,
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete_outline_sharp,
                              color: Colors.white,
                            )),
                      ],
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  notificationItem(data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.orangeAccent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomLeft),
                      // border: Border.all(color: Colors.red),
                      shape: BoxShape.circle),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(data['image'])),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: data['title'],
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: data['body'],
                        style: const TextStyle(color: Colors.black)),
                    TextSpan(
                      text: '  20s',
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  ])),
                )
              ],
            ),
          ),
          Container(
              height: 35,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                  child:
                      Text('Follow', style: TextStyle(color: Colors.white)))),
        ],
      ),
    );
  }

  Future getNotification() async {
    var firestore = FirebaseFirestore.instance;
    CollectionReference qn = firestore.collection("users");
    CollectionReference itemIdRef = qn
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notification');
    return itemIdRef.get();
  }
}

class InstagramNotification {
  final String name;
  final String profilePic;
  final String content;
  final String postImage;
  final String timeAgo;
  final bool hasStory;

  InstagramNotification(this.name, this.profilePic, this.content,
      this.postImage, this.timeAgo, this.hasStory);

  factory InstagramNotification.fromJson(Map<String, dynamic> json) {
    return InstagramNotification(json['name'], json['profilePic'],
        json['content'], json['postImage'], json['timeAgo'], json['hasStory']);
  }
}
