import 'dart:async';
import 'package:easyshop/utils/mycolors.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    return Scaffold(
      backgroundColor: MyColors.bodyColor,
      body: Center(
        child: Image(image: AssetImage("assets/images/easyshop.png"),height: 160,width: 160,),
      ),
    );
  }
}
