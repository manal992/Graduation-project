import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicu/component/applocal.dart';
import 'package:nicu/main.dart';



Widget notes() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    constraints: const BoxConstraints(minHeight: 70, minWidth: 85),
    margin: const EdgeInsets.fromLTRB(8, 0, 8, 60),
    padding: const EdgeInsets.all(5),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            color: Colors.red[500],
            size: 12,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            '${getLang(navigatorKey.currentContext!, "currentLocation")}',
            style: const TextStyle(fontSize: 12, color: Colors.black),
          )
        ],
      ),
      const SizedBox(
        height: 3,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            color: Colors.green[500],
            size: 12,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            '${getLang(navigatorKey.currentContext!, "governmentHospital")}',
            style: const TextStyle(fontSize: 12, color: Colors.black),
          )
        ],
      ),
      const SizedBox(
        height: 3,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            color: Colors.yellow[500],
            size: 12,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            '${getLang(navigatorKey.currentContext!, "charityCenter")}',
            style: const TextStyle(fontSize: 12, color: Colors.black),
          )
        ],
      ),
      const SizedBox(
        height: 3,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            color: Colors.blue[700],
            size: 12,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            '${getLang(navigatorKey.currentContext!, "specialCenter")}',
            style: const TextStyle(fontSize: 12, color: Colors.black),
          )
        ],
      )
    ]),
  );
}
