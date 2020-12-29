import 'package:Demo/models/Product.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    //double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width*0.024*0.8, //145
        decoration: BoxDecoration(
          color:Color(0xFFF3F6F8),// kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.024),
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/spinner.gif",
                      image: product.image,
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.024),
                child: Text(product.title,style: TextStyle(
                  fontSize: 12, //16
                  fontWeight: FontWeight.bold,
                ),)//TitleText(title: product.title),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.024/2),
              Text("\$${product.price}"),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
