import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../component/button.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 45),
          height: double.infinity,
          width: double.infinity,
          decoration:
              BoxDecoration(color: Theme.of(context).secondaryHeaderColor),
          child: SvgPicture.asset(
            "asset/Images/b.svg",
            width: 250,
            height: 200,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 260),
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(120))),
          child: Column(

            children: [
              const SizedBox(
                height: 110,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).splashColor,
                  border: Border.all(
                      width: 3, color: Theme.of(context).primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                ),
                child: Text("We Hope To Be Healthy",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).secondaryHeaderColor)),
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(
                    text: 'SIGN IN',
                    textColor:Theme.of(context).splashColor ,
                    backGroundButton:Theme.of(context).secondaryHeaderColor ,
                    function: (){
                      Navigator.of(context).pushNamed("signIn");
                    },
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  DefaultButton(
                    text: 'SIGN UP',
                    textColor: Theme.of(context).secondaryHeaderColor,
                    backGroundButton: Theme.of(context).splashColor,
                    function: () {
                      Navigator.of(context).pushNamed("signUp");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
