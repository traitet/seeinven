//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seeinven/main.dart';
import 'package:seeinven/screens/ATemplatePage.dart';

import 'package:seeinven/widgets/LVVertSearchOrderWidget.dart';


//==========================================================================
// CLASS
//==========================================================================
class TabOrderWidget extends StatelessWidget {
  const TabOrderWidget({
    Key key,
  }) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()),);},
          ),
          title: Text('Order'),
          actions: <Widget>[
            IconButton(onPressed: (){},icon: Icon(Icons.check_box)),
            IconButton(onPressed: (){},icon: Icon(Icons.tune)),
            // IconButton(onPressed: (){},icon: Icon(Icons.dialpad)),                     
          ],
        ),


//==========================================================================
// BODY
//==========================================================================
        body: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
//==========================================================================
// TITLE
//==========================================================================            

 
//==========================================================================
// LISTVIEW & CARD * MUST BE COLUMN ON TOP **
//==========================================================================
              Expanded(child: Container(
                color: Colors.white,
                child: LVVertSearchOrderWidget(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ATemplatePage()),);},
                ),
              ))
         
          ],),
        ),
      );
  }
}