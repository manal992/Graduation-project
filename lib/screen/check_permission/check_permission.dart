import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nicu/screen/sign_in/sign_in.dart';

import 'package:provider/provider.dart';
import '../../controller/controller.dart';
import '../home_screen/first.dart';
import '../map/map.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderController>(builder: (context, value, child) {
      return FutureBuilder(
        future: value.check(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('data${snapshot.data}');
              return SignIn();
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
      );
    });
  }
}
