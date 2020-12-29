import 'package:flutter/cupertino.dart';

class Product {
  final int price;
  final String id, title, category, image, subTitle, description;

  Product({
    this.id,
    this.price,
    this.title,
    this.category,
    this.image,
    this.subTitle,
    this.description,
  });

  // It create an Category from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: json["price"],
      category: json["category"],
      subTitle: json["subTitle"],
      description: json["description"],
    );
  }
}

// Our Demo Product
Product product = Product(
  id: "1",
  price: 1600,
  title: "Wood Frame",
  image: "https://i.imgur.com/sI4GvE6.png",
  category: "Chair",
  subTitle: "Tieton Armchair",
  description: description,
);
String description =
    "This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work.";


ProductItemList productItemList = ProductItemList(ProductItems: [
  Product(
    id: "1",
    title: "Burger news",
    category: "Shipping",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    subTitle: "50Discount",
    price:200,
    image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPn9W8pD4mfiNu9EtUUN0eYjAt4QR9hpxxpQ&usqp=CAU"

  ),
  Product(
    id: "2",
    title: "Culinary fast",
    subTitle: "off Shipping",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    category: "30 Discount",
    price:50,
    image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6HZClaqOPrm5t92GVO65s5I_y9B_hpoUPAw&usqp=CAU"
  ),
  Product(
    id: "3",
    title: " good Beach",
    category: "off over ",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    subTitle: "70 Discount",
    price:70,
    image:"https://www.gannett-cdn.com/-mm-/3e3960cb7dc9b166e97d8cd04f30ff668d0068e3/c=0-397-1024-976/local/-/media/2018/01/03/USATODAY/USATODAY/636506039022331210-McChicken-White-Background.jpg?width=660&height=374&fit=crop&format=pjpg&auto=webp",

  ),
  Product(
    id: "4",
    title: "Severalfruits",
    category: "Free Shipping",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    subTitle: "100 Discount",
    price:30,
    image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6HZClaqOPrm5t92GVO65s5I_y9B_hpoUPAw&usqp=CAU"
  ),
  Product(
    id: "5",
    title: "Beast Burger",
    category: "off Shipping orders",
    description: "Receive Costway Email Alerts from Offers",
    subTitle: "50Discount",
    price:250,
    image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRubkErCybc3ShrZTN8o2ya9mLU6bkVoBP6Sg&usqp=CAU"

  ),
  Product(
    id: "6",
    title: "Several  fruits",
    subTitle: "off Shipping",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    category: "30 Discount",
    price:900,
    image:"https://lh3.googleusercontent.com/proxy/PJymNqG3BARjmmUvMq1xjzHMlQTIL4d9RZQTLBfG-bp39yZcTAbUQ2xitHAckA8KhDr64I83OsWPckMtUG9m3zMzxiftUC4XB8IjRceYa5LNmFJoZ8d4fx1L_M61jMLGEEvCf4A"
  ),
  Product(
    id: "7",
    title: " Beast Burger",
    category: "Free Shipping",
    description: "Receive Costway Email Alerts from Offers",
    subTitle: "70 Discount",
    price:100,
    image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6HZClaqOPrm5t92GVO65s5I_y9B_hpoUPAw&usqp=CAU"

  ),
  Product(
    id: "8",
    title: "Several culinary ",
    category: "off orders over",
    description: "Receive Costway Email Alerts from Offers Receive Costway Email Alerts",
    subTitle: "100 Discount",
    price:249,
    image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPn9W8pD4mfiNu9EtUUN0eYjAt4QR9hpxxpQ&usqp=CAU"
  ),


]);

class ProductItemList {
  List<Product> ProductItems;
  ProductItemList({@required this.ProductItems});
}