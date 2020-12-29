import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/foodItem.dart';
import 'package:Demo/pages/details_page.dart';

class foodCard extends StatelessWidget {

  final FoodItem foodItem;

  const foodCard({Key key, this.foodItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => details(foodItem: foodItem),
        ),
      );
    },
        child: Container(
          height: 620.0,
          width:(MediaQuery.of(context).size.width)*0.8,
          padding: EdgeInsets.all(10),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.orange[50],
                    child: Image.network(
                      foodItem.imgUrl,
                      width:(MediaQuery.of(context).size.width),
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                        child:Text(foodItem.title,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold),
                          maxLines: 2,)
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.motorcycle_outlined, size: 14),
                          ),
                          TextSpan(text: " ",),
                          TextSpan(
                              text: getTranslated(context,'within') +" "+ foodItem.time+" "+getTranslated(context,'mins'),
                              style: TextStyle(fontWeight: FontWeight.normal,
                                  fontSize: 12.0,color: Colors.black)),
                           ],
                      ),
                    ),
                  ]),
               SizedBox(height: 1,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text(foodItem.type,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12.0,color: Colors.grey)),
                 ],
               ),
               SizedBox(height: 1,),
               Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.tag_faces, size: 14,color:Colors.grey,),
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
                    Text(". "+getTranslated(context,'delevery')+": "+foodItem.fees,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.normal,
                            fontSize: 12.0,color: Colors.grey)),
                  ]),
            ],
          ),
        ));
  }
}

