
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).splashColor,
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).splashColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(  color:Theme.of(context).secondaryHeaderColor),
          const CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),
          ),
          const SizedBox(width: 20 * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text('Aya Amen', style: TextStyle(fontSize: 16 ,color:Theme.of(context).secondaryHeaderColor,)),
              Text('Active 3m ago', style: TextStyle(fontSize: 12 ,color:Theme.of(context).secondaryHeaderColor,))
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.call ,color:Theme.of(context).secondaryHeaderColor,)),
        IconButton(onPressed: () {}, icon:  Icon(Icons.videocam ,color:Theme.of(context).secondaryHeaderColor,)),
        const SizedBox(
          width: 20 / 2,
        )
      ],
    );
  }
}


