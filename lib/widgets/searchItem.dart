import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/foodItem.dart';

class searchItem extends StatelessWidget {

  final FoodItem foodItem;

  const searchItem({Key key,  this.foodItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(onTap: () {
      final snackbar = SnackBar(
        content: Text(" added to the cart"),
        duration: Duration(milliseconds: 550),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      },
        child: Container(
          //height: 110.0,
          width:(MediaQuery.of(context).size.width)*0.8,
          padding: EdgeInsets.only(left: 10,right: 10),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width:50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white10,border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        //color: Colors.grey,
                        child: Image.network(
                          foodItem.imgUrl,
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(foodItem.title,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 12.0,color: Colors.black)),
                              SizedBox(height:2),
                              Text(foodItem.type,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontWeight: FontWeight.normal,
                                      fontSize: 12.0,color: Colors.grey)),
                              SizedBox(height:2),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.tag_faces, size: 14,color:Colors.deepOrange,),
                                    ),
                                    TextSpan(
                                      text: " ",),
                                    TextSpan(
                                        text: foodItem.rate,
                                        style: TextStyle(fontWeight: FontWeight.normal,
                                            fontSize: 12.0,color: Colors.grey)),
                                  ],
                                ),
                              ),
                              SizedBox(height:2),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(Icons.motorcycle_rounded, size: 14,color:Colors.grey,),
                                          ),
                                          TextSpan(
                                            text: " ",),
                                          TextSpan(
                                              text:getTranslated(context,'within')+" "+ foodItem.time
                                                  +" "+getTranslated(context,'mins'),
                                              style: TextStyle(fontWeight: FontWeight.normal,
                                                  fontSize: 12.0,color: Colors.grey)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(". "+getTranslated(context,'delevery')+": "+foodItem.fees,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontWeight: FontWeight.normal,
                                            fontSize: 12.0,color: Colors.grey)),
                                  ]),
                              Divider(height: 2,color: Colors.black,),

                            ]),
                      ),
                    ),

                  ]),
              Divider(color: Colors.grey,),
            ],
          ),
        ));
  }
}

