import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/foodItem.dart';
import 'package:Demo/routs/route_names.dart';
import 'package:Demo/widgets/searchItem.dart';

class searchPage extends StatefulWidget {
  searchPage({Key key}) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";
   bool selected=false;
   Color button1TextColor= Colors.deepOrange;
   Color button2TextColor=Colors.black;
  Color button1BorderColor= Colors.deepOrange;
  Color button2BorderColor=Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const BackButton(),// _isSearching ? const BackButton() : Container(),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title:_buildSearchField(),// _isSearching ? _buildSearchField() : _buildTitle(context),
      ),
      //resizeToAvoidBottomInset: false,
      body:_isSearching ? getFood() : Container(),

    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 20,bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white10,border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
      child: TextField(
        controller: _searchQueryController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: getTranslated(context,'searchText'),
          prefixIcon: Icon(Icons.search ,color: Colors.black,size: 15,),
          suffixIcon: IconButton(
              icon: Icon(Icons.close_rounded,size: 15,color: Colors.black),
              onPressed: () {
                _clearSearchQuery();
              }),
          hintStyle: TextStyle(color: Colors.grey,fontSize: 12,), border: InputBorder.none,
          filled: true,
          fillColor: Colors.white70,
        ),
        style: TextStyle(color: Colors.black, fontSize: 12.0),
        onChanged: (query) => updateSearchQuery(query,true),
      ),
    );

  }
  void updateSearchQuery(String newQuery,bool search) {
    setState(() {
      _isSearching=search;
      searchQuery = newQuery;
    });

  }
  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("",false);
    });
  }
  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }
  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }
  Widget getFood(){
    return Container(
      padding: EdgeInsets.all(10),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 2,),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: button1BorderColor)),
                    color: Colors.white,
                    textColor: button1TextColor,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {
                      setState(() {
                        button1TextColor=Colors.deepOrange;
                        button1BorderColor=Colors.deepOrange;
                        button2TextColor=Colors.black;
                        button2BorderColor=Colors.grey;
                      });
                    },
                    child: Text(getTranslated(context,'food'),style: TextStyle(fontSize: 14.0,),),
                  ),
                  SizedBox(width: 10,),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: button2BorderColor)),
                    color: Colors.white,
                    textColor: button2TextColor,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {
                      setState(() {
                        button2TextColor=Colors.deepOrange;
                        button2BorderColor=Colors.deepOrange;
                        button1TextColor=Colors.black;
                        button1BorderColor=Colors.grey;
                      });
                    },
                    child: Text(getTranslated(context,'groceries'),style: TextStyle(fontSize: 14.0,),),
                  ),
                ]),
            SizedBox(height: 2,),
            //Divider(color: Colors.grey,),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 1,),
                  for (var foodItem in foodItemList.foodItems)
                    searchItem(foodItem: foodItem),
                ],
              ),
            ),
          ],
        ),
    );
      /*

    */
  }

}