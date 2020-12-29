import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/offers.dart';
import 'package:photo_view/photo_view.dart';

class offerDetailsPage extends StatefulWidget {
  final OfferItem offerItem;
  final int index;
  const offerDetailsPage({Key key, this.offerItem, this.index}) : super(key: key);

  @override
  _offerDetailsPageState createState() => _offerDetailsPageState(offerItem,index);
}

class _offerDetailsPageState extends State<offerDetailsPage> {
  OfferItem offerItem;
   int index;
  _offerDetailsPageState(this.offerItem, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, "details")),
          centerTitle: true,
        ),
        body:ListView(children: [
          FadeInImage.assetNetwork(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.40,
                      placeholder:'assets/images/spinner.gif',
                      fadeInDuration :const Duration(milliseconds: 300),
                      image: offerItem.imgUrl,
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                    ),
          SizedBox(height: 10,),
          Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(offerItem.title,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 14.0,color: Colors.black)),
                              Text(offerItem.price,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(fontWeight: FontWeight.normal,
                                      fontSize: 12.0,color: Colors.grey)),
                            ]),
                            FlutterRatingBarIndicator(
                              rating: offerItem.rate,
                              itemCount: 5,
                              itemSize: 15.0,
                              fillColor: Colors.deepOrange,
                              emptyColor: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Discription: ",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(fontWeight: FontWeight.normal,
                                fontSize: 14.0,color: Colors.black)),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.orange[50],border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(offerItem.description,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              maxLines: 10,
                              softWrap: true,
                              style: TextStyle(fontWeight: FontWeight.normal,
                                  fontSize: 12.0,color: Colors.grey[600])),
                        ),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton.icon(
                            onPressed: (){
                              final snackbar = SnackBar(
                                content: Text(getTranslated(context, "addedToCart")),
                                duration: Duration(milliseconds: 550),
                              );
                              Scaffold.of(context).showSnackBar(snackbar);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            label: Text(getTranslated(context, "addedToCart"),
                              style: TextStyle(color: Colors.white,fontSize: 12),),
                            icon: Icon(Icons.add_shopping_cart_outlined, color:Colors.white,size: 12,),
                            textColor: Colors.white,
                            splashColor: Colors.red,
                            color: Colors.deepOrange,),
                          SizedBox(width:10,),
                          RaisedButton.icon(
                            onPressed: (){
                              final snackbar = SnackBar(
                                content: Text(getTranslated(context, "addedToCart")),
                                duration: Duration(milliseconds: 550),
                              );
                              Scaffold.of(context).showSnackBar(snackbar);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            label: Text(getTranslated(context, "addedToFav"),
                              style: TextStyle(color: Colors.white,fontSize: 12),),
                            icon: Icon(Icons.favorite_border_outlined, color:Colors.white,size: 12,),
                            textColor: Colors.white,
                            splashColor: Colors.red,
                            color: Colors.deepOrange,),

                        ],)
                      ],
                    ),
                  ),
                ],),
          );
  }
}
