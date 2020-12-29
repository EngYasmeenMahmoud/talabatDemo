import 'package:Demo/APICall/fetchProducts.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/Product.dart';
import 'package:Demo/models/category.dart';
import 'package:Demo/models/offers.dart';
import 'package:Demo/widgets/categoryWidget.dart';
import 'package:Demo/widgets/offerCard.dart';
import 'package:Demo/widgets/recommond_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
class homeDetailsPage extends StatefulWidget {
  @override
  _homeDetailsPageState createState() => _homeDetailsPageState();
}
enum SingingCharacter { lafayette, jefferson }
PersistentBottomSheetController _controller;

class _homeDetailsPageState extends State<homeDetailsPage> {
  int _currentSelection = 2;
  SingingCharacter _character = SingingCharacter.lafayette;
  bool modalIsChecked = false;
  bool modalIsSwitched = false;
  int modalRadioValue = 0;

  // Bottomsheet
  bool bottom1IsChecked = false;
  bool bottom2IsChecked = false;
  bool bottom3IsChecked = false;
  bool bottom4IsChecked = false;
  bool bottom5IsChecked = false;
  bool bottom6IsChecked = false;
  int bottomRadioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:customAppBar(),
        body:  Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                filterSection(),
                 Expanded(
                   child: ListView(padding: EdgeInsets.all(10),
                      children: [
                        SizedBox(height: 20,),
                        horizontalList(),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(getTranslated(context, "viewAllRestaurant"),textAlign:TextAlign.start,
                              style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        FutureBuilder(
                          future: fetchProducts(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? RecommandProducts(products:productItemList.ProductItems,)//(products: snapshot.data)
                                : Center(child: Image.asset('assets/images/ripple.gif',width: 50,height: 50,));
                          },
                        ),

          ],
        ),
      ),

              ],
            ),
      );
  }

  Widget customAppBar(){
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title:GestureDetector(
        onTap: () =>moveToSearchPlacePage() ,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                getTranslated(context,'deleverTo'),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.normal,
                    color:Colors.grey,fontSize: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    getTranslated(context,'selectPlace'),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.normal,
                        color:Colors.deepOrange,fontSize: 14),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.deepOrange,
                  ),

                ],
              ),
            ]),
      ),
    );
  }
  Widget filterSection(){
    Map<int, Widget> _children = {
      0: RichText(textAlign:TextAlign.center,text: TextSpan(
        children: [
          WidgetSpan(child: Icon(Icons.filter_list_outlined, size: 14,color: Colors.black,),),
          TextSpan(text: " "),
          TextSpan(text: getTranslated(context, "filter"),style: TextStyle(fontSize: 10,color: Colors.black),),
        ],),),
      1:RichText(textAlign:TextAlign.center,text: TextSpan(
        children: [
          WidgetSpan(child: Icon(Icons.merge_type, size: 14,color: Colors.black,),),
          TextSpan(text: " "),
          TextSpan(text: getTranslated(context, "cuisines"),style: TextStyle(fontSize: 10,color: Colors.black),),
        ],),),
      2: RichText(textAlign:TextAlign.center,text: TextSpan(
        children: [
          WidgetSpan(child: Icon(Icons.search, size: 14,color: Colors.black,),),
          TextSpan(text: " "),
          TextSpan(text: getTranslated(context, "search"),style: TextStyle(fontSize: 10,color: Colors.black),),
        ],),),
    };
    return  Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            child: MaterialSegmentedControl(
              children: _children,
              selectionIndex: _currentSelection,
              borderColor: Colors.grey,
              selectedColor: Colors.white,
              unselectedColor: Colors.white,
              borderRadius: 5.0,
              onSegmentChosen: (index)
              {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                          builder: (BuildContext context, StateSetter state) {
                            return  Container(
                                padding: const EdgeInsets.all(10.0),
                                child:Column(
                                    children: <Widget>[
                                        Row( mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(""),
                                            Text(getTranslated(context, "filter"),textAlign:TextAlign.center,
                                              style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),),
                                            IconButton(
                                              icon: Icon(Icons.close),
                                              color: Colors.black,
                                              onPressed: () {
                                               // _controller.close;
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],),
                                        SizedBox(height: 5,),
                                        Expanded(
                                          child: ListView(
                                            children: <Widget>[
                                                Text(getTranslated(context, "SortBy"),textAlign:TextAlign.start,
                                                  style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),),
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    new Text(
                                                      'Recommended',
                                                    ),
                                                    new Radio(
                                                      value: 0,
                                                      groupValue: bottomRadioValue,
                                                      onChanged: (value) {
                                                        state(() {
                                                          bottomRadioValue = value;
                                                        });
                                                      },
                                                    ),
                                                  ],),
                                                Divider(color: Colors.grey[200],),
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    new Text(
                                                      'Rating',
                                                    ),
                                                    new Radio(
                                                      value: 1,
                                                      groupValue: bottomRadioValue,
                                                      onChanged: (value) {
                                                        state(() {
                                                          bottomRadioValue = value;
                                                        });
                                                      },
                                                    ),
                                                  ],),
                                                Divider(color: Colors.grey[200],),
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    new Text(
                                                      'A to Z',
                                                    ),
                                                    new Radio(
                                                      value: 2,
                                                      groupValue: bottomRadioValue,
                                                      onChanged: (value) {
                                                        state(() {
                                                          bottomRadioValue = value;
                                                        });
                                                      },
                                                    ),
                                                  ],),
                                                Divider(color: Colors.grey[200],),
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    new Text(
                                                      'Fast Dilevry',
                                                    ),
                                                    new Radio(
                                                      value: 3,
                                                      groupValue: bottomRadioValue,
                                                      onChanged: (value) {
                                                        state(() {
                                                          bottomRadioValue = value;
                                                        });
                                                      },
                                                    ),
                                                  ],),
                                                Divider(color: Colors.grey[200],),
                                                SizedBox(height: 5,),
                                                Text(getTranslated(context, "filter"),textAlign:TextAlign.start,
                                                  style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),),
                                                CheckboxListTile(
                                                  value: bottom1IsChecked,
                                                  title: Text("50% Festival"),
                                                  onChanged: (value) {
                                                    state(() {
                                                      bottom1IsChecked = value;
                                                    });
                                                  },
                                                ),
                                                 Divider(color: Colors.grey[200],),
                                                 CheckboxListTile(
                                                  value: bottom2IsChecked,
                                                  title: Text("Free Delivery"),
                                                  onChanged: (value) {
                                                    state(() {
                                                      bottom2IsChecked = value;
                                                    });
                                                  },
                                                ),
                                                 Divider(color: Colors.grey[200],),
                                                 CheckboxListTile(
                                                  value: bottom3IsChecked,
                                                  title: Text("New Resturant"),
                                                  onChanged: (value) {
                                                    state(() {
                                                      bottom3IsChecked = value;
                                                    });
                                                  },
                                                ),
                                                 Divider(color: Colors.grey[200],),
                                                 CheckboxListTile(
                                                  value: bottom4IsChecked,
                                                  title: Text("Fast Delivery"),
                                                  onChanged: (value) {
                                                    state(() {
                                                      bottom4IsChecked = value;
                                                    });
                                                  },
                                                ),
                                                 Divider(color: Colors.grey[200],),
                                                 CheckboxListTile(
                                                  value: bottom5IsChecked,
                                                  title: Text("Health & Beauty"),
                                                  onChanged: (value) {
                                                    state(() {
                                                      bottom5IsChecked = value;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                        ),
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              side: BorderSide(color: Colors.deepOrange)),
                                          onPressed: (

                                              ) {},
                                          color: Colors.deepOrange,
                                          textColor: Colors.white,
                                          child: Text("Applay",
                                              style: TextStyle(fontSize: 14)),
                                        ),
                                      ],
                                  ),
                              );
                          });
                    });
              },
            ),
          ),
        ),
      ],
    );}
  Widget horizontalList(){
    return Container(
      height: 100,
      color: Colors.transparent,
      child: AnimationLimiter(
        child:ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categoryItemList.CategoryItems.length,
          separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.grey,),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: cart(index),
                ),
              ),
            );
          },
        ),
      ),
    );

  }
  Widget cart(int index) {
    return categoryWidget(categoryItem:categoryItemList.CategoryItems[index]);
  }
  Widget filterResult(int index) {
    return offerCard(offerItem: offerItemList.OfferItems[index]);
  }
  moveToSearchPlacePage() {}
}