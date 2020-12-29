import 'package:Demo/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'product_description.dart';
import 'product_info.dart';

class Body extends StatelessWidget {
  final Product product;

   Body({Key key, this.product}) : super(key: key);
  @override

  TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6),);

  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child:Column(
        children: [
          Stack(
           children: [
            FadeInImage.assetNetwork(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.40,
              placeholder:'assets/images/spinner.gif',
              fadeInDuration :const Duration(milliseconds: 300),
              image: product.image,
              alignment: Alignment.center,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              child: Container(height: 60,
                  width: MediaQuery.of(context).size.width,
                  color:Colors.black.withOpacity(0.4),
                child: Center(
                  child: Text(
                    product.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 12, //24
                    fontWeight: FontWeight.bold,
                    ),
              ),
                ))
            )
          ]),
          ProductDescription(
          product: product,),
       ],)
          /*Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width,
            child: Stack( children: [
              Positioned(top: 0,right: 0,
                child: Expanded(
                  child: Container(width:MediaQuery.of(context).size.width*0.6 ,color: Colors.grey[100],
                    child: Hero(
                      tag: product.id,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.fill,

                      ),),
                  ),
                ),
              ),
              Positioned(top:0,left: 0,
                child: Expanded(
                  child:Container(width:MediaQuery.of(context).size.width*0.2,color: Colors.grey[100],
                  child: Column(children: [
                    Text(product.category.toUpperCase(), style: lightTextStyle,textAlign: TextAlign.start),
                    SizedBox(height:10), //20
                    Text(
                      product.title,
                       textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12, //24
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:10), //20
                    Text("Form", style: lightTextStyle,textAlign: TextAlign.start),
                    SizedBox(height:10), //20
                    Text(
                      "\$${product.price}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12, //16
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:10), //20


                  ],),
                ),),
              ),

            ],),
          ),*/




      /*SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 7.5,
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: defaultSize * 37.8, //378
                  width: defaultSize * 36.4,
                ),
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}
