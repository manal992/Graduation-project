import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'add_review.dart';
import 'apply.dart';
import 'component/cache_image.dart';
import 'component/reusable.dart';

class HospitalInfo extends StatefulWidget {
  @override
  _HospitalInfoState createState() => _HospitalInfoState();
}

class _HospitalInfoState extends State< HospitalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("asset/Images/doctor_pic2.png", height: 220),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 222,
                    height: 250,
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
                              "hospital name",
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                 InkWell(
                                   onTap :(){launchUrl(Uri.parse(
                                       'tel:/01000647350'));},
                                  child: Icon(
                                    Icons.call,
                                    color: Theme.of(context).secondaryHeaderColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("phone",
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
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('address',
                                    maxLines: 3,
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
                                Icon(
                                  Icons.timer_sharp,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('24 h',
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
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
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
                                width: 150,
                                height: 130,
                                url:
                                    'https://tinypng.com/images/social/website.jpg')),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text('Review',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color:Theme.of(context).secondaryHeaderColor)),
                            GestureDetector(
                              onTap: () {
                                // Navigator.of(context)
                                //     .push(
                                //     MaterialPageRoute(
                                //         builder: (
                                //             context) =>
                                //         const ProductReviewPage()));
                              },
                              child:   Text('view all',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                      color:Theme.of(context).secondaryHeaderColor
                                  ),
                                  textAlign: TextAlign.end),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      true
                          ? Column(
                              children: List.generate(2, (index) {
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
                                      const Text('12/2/2023',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey)),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Kareem',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                          createRatingBar(
                                              rating: double.parse('3'),
                                              size: 12),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      const Text('Good')
                                    ],
                                  )
                                ],
                              );
                            }))
                          : Container(),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16,  right: 16,top:22),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: <Widget>[

                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (
                                              context) =>
                                              RateScreen(

                                              )));
                                },
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color:Theme.of(context).secondaryHeaderColor,
                                    borderRadius:
                                    const BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:Theme.of(context).secondaryHeaderColor
                                              .withOpacity(
                                              0.5),
                                          offset: const Offset(
                                              1.1, 1.1),
                                          blurRadius: 10.0),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Add Review',
                                      textAlign: TextAlign
                                          .left,
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.w600,
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                        color:
                                        Colors.white,
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
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () { Navigator.push(context, MaterialPageRoute(builder:  (context)=>apply())); },
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        label: const Padding(
          padding: EdgeInsets.all(12),
          child: Text('Apply',style: TextStyle(fontSize: 18),),
        ),
        // child: const ,

      ),
    );
  }
}
