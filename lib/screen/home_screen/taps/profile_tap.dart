import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String user = FirebaseAuth.instance.currentUser!.uid;
  String name='';
  String email='';
  String? imageProfole;
  String  phone='';


  @override
  void initState() {
    getData();
    super.initState();
  }
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
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    elevation: 6,
                    color: Theme.of(context).splashColor,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).splashColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),
                                radius: 25,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                     name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .secondaryHeaderColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                         email,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .secondaryHeaderColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text( phone,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('kom_hamada,elbehera',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor)),
                                    ],
                                  ),
                                  SizedBox(
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
                ),
                FutureBuilder(
                  future: getPosts(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      List data= snapshot.data as List;
                      print(data);
                      return ListView.builder(
                        padding:const EdgeInsets.symmetric(horizontal: 10),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          data[index]['name'],
                                          style: TextStyle(
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
                                Text(data[index]['Description'] ,
                                  style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold ,),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                data[index]['imageurl'] !='null'? Image.network(data[index]['imageurl']):Container(),


                                const SizedBox(
                                  height: 15,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.favorite_border_outlined),
                                        const Text('50'),
                                      ],
                                    ),
                                    Center(
                                      child: Container(
                                        width: 2,
                                        height: 25,
                                        decoration:
                                        const BoxDecoration(color: Colors.grey),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.mode_comment_outlined),
                                        const Text('7'),
                                      ],
                                    ),
                                    Center(
                                      child: Container(
                                        width: 2,
                                        height: 25,
                                        decoration:
                                        const BoxDecoration(color: Colors.grey),
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
                    }else{
                      return const CircularProgressIndicator();
                    }
                  },)
              ],
            ),
          ),
        ));
  }

  getPosts() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("Post").where('user', isEqualTo: user).get();
    return qn.docs;
  }

  getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user)
        .get()
        .then((value) {
      setState(() {
        name = value['Username'];
        imageProfole = value['Image'];
        email = value['Email'];
        phone = value['Phone'];
      });
    });
  }
}
