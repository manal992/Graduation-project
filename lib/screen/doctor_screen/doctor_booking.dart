import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nicu/button.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? childrenName;
  final TextEditingController _birthday = TextEditingController();
  String? weight;
  int _value = 1;
  String? name;
  String? email;
  String? image;
  String? phone;
  String? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAE3D1),
      appBar: AppBar(
        backgroundColor: const Color(0xffEAE3D1),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Booking',
          style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.bold,
              fontSize: 22.0),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).secondaryHeaderColor),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          image: DecorationImage(
            image: AssetImage('asset/Images/b.png'), // background
            opacity: 0.3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.freepnglogos.com/uploads/doctor-png/doctor-bulk-billing-doctors-chapel-hill-health-care-medical-3.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 70.0,
                  ),
                  buildTextFormField(
                      hint: 'Name',
                      validate: () => (val) {
                            if (val!.isEmpty) {
                              return "ChildrenName is empty";
                            }
                            return null;
                          },
                      onSave: () => (val) {
                            setState(() {
                              childrenName = val;
                            });
                          },
                      onTap: () {},
                      label: 'Children Name',
                      sIcon: const Icon(Icons.done)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextFormField(
                      hint: 'Phone',
                      validate: () => (val) {
                            if (val!.isEmpty) {
                              return "Phone is empty";
                            }
                            return null;
                          },
                      onSave: () => (val) {
                            setState(() {
                              phone = val;
                            });
                          },
                      onTap: () {},
                      label: 'Phone',
                      sIcon: const Icon(Icons.done)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextFormField(
                      hint: 'Age',
                      type: TextInputType.number,
                      validate: () => (val) {
                            if (val!.isEmpty) {
                              return "Age is Empty ";
                            }
                            return null;
                          },
                      onSave: () => (val) {
                            setState(() {
                              weight = val;
                            });
                          },
                      onTap: () => () {},
                      label: 'Age',
                      sIcon: const Icon(Icons.done)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        // width: 120,
                        child: TextFormField(
                          enabled: false,
                          controller: _birthday,
                          style: GoogleFonts.arimo(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: "Select Date",
                            labelStyle: GoogleFonts.arimo(
                              fontSize: 20,
                              color: Colors.grey[700],
                            ),
                            // hintText: hint,
                            hintStyle: GoogleFonts.arimo(
                              fontSize: 19,
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.indigo.shade300, width: 1.2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.indigo.shade300, width: 1.2)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.indigo.shade300, width: 1.2),
                            ),
                            filled: false,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2222));
                          if (pickedDate != null) {
                            setState(() {
                              _birthday?.text =
                                  DateFormat('yyyy-mm-dd').format(pickedDate);
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                          activeColor: Theme.of(context).secondaryHeaderColor,
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = int.parse(value.toString());
                            });
                          }),
                      Text(
                        "Male",
                        style: GoogleFonts.arimo(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade300,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Radio(
                          value: 2,
                          activeColor: Theme.of(context).secondaryHeaderColor,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = int.parse(value.toString());
                            });
                          }),
                      Text(
                        "Female",
                        style: GoogleFonts.arimo(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MyButton(
                      title: 'Book',
                      color: Theme.of(context).secondaryHeaderColor,
                      onTap: () {
                        _submit();
                      },
                      color1: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField({
    required String hint,
    required String label,
    required Widget sIcon,
    TextInputType? type,
    required Function() validate,
    required Function() onSave,
    required Function() onTap,
    TextEditingController? controller,
  }) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      validator: validate(),
      onSaved: onSave(),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.arimo(
          fontSize: 20,
          color: Colors.grey[700],
        ),
        hintText: hint,
        hintStyle: GoogleFonts.arimo(
          fontSize: 19,
          color: Colors.grey[700],
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.indigo.shade300, width: 1.2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.indigo.shade300, width: 1.2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.indigo.shade300, width: 1.2),
        ),
        filled: false,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: sIcon,
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      getData();
      Navigator.of(context).pop();
    } else {}
  }

  getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      addData(value['name'], value['email'], value['image']);
    });
  }

  addData(String name, email, image) async {
    CollectionReference request =
        FirebaseFirestore.instance.collection('doctors');
    request.add({
      "Name": childrenName,
      "Weight": weight,
      "Birthday": _birthday!.text,
      "Gender": _value == 1 ? "Male" : "Female",
      'Email': email,
      'phone': phone,
      'name': name,
      'image': image
    });
  }
}
