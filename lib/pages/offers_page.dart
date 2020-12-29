import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:Demo/models/foodItem.dart';
import 'package:Demo/models/offers.dart';
import 'package:Demo/widgets/offerCard.dart';
import 'package:Demo/widgets/searchItem.dart';
import 'package:Demo/widgets/sideMenu.dart';

import 'home_page.dart';
import 'login_page.dart';

class offersPage extends StatefulWidget {
  offersPage({Key key}) : super(key: key);

  @override
  _offersPageState createState() => _offersPageState();
}

class _offersPageState extends State<offersPage> {

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
          title:Text(getTranslated(context, "offers")),
          centerTitle: true,
          //backgroundColor: Colors.transparent,
          //elevation: 0.0,
        ),
        body:offerItemList.OfferItems.length==0?Container(color: Colors.black,): Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: AnimationLimiter(
            child:ListView.separated(
              itemCount: offerItemList.OfferItems.length,
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.grey,),
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: cart(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ),),
    );
  }


Widget cart(int index) {
  return offerCard(offerItem: offerItemList.OfferItems[index]);
}


}