
import 'package:flutter/material.dart';
import 'package:nicu/app_theme.dart';

import 'package:nicu/screen/home_screen/taps/messages/widgets/all_chat.dart';
import 'package:nicu/screen/home_screen/taps/messages/widgets/my_tab_bar.dart';


class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> with TickerProviderStateMixin {
  TabController? tabController;
  int currentTabIndex = 0;

  void onTabChange() {
    setState(() {
      currentTabIndex = tabController!.index;
      print(currentTabIndex);
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    tabController?.addListener(() {
      onTabChange();
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController?.addListener(() {
      onTabChange();
    });

    tabController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).splashColor,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          size: 32,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        title: Text(
          'Chats',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).secondaryHeaderColor),
        ),
      ),
      // backgroundColor: MyTheme.kPrimaryColor,
      body:   AllChats(),

    );
  }
}
