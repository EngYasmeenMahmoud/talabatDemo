import 'package:Demo/localization/localization_methods.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
//import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
class placesSearch extends StatefulWidget {
  @override
  _placesSearchState createState() => _placesSearchState();
}

class _placesSearchState extends State<placesSearch> {
  PickResult selectedPlace;
String APIKeys="AIzaSyBrOk9nFq2XFTVXO9RnHW47czrodjZN4zM";
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    //_getCurrentLocation();
  }

  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print("_currentPosition $_currentPosition");
      });
    }).catchError((e) {
      print(e);
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      PlacePicker(
      apiKey: APIKeys,
      initialPosition:kInitialPosition,// _currentPosition==null? kInitialPosition: new LatLng(_currentPosition.latitude, _currentPosition.longitude),
      useCurrentLocation: true,
      selectInitialPosition: true,
      usePlaceDetailSearch: true,
      /*onPlacePicked: (result) {
        selectedPlace = result;
        Navigator.of(context).pop();
        setState(() {});
      },*/
       forceSearchOnZoomChanged: true,
       automaticallyImplyAppBarLeading: false,
      // autocompleteLanguage: "en",
      //region: 'au',

      selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused)
      {
      print("state: $state, isSearchBarFocused: $isSearchBarFocused");
      return isSearchBarFocused
             ? Container()
             : FloatingCard(
                bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                leftPosition: 0.0,
                rightPosition: 0.0,
                 width: 500,
                borderRadius: BorderRadius.circular(12.0),
                 child: state == SearchingState.Searching
                    ? Center(child: Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: CircularProgressIndicator(
                                       valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                                     ),
                         ))
                     : Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(mainAxisAlignment:MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(getTranslated(context, 'address'),style: TextStyle(color: Colors.grey,fontSize: 10),),
                           SizedBox(height: 3,),
                           RichText(
                             textAlign: TextAlign.start,
                             overflow: TextOverflow.clip,
                             softWrap: true,
                             maxLines: 5,
                             text: TextSpan(
                               children: [
                                 WidgetSpan(
                                   child: Icon(Icons.push_pin_outlined, size: 14,color: Colors.black,),
                                 ),
                                 TextSpan(text: " ",),
                                 TextSpan(
                                     text: selectedPlace.formattedAddress.toString(),
                                     style: TextStyle(fontWeight: FontWeight.normal,
                                         fontSize: 12.0,color: Colors.black)),
                               ],
                             ),
                           ),
                           SizedBox(height: 3,),
                           Text(getTranslated(context, 'doYouNeedToDeleverTo'),
                               style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 10),),
                           Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               FlatButton(
                                   onPressed: (){ print("do something with $selectedPlace.formattedAddress data");
                                   Navigator.pop(context,selectedPlace.formattedAddress );                                                  },
                                   child: Text(getTranslated(context, 'yesDelver'),
                                          style: TextStyle(color: Colors.deepOrange,fontSize: 12),)),

                               FlatButton(
                                   onPressed: (){ print("do something with $selectedPlace data");
                                   setState(() {
                                     isSearchBarFocused=true;
                                   });},
                                   child: Text(getTranslated(context, 'noDelver'),
                                     style: TextStyle(color: Colors.deepOrange,fontSize: 12),)),
                             ],
                           ),

                 ],),
                     )

              );
      },

      pinBuilder: (context, state) {
        if (state == PinState.Idle) {
          return Icon(Icons.push_pin,color: Colors.deepOrange,size: 25,);
        } else {
          return Icon(Icons.push_pin,color: Colors.deepOrange,size: 25,);
        }
      },
    );
     /* Scaffold(
        appBar: AppBar(
          title: Text("Google Map Place Picer Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Load Google Map"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PlacePicker(
                          apiKey: APIKeys,
                          initialPosition: kInitialPosition,
                          useCurrentLocation: true,
                          selectInitialPosition: true,

                          //usePlaceDetailSearch: true,
                          onPlacePicked: (result) {
                            selectedPlace = result;
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          //forceSearchOnZoomChanged: true,
                          //automaticallyImplyAppBarLeading: false,
                          //autocompleteLanguage: "ko",
                          //region: 'au',
                          //selectInitialPosition: true,
                          // selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                          //   print("state: $state, isSearchBarFocused: $isSearchBarFocused");
                          //   return isSearchBarFocused
                          //       ? Container()
                          //       : FloatingCard(
                          //           bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                          //           leftPosition: 0.0,
                          //           rightPosition: 0.0,
                          //           width: 500,
                          //           borderRadius: BorderRadius.circular(12.0),
                          //           child: state == SearchingState.Searching
                          //               ? Center(child: CircularProgressIndicator())
                          //               : RaisedButton(
                          //                   child: Text("Pick Here"),
                          //                   onPressed: () {
                          //                     // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                          //                     //            this will override default 'Select here' Button.
                          //                     print("do something with [selectedPlace] data");
                          //                     Navigator.of(context).pop();
                          //                   },
                          //                 ),
                          //         );
                          // },
                          // pinBuilder: (context, state) {
                          //   if (state == PinState.Idle) {
                          //     return Icon(Icons.favorite_border);
                          //   } else {
                          //     return Icon(Icons.favorite);
                          //   }
                          // },
                        );
                      },
                    ),
                  );
                },
              ),
              selectedPlace == null ? Container() : Text(selectedPlace.formattedAddress ?? ""),
            ],
          ),
        ));*/
  }
}
