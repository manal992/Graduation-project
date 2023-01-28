import 'package:flutter/material.dart';

import 'ChatMessage.dart';



class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20 * 0.75, vertical: 20 / 2),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(message.isSender ? 1 : 0.4), borderRadius: BorderRadius.circular(30)),
      child: Text(
        message.text,
        style: TextStyle(color: message.isSender ? Colors.white : Theme.of(context).textTheme.bodyText1?.color),
      ),
    );
  }
}
