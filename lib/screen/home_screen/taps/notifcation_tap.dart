import 'package:flutter/material.dart';

class Notifcation extends StatefulWidget {
  const Notifcation({Key? key}) : super(key: key);

  @override
  State<Notifcation> createState() => _NotifcationState();
}

class _NotifcationState extends State<Notifcation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: ListView.separated(itemBuilder:(context , index)=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),
            ),

            Column(

               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text('Manal Hemida' , style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width:5,),
                    Text('Commented on your post' ),
                  ],
                ),
                const Text('Just Now' , style: TextStyle(fontWeight: FontWeight.normal),),
              ],
            )
          ],
        )

            , separatorBuilder:(context , index)=> const Divider(), itemCount: 100),
      ),

    );
  }
}
