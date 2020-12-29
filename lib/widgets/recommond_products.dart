import 'package:Demo/models/Product.dart';
import 'package:Demo/pages/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'product_card.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key key,
    this.products,
  }) : super(key: key);
  // Because our Api provie us list of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
   // double defaultSize = SizeConfig.defaultSize;
    return  Padding(
        padding: EdgeInsets.all(5), //20
        child:  GridView.builder(
            // We just turn off grid view scrolling
            shrinkWrap: true,
            physics:NeverScrollableScrollPhysics(),
            //physics:ScrollPhysics(),
            // just for demo
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
                 // SizeConfig.orientation == Orientation.portrait ? 2 : 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.693,
            ),
            itemBuilder: (context, index) => ProductCard(
                product: products[index],
                press: () {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ));
                }),
          ),
      );
  }
}
