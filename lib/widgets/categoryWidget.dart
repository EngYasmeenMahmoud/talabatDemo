import 'package:flutter/material.dart';
import 'package:Demo/models/category.dart';

class categoryWidget extends StatelessWidget {

  final category categoryItem;
  const categoryWidget({Key key,  this.categoryItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 70,
        height: 85,
        padding: EdgeInsets.all(5.0),
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          color: Color(0xFFe5e7fe),//Colors.blue[100],
          borderRadius: new BorderRadius.all(const Radius.circular(7.0)),
          /* boxShadow: <BoxShadow>[
            BoxShadow(color:  Colors.blue[200], offset: Offset(1.0, 6.0), blurRadius: 0.001,),
          ],*/
        ),child: Column(
        children: [
          Image(image: AssetImage(categoryItem.imgUrl),height: 45,width: 45,fit:BoxFit.fill,),
          SizedBox(height: 5,),
          Text(categoryItem.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              softWrap: true,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.normal,
                  fontSize: 12.0,color: Colors.black)),
        ],
      ),
      ),
    );
  }
}

