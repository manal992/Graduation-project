import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:latlong2/latlong.dart';

class ProviderController extends ChangeNotifier {
  double? lat;
  double? long;
  List<Marker> hospitalMarkers = [];
  Map sliderData = {};

  bool checkLogin = false;
  String address = '';
  LocationPermission? locationPermission;
  bool result = false;
  Locale? lang = const Locale('ar');
  int? module;
  bool end = false;

  Future getMarkers() async {
    String url = 'https://j3o3r.mocklab.io/thing/8';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      Map data = json.decode(utf8.decode(res.bodyBytes));
      sliderData = data;
    } else {
      print("Error");
    }
    print(hospitalMarkers);
    // notifyListeners();
    return sliderData;
  }



  Future checkLocation() async {
    Geolocator.checkPermission().then((value) {
      if (value == LocationPermission.denied) {
        Geolocator.requestPermission().then((value) {
          if (value == LocationPermission.denied) {
            // Geolocator.requestPermission();
          } else if (value == LocationPermission.whileInUse) {
            locationPermission = LocationPermission.whileInUse;
            getCurrentLocation();
          } else {}
        });
      } else {
        locationPermission = LocationPermission.whileInUse;
        getCurrentLocation();
      }
    });
    return locationPermission;
  }

  Future<Position?> getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Position? lastPosition = await Geolocator.getLastKnownPosition();
    lat = lastPosition!.latitude;
    long = lastPosition.longitude;
    print(lat);
    print(long);
    end = false;
    // notifyListeners();
    return lastPosition;
  }

  Future checkEnternet() async {
    bool result1 = await InternetConnectionChecker().hasConnection;
    if (result1 == true) {
      print('Connection Done');
      // checkLocation();
    } else {
      print('Connection failed');
    }
    result = result1;
    // notifyListeners();
    return result;
  }

  void change(lat1, long1) {
    lat = lat1;
    long = long1;
    notifyListeners();
  }

  void getAddressInfo(double latAddress, double longAddress) async {
    String url =
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$latAddress&lon=$longAddress&accept-language=$lang';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      Map data = json.decode(res.body);
      if (data.isNotEmpty) {
        address = data['display_name'];
      }
    } else {
      print("Error");
    }
    notifyListeners();
  }
}
