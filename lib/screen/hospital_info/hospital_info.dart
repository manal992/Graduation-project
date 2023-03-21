import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../component/to_map.dart';
import 'add_review.dart';
import 'apply.dart';
import 'component/cache_image.dart';
import 'component/reusable.dart';

class HospitalInfo extends StatefulWidget {
  HospitalInfo({super.key, required this.uid});

  String uid;

  @override
  _HospitalInfoState createState() => _HospitalInfoState();
}

class _HospitalInfoState extends State<HospitalInfo> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).splashColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).splashColor,
          centerTitle: true,
          title: Text(
            'Hospital Information',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).secondaryHeaderColor),
          ),
        ),
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          ),
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: getProfileData(widget.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  print(widget.uid);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              data['profile'],
                              width: 160,
                              height: 170,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 222,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 18,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['name'],
                                      maxLines: 3,
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
                                        InkWell(
                                          onTap: () {
                                            launchUrl(Uri.parse(
                                                'tel:/${data['phone']}'));
                                          },
                                          child: const Icon(
                                            Icons.call,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(data['phone'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            MapUtils.map(
                                                double.parse('${data['late']}'),
                                                double.parse('${data['long']}'));
                                          },
                                          child: const Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text(data['address'],
                                              maxLines: 4,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.timer_sharp,
                                          color: Colors.blue,
                                          size: 30,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(data['open'],
                                            maxLines: 3,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 3,
                            color: Colors.white54,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Availability",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: data['availability'] == 'true'
                                    ? Colors.green
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(50)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Dr. Stefeni Albert is a cardiologist in Nashville & affiliated with multiple hospitals in the  area.He received his medical degree from Duke University School of Medicine and has been in practice for more than 20 years. ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 16),
                          height: 170,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            scrollDirection: Axis.horizontal,
                            itemCount: data['image'].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 2,
                                color: Colors.white,
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: buildCacheNetworkImage(
                                        width: 160,
                                        height: 130,
                                        url: data['image'][index])),
                              );
                            },
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 12),
                          padding: const EdgeInsets.all(16),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(5, 16, 5, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Review',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor)),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context)
                                        //     .push(
                                        //     MaterialPageRoute(
                                        //         builder: (
                                        //             context) =>
                                        //         const ProductReviewPage()));
                                      },
                                      child: Text('view all',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor),
                                          textAlign: TextAlign.end),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              true
                                  ? StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('hospital')
                                          .doc(widget.uid)
                                          .collection('review')
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Column(
                                              children: List.generate(
                                                  snapshot.data?.docs.length ?? 0,
                                                  (index) {
                                            return Column(
                                              children: [
                                                Divider(
                                                  height: 20,
                                                  color: Colors.grey[400],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        snapshot.data?.docs[index]
                                                            ['date'],
                                                        style: const TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey)),
                                                    const SizedBox(height: 4),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            snapshot.data
                                                                    ?.docs[index]
                                                                ['name'],
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        createRatingBar(
                                                            rating: snapshot.data
                                                                    ?.docs[index]
                                                                ['rate'],
                                                            size: 12),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(snapshot.data
                                                        ?.docs[index]['review'])
                                                  ],
                                                )
                                              ],
                                            );
                                          }));
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      })
                                  : Container(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 22),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RateScreen(
                                                        id: widget.uid,
                                                      )));
                                        },
                                        child: Container(
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(16.0),
                                            ),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor
                                                      .withOpacity(0.5),
                                                  offset: const Offset(1.1, 1.1),
                                                  blurRadius: 10.0),
                                            ],
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Add Review',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                letterSpacing: 0.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => apply(
                          id: widget.uid,
                        )));
          },
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          label: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Apply',
              style: TextStyle(fontSize: 18),
            ),
          ),
          // child: const ,
        ),
      ),
    );
  }

  Future getProfileData(String uid) async {
    var firestore = FirebaseFirestore.instance;
    CollectionReference qn = firestore.collection("hospital");
    DocumentReference itemIdRef = qn.doc(uid);
    DocumentSnapshot itemIdSnapshot = await itemIdRef.get();
    return itemIdSnapshot;
  }

  Future getProfileReview(String uid) async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore
        .collection("hospital")
        .doc(uid)
        .collection('review')
        .get();
    return qn.docs;
  }
}
