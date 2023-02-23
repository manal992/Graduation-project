import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:nicu/controller/controller.dart';

import 'package:provider/provider.dart';

import '../../component/colors.dart';

import '../../component/custom_shape.dart';
import '../home_screen/first.dart';

import 'package:lottie/lottie.dart' as lo;

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  MapController mapController = MapController();

  Timer? timer;
  String typeHospital = 'all';
  List<Marker> mark = [];
  List type = [
    'governmentHospital',
    "charityCenter",
    "specialCenter",
  ];

  late AnimationController _controller;

  @override
  void initState() {
    mapController = MapController();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var x = Provider.of<ProviderController>(context);
    mark.clear;
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              FutureBuilder(
                  future: x.getMarkers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      x.sliderData.forEach((key, value) {
                        value.forEach((element) {
                          if (mark.isEmpty) {
                            mark.add(Marker(
                                width: 50,
                                height: 50,
                                point:
                                LatLng(element['lat'], element['long']),
                                builder: (BuildContext context) => Stack(
                                  children: [
                                    CustomPaint(
                                      size: const Size(180, 110),
                                      painter: RPSCustomPainter(
                                          color: Colors.red),
                                    ),
                                     Positioned(
                                      right: 11,
                                      top: 5,
                                      child: Icon(
                                        IconDataSolid(int.parse('0xf0f8')),
                                        color: Colors.white,
                                        size: 22.0,
                                      ),
                                    ),
                                  ],
                                )));
                          } else {
                            mark.clear;
                            mark.add(Marker(
                                width: 50,
                                height: 50,
                                point:
                                LatLng(element['lat'], element['long']),
                                builder: (BuildContext context) => Stack(
                                  children: [
                                    CustomPaint(
                                      size: const Size(180, 110),
                                      painter: RPSCustomPainter(
                                          color: Colors.red),
                                    ),
                                    const Positioned(
                                      right: 11,
                                      top: 5,
                                      child: Icon(
                                        Icons.local_hospital,
                                        color: Colors.white,
                                        size: 27.0,
                                      ),
                                    ),
                                  ],
                                )));
                          }
                          // if(typeHospital == 'all'){
                          //   if (mark.isEmpty) {
                          //     mark.add(Marker(
                          //         width: 50,
                          //         height: 50,
                          //         point:
                          //         LatLng(element['lat'], element['long']),
                          //         builder: (BuildContext context) => Stack(
                          //           children: [
                          //             CustomPaint(
                          //               size: const Size(180, 110),
                          //               painter: RPSCustomPainter(
                          //                   color: Colors.red),
                          //             ),
                          //             const Positioned(
                          //               right: 11,
                          //               top: 5,
                          //               child: Icon(
                          //                 Icons.local_hospital,
                          //                 color: Colors.white,
                          //                 size: 27.0,
                          //               ),
                          //             ),
                          //           ],
                          //         )));
                          //   } else {
                          //     mark.clear;
                          //     mark.add(Marker(
                          //         width: 50,
                          //         height: 50,
                          //         point:
                          //         LatLng(element['lat'], element['long']),
                          //         builder: (BuildContext context) => Stack(
                          //           children: [
                          //             CustomPaint(
                          //               size: const Size(180, 110),
                          //               painter: RPSCustomPainter(
                          //                   color: Colors.red),
                          //             ),
                          //             const Positioned(
                          //               right: 11,
                          //               top: 5,
                          //               child: Icon(
                          //                 Icons.local_hospital,
                          //                 color: Colors.white,
                          //                 size: 27.0,
                          //               ),
                          //             ),
                          //           ],
                          //         )));
                          //   }
                          // }else if(typeHospital == 'governmentHospital'){
                          //   if (key == 'governmentHospital') {
                          //     if (mark.isEmpty) {
                          //       mark.add(Marker(
                          //           width: 50,
                          //           height: 50,
                          //           point:
                          //           LatLng(element['lat'], element['long']),
                          //           builder: (BuildContext context) => Stack(
                          //             children: [
                          //               CustomPaint(
                          //                 size: const Size(180, 110),
                          //                 painter: RPSCustomPainter(
                          //                     color: Colors.red),
                          //               ),
                          //               const Positioned(
                          //                 right: 11,
                          //                 top: 5,
                          //                 child: Icon(
                          //                   Icons.local_hospital,
                          //                   color: Colors.white,
                          //                   size: 27.0,
                          //                 ),
                          //               ),
                          //             ],
                          //           )));
                          //     } else {
                          //       mark.clear;
                          //       mark.add(Marker(
                          //           width: 50,
                          //           height: 50,
                          //           point:
                          //           LatLng(element['lat'], element['long']),
                          //           builder: (BuildContext context) => Stack(
                          //             children: [
                          //               CustomPaint(
                          //                 size: const Size(180, 110),
                          //                 painter: RPSCustomPainter(
                          //                     color: Colors.red),
                          //               ),
                          //               const Positioned(
                          //                 right: 11,
                          //                 top: 5,
                          //                 child: Icon(
                          //                   Icons.local_hospital,
                          //                   color: Colors.white,
                          //                   size: 27.0,
                          //                 ),
                          //               ),
                          //             ],
                          //           )));
                          //     }
                          //   }
                          // }else if(typeHospital == 'charityCenter'){
                          //   if (key == 'charityCenter') {
                          //     if (mark.isEmpty) {
                          //       mark.add(Marker(
                          //           width: 50,
                          //           height: 50,
                          //           point:
                          //           LatLng(element['lat'], element['long']),
                          //           builder: (BuildContext context) => Stack(
                          //             children: [
                          //               CustomPaint(
                          //                 size: const Size(180, 110),
                          //                 painter: RPSCustomPainter(
                          //                     color: Colors.red),
                          //               ),
                          //               const Positioned(
                          //                 right: 11,
                          //                 top: 5,
                          //                 child: Icon(
                          //                   Icons.local_hospital,
                          //                   color: Colors.white,
                          //                   size: 27.0,
                          //                 ),
                          //               ),
                          //             ],
                          //           )));
                          //     } else {
                          //       mark.clear;
                          //       mark.add(Marker(
                          //           width: 50,
                          //           height: 50,
                          //           point:
                          //           LatLng(element['lat'], element['long']),
                          //           builder: (BuildContext context) => Stack(
                          //             children: [
                          //               CustomPaint(
                          //                 size: const Size(180, 110),
                          //                 painter: RPSCustomPainter(
                          //                     color: Colors.red),
                          //               ),
                          //               const Positioned(
                          //                 right: 11,
                          //                 top: 5,
                          //                 child: Icon(
                          //                   Icons.local_hospital,
                          //                   color: Colors.white,
                          //                   size: 27.0,
                          //                 ),
                          //               ),
                          //             ],
                          //           )));
                          //     }
                          //   }
                          // }else if(typeHospital == 'specialCenter'){
                          //   if (key == 'specialCenter') {
                          //     if (mark.isEmpty) {
                          //       mark.add(Marker(
                          //           width: 50,
                          //           height: 50,
                          //           point:
                          //           LatLng(element['lat'], element['long']),
                          //           builder: (BuildContext context) => Stack(
                          //             children: [
                          //               CustomPaint(
                          //                 size: const Size(180, 110),
                          //                 painter: RPSCustomPainter(
                          //                     color: Colors.red),
                          //               ),
                          //               const Positioned(
                          //                 right: 11,
                          //                 top: 5,
                          //                 child: Icon(
                          //                   Icons.local_hospital,
                          //                   color: Colors.white,
                          //                   size: 27.0,
                          //                 ),
                          //               ),
                          //             ],
                          //           )));
                          //     } else {
                          //       mark.clear;
                          //       mark.add(Marker(
                          //           width: 50,
                          //           height: 50,
                          //           point:
                          //           LatLng(element['lat'], element['long']),
                          //           builder: (BuildContext context) => Stack(
                          //             children: [
                          //               CustomPaint(
                          //                 size: const Size(180, 110),
                          //                 painter: RPSCustomPainter(
                          //                     color: Colors.red),
                          //               ),
                          //               const Positioned(
                          //                 right: 11,
                          //                 top: 5,
                          //                 child: Icon(
                          //                   Icons.local_hospital,
                          //                   color: Colors.white,
                          //                   size: 27.0,
                          //                 ),
                          //               ),
                          //             ],
                          //           )));
                          //     }
                          //   }
                          // }
                        });
                      });
                      print(snapshot.data);
                      return FlutterMap(
                        key: ValueKey(MediaQuery.of(context).orientation),
                        options: MapOptions(
                          controller: mapController,
                          onMapCreated: (c) {
                            mapController = c;
                          },
                          maxZoom: 22,
                          minZoom: 3,
                          zoom: 8,
                          onPositionChanged: (center, val) {},
                          plugins: [
                            MarkerClusterPlugin(),
                            const LocationMarkerPlugin(),
                          ],
                          // center: LatLng(x.lat!, x.long!),
                          center: LatLng(30.635478259074432, 31.0902948107),
                          // interactiveFlags: InteractiveFlag.drag |
                          //     InteractiveFlag.pinchMove |
                          //     InteractiveFlag.pinchZoom
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'],
                          ),
                          MarkerLayerOptions(markers: [
                            ...mark,
                            Marker(
                              width: 100,
                              height: 100,
                              point: LatLng(x.lat!, x.long!),
                              builder: (ctx) => AnimatedBuilder(
                                  animation: CurvedAnimation(
                                      parent: _controller,
                                      curve: Curves.fastOutSlowIn),
                                  builder: (context, child) {
                                    return Stack(
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color:
                                                    Colors.green.withOpacity(1),
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                        lo.Lottie.network(
                                            'https://assets4.lottiefiles.com/packages/lf20_bgmlsv9w.json')
                                      ],
                                    );
                                  }),
                            ),
                          ]),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              Container(
                height: 240,
                decoration: const BoxDecoration(color: Colors.transparent),
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          elevation: 2,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 26,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                            },
                          ),
                        ),
                        Expanded(child: Container()),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          elevation: 2,
                          child: IconButton(
                            icon: const Icon(
                              Icons.search_sharp,
                              size: 26,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 40,
                        margin: const EdgeInsets.only(left: 15),
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                typeHospital = type[index];
                              });
                            },
                            icon: Icon(
                              Icons.local_hospital_outlined,
                              color: HexColor.fromHex('#3c3f41'),
                              size: 23,
                            ),
                            label: Text(
                              type[index],
                              style:
                                  TextStyle(color: HexColor.fromHex('#3c3f41')),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: const BorderSide(
                                            color: Colors.white)))),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Container(
              //     height: 140,
              //     margin: const EdgeInsets.symmetric(vertical: 20.0),
              //     child: FutureBuilder(
              //       future: context.read<LoginController>().getDataUser(),
              //       builder: (context, snapshot) {
              //         final map = context.read<LoginController>().userData;
              //         return buildPageView(x.sliderData, context, map);
              //       },
              //     ),
              //
              //     // ListView.builder(
              //     //   itemBuilder: (context, index) => Padding(
              //     //     padding: const EdgeInsets.all(8.0),
              //     //     child: GestureDetector(
              //     //       onTap: () async {
              //     //         Navigator.of(context).push(MaterialPageRoute(
              //     //             builder: (context) => shop(
              //     //                   id: x.sliderData[index]['id'],
              //     //                 )));
              //     //       },
              //     //       child: Container(
              //     //         decoration: const BoxDecoration(
              //     //           color: Colors.white,
              //     //           borderRadius: BorderRadius.only(
              //     //               topLeft: Radius.circular(25),
              //     //               topRight: Radius.circular(25)),
              //     //         ),
              //     //         child: Column(
              //     //           children: <Widget>[
              //     //             SizedBox(
              //     //               width: 290,
              //     //               height: 190,
              //     //               child: ClipRRect(
              //     //                 borderRadius: const BorderRadius.only(
              //     //                     topLeft: Radius.circular(25),
              //     //                     topRight: Radius.circular(25)),
              //     //                 child: Image(
              //     //                   fit: BoxFit.cover,
              //     //                   image:
              //     //                       NetworkImage(x.sliderData[index]['image']),
              //     //                 ),
              //     //               ),
              //     //             ),
              //     //             Row(
              //     //               children: [
              //     //                 Column(
              //     //                   children: <Widget>[
              //     //                     Text(
              //     //                       x.sliderData[index]['name'],
              //     //                       style: const TextStyle(
              //     //                           color: Color(0xff6200ee),
              //     //                           fontSize: 24.0,
              //     //                           fontWeight: FontWeight.w600),
              //     //                     ),
              //     //                     Row(
              //     //                       children: [
              //     //                         Text(
              //     //                           '${x.sliderData[index]['rate']}',
              //     //                           style: const TextStyle(
              //     //                               color: Colors.black54,
              //     //                               fontSize: 18.0,
              //     //                               fontWeight: FontWeight.w700),
              //     //                         ),
              //     //                         const SizedBox(
              //     //                           width: 10,
              //     //                         ),
              //     //                         Row(
              //     //                           children: [
              //     //                             SizedBox(
              //     //                                 height: 30,
              //     //                                 child: ListView.builder(
              //     //                                   scrollDirection:
              //     //                                       Axis.horizontal,
              //     //                                   shrinkWrap: true,
              //     //                                   itemCount: x.sliderData[index]
              //     //                                       ['rate'],
              //     //                                   itemBuilder: (context, index) =>
              //     //                                       const Icon(
              //     //                                     FontAwesomeIcons.solidStar,
              //     //                                     color: Colors.amber,
              //     //                                     size: 18.0,
              //     //                                   ),
              //     //                                 )),
              //     //                             SizedBox(
              //     //                                 height: 30,
              //     //                                 child: ListView.builder(
              //     //                                   scrollDirection:
              //     //                                       Axis.horizontal,
              //     //                                   shrinkWrap: true,
              //     //                                   itemCount: -(x.sliderData[index]
              //     //                                           ['rate']) +
              //     //                                       5,
              //     //                                   //  itemCount: 5-int.parse(p.sliderData[index]['rate']),
              //     //                                   itemBuilder: (context, index) =>
              //     //                                       const Icon(
              //     //                                     FontAwesomeIcons.star,
              //     //                                     color: Colors.amber,
              //     //                                     size: 18.0,
              //     //                                   ),
              //     //                                 )),
              //     //                           ],
              //     //                         ),
              //     //                       ],
              //     //                     ),
              //     //                   ],
              //     //                 ),
              //     //                 const SizedBox(
              //     //                   width: 49,
              //     //                 ),
              //     //                 InkWell(
              //     //                   onTap: () {
              //     //                     mapController.move(LatLng( double.parse(x.sliderData[index]['lat']),
              //     //                         double.parse(
              //     //                             x.sliderData[index]['long'])), 17);
              //     //                     // MapUtils.map(
              //     //                     //     double.parse(x.sliderData[index]['lat']),
              //     //                     //     double.parse(
              //     //                     //         x.sliderData[index]['long']));
              //     //                   },
              //     //                   child: const Card(
              //     //                     color: Colors.white,
              //     //                     elevation: 0,
              //     //                     child: Padding(
              //     //                       padding: EdgeInsets.all(12.0),
              //     //                       child: Icon(
              //     //                         FontAwesomeIcons.directions,
              //     //                         size: 40,
              //     //                         color: Colors.deepOrange,
              //     //                       ),
              //     //                     ),
              //     //                   ),
              //     //                 ),
              //     //               ],
              //     //             ),
              //     //             const Text(
              //     //               "Closed \u00B7 Opens 17:00 Thu",
              //     //               style: TextStyle(
              //     //                   color: Colors.black54,
              //     //                   fontSize: 18.0,
              //     //                   fontWeight: FontWeight.bold),
              //     //             ),
              //     //           ],
              //     //         ),
              //     //       ),
              //     //     ),
              //     //   ),
              //     //   itemCount: x.sliderData.length,
              //     //   scrollDirection: Axis.horizontal,
              //     // ),
              //   ),
              // ),
              Positioned(
                  bottom: 30,
                  right: 15,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    elevation: 2,
                    child: IconButton(
                      icon: const Icon(
                        Icons.my_location,
                        size: 26,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // x.endValue(true);
                        x.getCurrentLocation().whenComplete(() {
                          _animatedMapMove(LatLng(x.lat!, x.long!), 13);
                          // mapController.move(LatLng(x.lat!, x.long!), 13);
                        });
                        // mapController.move(LatLng(lat, long), 13);
                      },
                    ),
                  ))
            ],
          ),
        ),
        x.end
            ? Center(
                child: SizedBox(
                  width: 400,
                  height: 400,
                  child: lo.Lottie.network(
                      'https://assets1.lottiefiles.com/packages/lf20_gbfwtkzw.json'),
                ),
              )
            : Container()
      ],
    );
  }
}
