import 'package:flutter/cupertino.dart';
//https://picsum.photos/250?image=9
CategoryItemList categoryItemList = CategoryItemList(CategoryItems: [

  category(
    title: "50% Festival",
    imgUrl:"assets/images/im1.jpg",
  ),
  category(
    title: "Bubg Mobile",
    imgUrl:"assets/images/im2.jpg",
  ),
  category(
    title: "EGP Meals",
    imgUrl:"assets/images/im3.jpg",
  ),
  category(
    title: "Deals & Offers",
    imgUrl:"assets/images/im4.jpg",
  ),
  category(
    title: "OnLine Payment",
    imgUrl:"assets/images/im5.jpg",
  ),
  category(
    title: "Fast dilvery",
    imgUrl:"assets/images/im6.png",
  ),
  category(
    title: "new in talabat",
    imgUrl:"assets/images/visa.png",
  ),
]);

class CategoryItemList {
  List<category> CategoryItems;
  CategoryItemList({@required this.CategoryItems});
}
class category {

  String title;
  String imgUrl;

  category ({
    @required this.title,
    @required this.imgUrl,

  });
}
