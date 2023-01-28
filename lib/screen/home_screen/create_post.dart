import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:nicu/component/button.dart';
import 'package:nicu/screen/home_screen/home.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? imageFile;
  TextEditingController textControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).splashColor,
        centerTitle: true,
        leading:  InkWell(
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
          child: Icon(
            Icons.arrow_back,
            size: 32,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        title: Text(
          ' Create Post',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).secondaryHeaderColor),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
                onTap: () {},
                child: Lottie.asset('asset/lottiefiles/add_post.json')),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.person,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'manal Hemida',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  // controller: textControl,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What is on your mind ....',
                    hintStyle: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                imageFile != null
                    ? Container(
                        height: 170,
                        width: double.infinity,
                        child: Center(
                          child: Image.file(
                            imageFile!,
                            width: 270,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    const Divider(
                                      height: 1,
                                      color: Colors.blue,
                                    ),
                                    ListTile(
                                      onTap: () {
                                        _openGallery(context);
                                      },
                                      title: Text("Gallery"),
                                      leading: const Icon(
                                        Icons.camera,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const Divider(
                                      height: 1,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      icon: Icon(
                        Icons.image_outlined,
                        color: Theme.of(context).secondaryHeaderColor,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    const Divider(
                                      height: 1,
                                      color: Colors.blue,
                                    ),
                                    ListTile(
                                      onTap: () {
                                        // BlocPage.get(
                                        //         context)
                                        //     .getImageSend();
                                        _openCamera(context);
                                      },
                                      title: Text("Camera"),
                                      leading: const Icon(
                                        Icons.camera,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const Divider(
                                      height: 1,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        color: Theme.of(context).secondaryHeaderColor,
                        size: 30,
                      )),
                  Expanded(child: Container()),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).splashColor,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            imageFile = null;
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).secondaryHeaderColor,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      final imageTemp = File(pickedFile.path);
      setState(() {
        imageFile = imageTemp;
      });
    } else {}

    Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final imageTemp = File(pickedFile.path);
      setState(() {
        imageFile = imageTemp;
      });
    } else {}

    Navigator.pop(context);
  }
}
