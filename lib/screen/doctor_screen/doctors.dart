import 'package:flutter/material.dart';
import 'package:nicu/component/button.dart';
import 'package:nicu/screen/doctor_screen/doctor_booking.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).splashColor,
        centerTitle: true,
        title: Text( 'Doctors',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).secondaryHeaderColor),
        ),

      ),
      body: Container(
        decoration:   BoxDecoration(
          color:Theme.of(context).secondaryHeaderColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
         padding: EdgeInsets.all( 15),
        child: ListView.separated(itemBuilder:(context,index)=>Container(
          decoration: BoxDecoration(
            color:Colors.white ,
            borderRadius:BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all( 10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://www.freepnglogos.com/uploads/doctor-png/doctor-bulk-billing-doctors-chapel-hill-health-care-medical-3.png'),
                  ),
                  SizedBox(width: 10,),
                  Text( 'Dr:Ahmed AbdElrahman' , style:TextStyle(fontWeight:FontWeight.bold ,fontSize: 16 ,color:Theme.of(context).secondaryHeaderColor,),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.location_on ,
                  color:Theme.of(context).secondaryHeaderColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('شارع المدارس , قسم شبين الكوم')
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.timer_sharp,
                    color:Theme.of(context).secondaryHeaderColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('02:00 pm To 10:00 pm')
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.price_check,
                    color:Theme.of(context).secondaryHeaderColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('150 EGP')
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100,
                    height: 40 ,
                    child: DefaultButton(text: 'Book',
                      function: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>Booking())) ; },
                      backGroundButton:Theme.of(context).secondaryHeaderColor,
                      textColor:Colors.white,),
                  )
                ],
              )

            ],
          ),
        )

            , separatorBuilder:(context , index)=>SizedBox(height: 10,), itemCount:100),
      ),
    );
  }
}
