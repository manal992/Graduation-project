import 'package:flutter/material.dart';

import '../hospital_info/hospital_info.dart';

class RequestItem extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String gender;
  final String birthDate;
  final String age;
  final String weight;
  final String id;
  final int status;

  const RequestItem({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.age,
    required this.weight,
    required this.birthDate,
    required this.status,
    required this.id,
  }) : super(key: key);

  @override
  State<RequestItem> createState() => _RequestItemState();
}

class _RequestItemState extends State<RequestItem> {
  final Color _color2 = const Color(0xff1D397A);

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(5.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).splashColor,
          border: Border.all(
            color: const Color(0xff1D397A),
            width: 6.0,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Text(
            widget.name,
            style: TextStyle(
                color: _color2, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15.0,
          ),
          dataItem(
              key: "Phone Number",
              value: widget.phoneNumber,
              textColor: _color2),
          const SizedBox(
            height: 8.0,
          ),
          dataItem(
              key: "Weight", value: "${widget.weight} Kg", textColor: _color2),
          const SizedBox(
            height: 8.0,
          ),
          dataItem(
              key: "Birth Date", value: widget.birthDate, textColor: _color2),
          const SizedBox(
            height: 8.0,
          ),
          dataItem(key: "Gender", value: widget.gender, textColor: _color2),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status:  ",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _color2,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible,
                  ),
                ),
                Expanded(
                  child: Container(
                      constraints: const BoxConstraints(minHeight: 10.0),
                      child: Row(
                        children: [
                          Text(
                            widget.status == 0
                                ? 'Waiting'
                                : widget.status == 1
                                    ? 'Accept'
                                    : 'Reject',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: _color2,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                          const SizedBox(width: 20,),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: widget.status == 0
                                    ? Colors.yellow
                                    : widget.status == 1
                                        ? Colors.green
                                        : Colors.red,
                                shape: BoxShape.circle),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HospitalInfo(
                                uid: widget.id,
                              )));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  'Hospital',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget dataItem(
      {required String key, required dynamic value, required Color textColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$key:  ",
            style: TextStyle(
              fontSize: 16.0,
              color: textColor,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.visible,
            ),
          ),
          Expanded(
            child: Container(
                constraints: const BoxConstraints(minHeight: 10.0),
                child: Text(
                  "${value}",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.visible,
                )),
          )
        ],
      ),
    );
  }

//
}
