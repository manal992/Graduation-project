import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nicu/screen/request/request_item.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(25.0),
        ),
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.all(12),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('requests')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              List hospitalData = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: hospitalData.length,
                  itemBuilder: (context, index) {
                    return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('hospital')
                            .doc(hospitalData[index]['hospital'])
                            .collection('Request')
                            .doc(hospitalData[index]['id'])
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            var hospitalData1 = snapshot.data;
                            return RequestItem(
                              name: hospitalData1['Name'],
                              phoneNumber: hospitalData1['phone'],
                              gender: hospitalData1['Gender'],
                              age: '',
                              weight: hospitalData1['Weight'],
                              birthDate: hospitalData1['Birthday'],
                              status: hospitalData1['isAccept'],
                              id: hospitalData[index]['hospital'],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        });
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
