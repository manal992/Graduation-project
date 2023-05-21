import 'package:flutter/material.dart';
import 'package:nicu/component/button.dart';
import 'package:nicu/screen/doctor_screen/doctor_booking.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List doctor=[
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية 6615132  ",
    },

    {
      "name":"hazem helal ",
      "image":"مدينة كفر الزيات، مركز كفر الزيات، الغربhttps://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.eatthis.com%2Fnews-doctors-beg-you-never-do-these-things%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAM     ية 6615132",
      "address":"RRF7+RP9، كفر الزيات، مدينة كفر الزيات، كفر الزيات،، مركز كفر الزيات، الغربية ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
    {
      "name":"Nader Nasr ",
      "image":"https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.menshealth.com%2Fhealth%2Fa40971698%2F5-questions-your-doctor-wishes-youd-ask%2F&psig=AOvVaw3uFm6f569sSVx21DkTtZZC&ust=1684768276229000&source=images&cd=vfe&ved=0CA4QjRxqFwoTCOibkIvZhv8CFQAAAAAdAAAAABAD",
      "address":"مدينة كفر الزيات، مركز كفر الزيات، الغربية  ",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Theme.of(context).splashColor,
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
        decoration:   const BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
         padding: EdgeInsets.all( 15),
        child: ListView.separated(itemBuilder:(context,index)=>Container(
          decoration: BoxDecoration(
            color:Theme.of(context).splashColor ,
            borderRadius:BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all( 10),
          child: Column(
            children: [
              Row(
                children: [
                   CircleAvatar(
                    backgroundImage: NetworkImage(doctor[index]['image']),
                  ),
                  const SizedBox(width: 10,),
                  Text(  doctor[index]['name'] , style:TextStyle(fontWeight:FontWeight.bold ,fontSize: 16 ,color:Theme.of(context).secondaryHeaderColor,),)
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.location_on ,
                  color:Theme.of(context).secondaryHeaderColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                    Text(doctor[index]['address'] )
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

            , separatorBuilder:(context , index)=>SizedBox(height: 10,), itemCount:doctor.length),
      ),
    );
  }
}
