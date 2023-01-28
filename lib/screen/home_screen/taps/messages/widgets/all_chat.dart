
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicu/app_theme.dart';
import 'package:nicu/models/message_model.dart';




class AllChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      padding: const EdgeInsets.all(12),

      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),

            child: Row(
              children: [
                Text(
                  'All Chats',
                   style: TextStyle(fontSize: 20 ,color:Theme.of(context).secondaryHeaderColor
                       ,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: allChats.length,
              itemBuilder: (context, int index) {
                final allChat = allChats[index];
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2019/05/04/15/24/woman-4178302_960_720.jpg'),

                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                allChat.sender!.name,
                                style: MyTheme.heading2.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                allChat.text!,
                                style: MyTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            allChat.unreadCount == 0
                                ? Icon(
                                    Icons.done_all,
                                    color: MyTheme.bodyTextTime.color,
                                  )
                                : CircleAvatar(
                                    radius: 8,
                                    backgroundColor: MyTheme.kUnreadChatBG,
                                    child: Text(
                                      allChat.unreadCount.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              allChat.time!,
                              style: MyTheme.bodyTextTime,
                            )
                          ],
                        ),
                      ],
                    ));
              }, separatorBuilder: (BuildContext context, int index)=>Divider(color: Theme.of(context).splashColor,),)
        ],
      ),
    );
  }
}
