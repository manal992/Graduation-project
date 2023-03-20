import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../component/button.dart';
import '../sign_in/sign_in.dart';

class ForgetBassword extends StatefulWidget {
  const ForgetBassword({Key? key}) : super(key: key);

  @override
  State<ForgetBassword> createState() => _ForgetBasswordState();
}

class _ForgetBasswordState extends State<ForgetBassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(120))),

                //================== محتوي الصفحة =================

                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "FORGOT PASSWORD",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone),
                              hintText: "Phone Number",
                              hintStyle: const TextStyle(
                                fontSize: 18,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                           Text('We will send the password through the phone number '
                             ,style: TextStyle(color: Theme.of(context).secondaryHeaderColor),),
                          const SizedBox(
                            height: 40,
                          ),
                          DefaultButton(
                            text: 'RESET PASSWORD',
                            textColor: Theme.of(context).backgroundColor,
                            backGroundButton:
                            Theme.of(context).secondaryHeaderColor,
                            function: () { },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));
                              // Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_back ,
                                  color:Theme.of(context).secondaryHeaderColor ,
                                ),
                                const SizedBox(width: 2,),
                                Text('Back to login' ,style:TextStyle(color:Theme.of(context).secondaryHeaderColor
                                    ,fontSize: 17 ,
                                  fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                )),

          ],
        ));
  }
}
