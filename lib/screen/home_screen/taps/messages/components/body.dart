
import 'package:flutter/material.dart';

import 'ChatMessage.dart';
import 'chat_input_fields.dart';
import 'message.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        image:DecorationImage(image:AssetImage('asset/Images/b.png') ,
          opacity:0.6 ,
        )
      ),
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => Message(message: demeChatMessages[index]),
            ),
          )),
          const ChatInputField()
        ],
      ),
    );
  }
}
