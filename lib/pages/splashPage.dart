import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/pages/home_page.dart';
class splashPage extends StatefulWidget {
  @override
  _splashPageState createState() => _splashPageState();
}

class _splashPageState extends State<splashPage>  with SingleTickerProviderStateMixin {
  /*var _visible = true;
  AnimationController animationController;
  Animation<double> animation;*/

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  dispose() {
   // animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
   /* animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });*/
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body:Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Image.asset(
            'assets/images/splash1.gif',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.8,
            fit: BoxFit.fill,
          ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Order Us From Your Home', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
              fontSize: 30,fontFamily: 'Courgette'),textAlign:TextAlign.center,),
        ),
       /* Align(
            alignment: Alignment.bottomCenter,
            child:TyperAnimatedTextKit(
              text: ['Order Us From Your Home'],
              textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                  fontSize: 30,fontFamily: 'Courgette'),
              isRepeatingAnimation: false,
            )
*//*
            TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 10),
                totalRepeatCount: 0,
                text: ["Fast and delicious food"],
                textStyle:  TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                    fontSize: 20,fontFamily: 'Courgette'),

            ),
*//*
        )*/
      ],)

    );
  }
}
