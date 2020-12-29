import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/offers.dart';
import 'package:Demo/pages/offerDetails_page.dart';
import 'package:transparent_image/transparent_image.dart';


class offerCard extends StatelessWidget {

  final OfferItem offerItem;
  final int index;

  const offerCard({Key key,  this.offerItem, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(onTap: () {
      Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => offerDetailsPage(offerItem: offerItem,index:index),
        ),
      );
    },
        child:Container(
            width:(MediaQuery.of(context).size.width)*0.8,
            padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 5,right: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width:50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10)),
                                    //color: Colors.grey,
                                    child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: FadeInImage.assetNetwork(
                                          placeholder:'assets/images/spinner.gif',
                                          fadeInDuration :const Duration(milliseconds: 700),
                                          image: offerItem.imgUrl,alignment: Alignment.center,
                                        ),
                                      ),
                                  ),
                                ),
                              ),
                              Flexible(child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(offerItem.title,
                                                            textAlign: TextAlign.start,
                                                            overflow: TextOverflow.clip,
                                                            softWrap: true,
                                                            maxLines: 2,
                                                            style: TextStyle(fontWeight: FontWeight.bold,
                                                                fontSize: 12.0,color: Colors.black)),
                                                    SizedBox(height: 2,),
                                                    Text(offerItem.description,
                                                                     textAlign: TextAlign.start,
                                                                     overflow: TextOverflow.clip,
                                                                     maxLines: 2,
                                                                     softWrap: true,
                                                                     style: TextStyle(fontWeight: FontWeight.normal,
                                                                         fontSize: 12.0,color: Colors.grey)),
                                                    SizedBox(height: 2,),

                                                    Text(offerItem.type,
                                                          textAlign: TextAlign.start,
                                                          overflow: TextOverflow.clip,
                                                          softWrap: true,
                                                          maxLines: 2,
                                                          style: TextStyle(fontWeight: FontWeight.normal,
                                                              fontSize: 12.0,color: Colors.black)),
                                                    SizedBox(height: 2,),

                                                    Text(offerItem.price,
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(fontWeight: FontWeight.normal,
                                                            fontSize: 12.0,color: Colors.black)),
                                                  ]),),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,size: 12,),
                                tooltip: 'open details',
                                onPressed: () { Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context) => offerDetailsPage(offerItem: offerItem),
                                  ),
                                );
                                },
                              ),
                            ]),
          ),
    );
  }
}

