import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/foodItem.dart';
import 'package:Demo/models/offers.dart';

import 'homeSearch/search_page.dart';

class details extends StatefulWidget {
  final FoodItem foodItem;
  const details({Key key, this.foodItem}) : super(key: key);
  @override
  _detailsState createState() => _detailsState(foodItem);
}
class _detailsState extends State<details> {
  FoodItem foodItem;
  _detailsState(this.foodItem);

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     floatingActionButton: FloatingActionButton.extended(
         onPressed: () {
         },
         label: Text(getTranslated(context, "addedToCart"),style: TextStyle(color: Colors.white),),
         icon: Icon(Icons.add_shopping_cart_outlined,color:Colors.white),
         backgroundColor: Colors.orange[500],
       ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: <Widget>[
          firstHave(),
          DraggableScrollableSheet(
            builder: (BuildContext context, ScrollController scrollController){
              return Container(
                color: Colors.white,
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: offerItemList.OfferItems.length,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(title : Text(offerItemList.OfferItems[index].title),
                        subtitle:Text(offerItemList.OfferItems[index].type ,style: TextStyle(fontSize: 12),) ,
                        trailing: Icon(Icons.arrow_forward_ios_outlined,size: 12));
                        //leading: Icon(Icons.add_box,size: 12,),);
                    }),
              );
            },
          )
    ],
    ),
    //),
    );
  }
  Widget firstHave() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
        Stack(children: [
          FadeInImage.assetNetwork(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.30,
            placeholder:'assets/images/loader.gif',
            fadeInDuration :const Duration(milliseconds: 300),
            image: foodItem.imgUrl,
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(onTap: ()
                 { Navigator.push(context,
                     MaterialPageRoute(builder: (context) => searchPage())
                 );
                 },
              child: Container(
                margin: const EdgeInsets.only(top:20,right: 5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20,
                ),

              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(onTap: () {Navigator.pop(context);},
              child: Container(
                margin: const EdgeInsets.only(top:20,left: 5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                  size: 20,
                ),

              ),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top:5,right: 5,left:5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text:this.foodItem.title,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,color: Colors.black)),
                      TextSpan(
                          text:"\n",
                          style: TextStyle(fontWeight: FontWeight.normal,
                              fontSize: 12.0,color: Colors.black)),
                      TextSpan(
                          text:foodItem.type,
                          style: TextStyle(fontWeight: FontWeight.normal,
                              fontSize: 12.0,color: Colors.grey)),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: RichText(
                      textAlign:TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:getTranslated(context,'info'),
                              style: TextStyle(fontWeight: FontWeight.normal,
                                  fontSize: 14.0,color: Colors.deepOrange)),
                          TextSpan(
                              text:"\n",
                              style: TextStyle(fontWeight: FontWeight.normal,
                                  fontSize: 12.0,color: Colors.black)),
                          TextSpan(
                              text:"",
                              style: TextStyle(fontWeight: FontWeight.normal,
                                  fontSize: 12.0,color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
                /* FlatButton(
                            child: Text(getTranslated(context,'info'), textAlign:TextAlign.start,
                              style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.normal,color: Colors.deepOrange),
                              ),
                          ),*/
              ]),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 5,left:5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.tag_faces_outlined, size: 14),
                      ),
                      TextSpan(text: " ",),
                      TextSpan(
                          text:foodItem.rate,
                          style: TextStyle(fontWeight: FontWeight.normal,
                              fontSize: 12.0,color: Colors.black)),
                    ],
                  ),
                ),
                FlatButton(
                  child: Text(getTranslated(context,'reviews'),
                    style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.normal,color: Colors.deepOrange),
                  ),
                ),

              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5,left:5),
          child: Divider(color: Colors.grey[100],),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5,left:5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.motorcycle_outlined, size: 14),
                      ),
                      TextSpan(text: " ",),
                      TextSpan(
                          text:getTranslated(context,'within')+" "+foodItem.time+" "+getTranslated(context,'mins')+"(EGP:00 delevery)",
                          style: TextStyle(fontWeight: FontWeight.normal,
                            fontSize: 12.0,color: Colors.black,)),
                    ],
                  ),
                ),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5,left:5),
          child: Divider(color: Colors.grey[100],),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(right: 5,left:5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.track_changes_outlined, size: 14,color: Colors.black,),
                    ),
                    TextSpan(text: " ",),
                    TextSpan(
                        text:'Free live tracking',
                        style: TextStyle(fontWeight: FontWeight.normal,
                            fontSize: 12.0,color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
          Padding(
            padding: const EdgeInsets.only(right: 5,left:5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.sim_card, size: 14,color: Colors.pinkAccent,),
                      ),
                      TextSpan(text: " ",),
                      TextSpan(
                          text:getTranslated(context,'discount'),
                          style: TextStyle(fontWeight: FontWeight.normal,
                              fontSize: 12.0,color: Colors.pinkAccent)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        Padding(key:ValueKey('Padding'),
          padding: const EdgeInsets.only(right: 5,left:5),
          child: Divider(color: Colors.grey[100],),
        ),
      ],
      ),
    );
  }
}
