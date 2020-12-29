import 'package:flutter/material.dart';
import 'package:Demo/models/foodItem.dart';

import 'foodCard.dart';
class foodItemContainer extends StatelessWidget{
  final FoodItem foodItem;
  foodItemContainer({this.foodItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackbar = SnackBar(
          content: Text("${foodItem.title} added to the cart"),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: foodCard(
        foodItem: foodItem,

        //leftAligned: (foodItem.id % 2 == 0) ? true : false,
      ),
    );
  }
}