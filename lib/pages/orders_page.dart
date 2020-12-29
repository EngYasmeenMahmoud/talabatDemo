import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/routs/route_names.dart';
import 'package:Demo/widgets/sideMenu.dart';

import 'details_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class ordersPage extends StatefulWidget {
  @override
  _ordersPageState createState() => _ordersPageState();
}

class _ordersPageState extends State<ordersPage> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()),
              ModalRoute.withName('/')
          );
    },
      child: Scaffold(
          drawer: sideMenu(),
          appBar: AppBar(
            title:Text(getTranslated(context, "orders")),
            centerTitle: true,
            //backgroundColor: Colors.transparent,
            //elevation: 0.0,
          ),
        body:  Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/myOrder.png'),
                         height: 100,width:100,fit:BoxFit.fill,alignment: Alignment.center,),
                  SizedBox(height: 20,),
                  Text(
                      getTranslated(context,'loginToSeaOrder'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.normal,color:Colors.black,
                          fontSize: 14)),
                   RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.deepOrange)),
                            onPressed: () {   Navigator.push(context, MaterialPageRoute(
                               builder: (context) => loginPage(),),);},
                            color: Colors.deepOrange,
                            textColor: Colors.white,
                            child: Text(getTranslated(context,'login'),
                                style: TextStyle(fontSize: 14)),
                          ),
                ],),
          ),
        ),

      ),
    );
  }
}

