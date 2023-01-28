import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 / 2),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 32,
                offset: const Offset(0, 4),
                color: const Color(0xff087949).withOpacity(0.3))
          ]),
      child: SafeArea(
          child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20 * 0.75),
              decoration: BoxDecoration(
                  color:Theme.of(context).splashColor.withOpacity(0.8) ,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Type Message'),
              ),
            ),
          ),
          SizedBox(width: 6 ),
          Icon(
            Icons.image,
              color:Theme.of(context).secondaryHeaderColor,
          ),
          const SizedBox(width: 20 / 4),
          Icon(
            Icons.send,
              color:Theme.of(context).secondaryHeaderColor
          ),
        ],
      )),
    );
  }
}
