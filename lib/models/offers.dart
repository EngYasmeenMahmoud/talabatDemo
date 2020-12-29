import 'package:flutter/cupertino.dart';
//https://picsum.photos/250?image=9
OfferItemList offerItemList = OfferItemList(OfferItems: [
  OfferItem(
    title: "Beach BBQ Burger",
    type: "off orders over 200 + Free Shipping orders over 200",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    price: "50 EGP + 20% Discount",
    rate:2,
    imgUrl:"https://cdn.pixabay.com/photo/2018/03/04/20/08/burger-3199088__340.jpg",

  ),
  OfferItem(
    title: "Several culinary fruits",
    type: "off orders over 200 + Free Shipping",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    price: "30 EGP + 50% Discount",
    rate:5,
    imgUrl:"https://www.beliefnet.com/columnists/doinglifetogether/wp-content/uploads/sites/258/2013/05/burger.jpg",
  ),
  OfferItem(
    title: "Beach BBQ Burger",
    type: "off orders over 200 + Free Shipping orders over 200",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    price: "70 EGP + 40% Discount",
    rate:5,
    imgUrl:"https://image.insider.com/5613ebd59dd7cc1d008bfa6b?width=700&format=jpeg&auto=webp",

  ),
  OfferItem(
    title: "Several culinary fruits",
    type: "off orders over 200 + Free Shipping",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    price: "100 EGP + 10% Discount",
    rate:3,
    imgUrl:"https://image.insider.com/5613ebd59dd7cc1d008bfa6b?width=700&format=jpeg&auto=webp",
  ),
  OfferItem(
    title: "Beach BBQ Burger",
    type: "off orders over 200 + Free Shipping orders over 200",
    description: "Receive Costway Email Alerts from Offers",
    price: "50 EGP + 20% Discount",
    rate:2,
    imgUrl:"https://cdn.pixabay.com/photo/2018/03/04/20/08/burger-3199088__340.jpg",

  ),
  OfferItem(
    title: "Several culinary fruits",
    type: "off orders over 200 + Free Shipping",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    price: "30 EGP + 50% Discount",
    rate:5,
    imgUrl:"https://www.beliefnet.com/columnists/doinglifetogether/wp-content/uploads/sites/258/2013/05/burger.jpg",
  ),
  OfferItem(
    title: "Beach BBQ Burger",
    type: "off orders over 200 + Free Shipping orders over 200",
    description: "Receive Costway Email Alerts from Offers",
    price: "70 EGP + 40% Discount",
    rate:5,
    imgUrl:"https://image.insider.com/5613ebd59dd7cc1d008bfa6b?width=700&format=jpeg&auto=webp",

  ),
  OfferItem(
    title: "Several culinary fruits",
    type: "off orders over 200 + Free Shipping",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    price: "100 EGP + 10% Discount",
    rate:3,
    imgUrl:"https://image.insider.com/5613ebd59dd7cc1d008bfa6b?width=700&format=jpeg&auto=webp",
  ),
  OfferItem(
    title: "Beach BBQ Burger",
    type: "off orders over 200 + Free Shipping orders over 200",
    description: "Receive Costway Email Alerts from Offers",
    price: "90 EGP + 20% Discount",
    rate:4,
    imgUrl:"https://www.qsrmagazine.com/sites/default/files/styles/story_page/public/FreddysBurger.jpg",

  ),
  OfferItem(
    title: "Beach BBQ Burger",
    type: "off orders over 200 + Free Shipping orders over 200",
    description: "Receive Costway Email Alerts from Offers",
    price: "90 EGP + 20% Discount",
    rate:4,
    imgUrl:"https://www.qsrmagazine.com/sites/default/files/styles/story_page/public/FreddysBurger.jpg",

  ),

]);

class OfferItemList {
  List<OfferItem> OfferItems;
  OfferItemList({@required this.OfferItems});
}
class OfferItem {

  String title;
  String description;
  String imgUrl;
  String type;
  String price;
  double rate;
  OfferItem({
    @required this.title,
    @required this.type,
    @required this.price,
    @required this.imgUrl,
    @required this.rate,
    @required this.description,

  });
}
