import 'package:Demo/pages/homeSearch/placesSearch_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/localization/set_localization.dart';
import 'package:Demo/models/foodItem.dart';
import 'package:Demo/models/language.dart';
import 'package:Demo/routs/route_names.dart';
import 'package:Demo/widgets/foodCard.dart';
import 'package:Demo/widgets/foodItemContainer.dart';
import 'package:Demo/widgets/sideMenu.dart';

import '../main.dart';
import 'homeSearch/foodDetails_page.dart';
import 'homeSearch/homeDetails.dart';
import 'homeSearch/search_page.dart';
import 'login_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String deleverPlace ="" ;

  void updateInformation(String information) {
    setState(() => deleverPlace = information);
  }

  void moveToSearchPlacePage() async {
    final selectedPlace = await Navigator.push(context, MaterialPageRoute(builder: (context) => placesSearch()));
    print("new place $selectedPlace");
    setState(() {deleverPlace = selectedPlace;});
    //updateInformation(selectedPlace);
  }
  @override
  void initState() {
    super.initState();
    deleverPlace="uuuuuuuuuuuuuuuuuuuu";
  }
  @override
  Widget build(BuildContext context) {
    deleverPlace =getTranslated(context,'selectPlace') ;
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        drawer: sideMenu(),
        appBar: AppBar(
          centerTitle: true,
          //backgroundColor: Colors.transparent,
          //elevation: 0.0,
          title:GestureDetector(
            onTap: () =>moveToSearchPlacePage() ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                 getTranslated(context,'deleverTo'),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.normal,
                      color:Colors.grey,fontSize: 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center,
                 children: <Widget>[
                   Text(
                      deleverPlace,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.normal,
                          color:Colors.deepOrange,fontSize: 14),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                     color: Colors.deepOrange,
                   ),

              ],
            ),
            ]),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => searchPage())
                  );
                },
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
            child: Expanded(
              child: ListView(
                children: <Widget>[
                  loginSection(),
                  SizedBox(height: 20.0,),
                  Text(
                    getTranslated(context,'whatWouldYouLikeToOrder'),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                  ),
                 orderSection(),
                  SizedBox(height: 20.0,),
                  Text(
                    getTranslated(context,'30Meals'),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                  ),
                  EGP30MealsList(),
                  SizedBox(height: 20.0,),
                  Text(
                    getTranslated(context,'groceriesAndMore'),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                  ),
                  EGP30MealsList(),
                  SizedBox(height: 20.0,),
                  Text(
                    getTranslated(context,'alldayDesserts'),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                  ),
                  EGP30MealsList(),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.deepOrange)),
                    onPressed: (

                        ) {},
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    child: Text(getTranslated(context,'viewAllRestaurant'),
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: roundedButton(" Yes ",  Colors.deepOrange,
                const Color(0xFFFFFFFF)),
          ),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: roundedButton(" No", Colors.grey,
                const Color(0xFFFFFFFF)),
          ),
        ],
      ),
    ) ??
        false;
  }
  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }
  Widget loginSection(){
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white10,border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
             Container(
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                  color: Colors.orange[100],
                ),
             child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),//.only(top: 6.0),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange, borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.white,
                    size: 20,
                  ),

                ),
                 Flexible(
                          child:Text(
                            getTranslated(context,'loginText'),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: TextStyle(fontSize: 12.0),
                            maxLines: 5,)
                      ),
            ],
          ),
             ),

          GestureDetector(onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => loginPage(),
              ),
            );
              },
               child: Container(
                 padding: EdgeInsets.all(8),
                   width: MediaQuery.of(context).size.width,
                 child: Text(
                   getTranslated(context,'login'),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.normal,
                      color: Colors.deepOrange,fontSize: 12),
            ),
               ),
             ),
   ])
    );
  }
  Widget orderSection(){
    return Container(
        padding: EdgeInsets.only(top:10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homeDetailsPage())
                );
              },
              child: Container(
                height: 180.0,
                width:(MediaQuery.of(context).size.width/2)-20 ,
                decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(10), color: Colors.deepOrange),
                child:  Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                      child: Image(image: AssetImage('assets/images/food1.jpg'),height: 120,fit:BoxFit.fill,)),
                    SizedBox(height: 20,),
                    Align(alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Text(
                          getTranslated(context,'food'),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12.0,color: Colors.white)),
                      ),
                    )
                  ],
                ),
              )),
              GestureDetector(
                  onTap: () { Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homeDetailsPage())
                  );            },
                  child: Container(
                    height: 180.0,
                    width:(MediaQuery.of(context).size.width/2)-20 ,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(10),
                        color: Colors.greenAccent[400]),
                    child:  Column(
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                            child: Image(image: AssetImage('assets/images/food2.jpg'),height: 120,fit:BoxFit.fill,)),
                        SizedBox(height: 20,),
                        Align(alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Text(
                                getTranslated(context,'groceries'),
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 12.0,color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  )),
            ])
    );
  }
  Widget EGP30MealsList(){
    //setState(() {deleverPlace = "dgdgdfagdsbfjsdfhjsd";});
    return Container(
      height: 185,
        child:  ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(height: 1,),
            for (var foodItem in foodItemList.foodItems)
              foodCard(foodItem: foodItem),
          ],
        )
        );
  }

  }


