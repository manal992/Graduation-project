import 'package:flutter/material.dart';

import 'ChatMessage.dart';



class VideoMessage extends StatelessWidget {
  const VideoMessage({super.key, required this.message});
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: AspectRatio(
          aspectRatio: 1.6,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network('https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),
          ),
        ));
  }
}
