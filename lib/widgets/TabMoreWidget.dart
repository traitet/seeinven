//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seeinven/screens/ATemplatePage.dart';
import 'package:seeinven/widgets/LVVertSearchInvenWidget.dart';

import '../main.dart';



//==========================================================================
// STATE
//==========================================================================
class TabMoreWidget extends StatelessWidget {
  const TabMoreWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//==========================================================================
// SHOW DEBUG
//==========================================================================      
      debugShowCheckedModeBanner: false,      
//==========================================================================
// THEME
//==========================================================================
      theme: ThemeData(
        primarySwatch: Theme.of(context).primaryColor,
      ),
//==========================================================================
// HOME
//==========================================================================
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()),);},
          ),
          title: Text('More'),
          actions: <Widget>[
            IconButton(onPressed: (){},icon: Icon(Icons.check_box)),
            IconButton(onPressed: (){},icon: Icon(Icons.tune)),
            IconButton(onPressed: (){},icon: Icon(Icons.dialpad)),                     
          ],
        ),
//==========================================================================
// FLOATING ACTION BUTTON
//==========================================================================        
        floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
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
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Camera',style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              )),
//==========================================================================
// TITLE
//==========================================================================        
            Container(
              // height: 50,
              alignment: Alignment.centerLeft,
              // color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 8),
                child: Text('Items',style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.normal)),
              )),   
//==========================================================================
// LISTVIEW & CARD * MUST BE COLUMN ON TOP **
//==========================================================================
              Expanded(child: Container(
                color: Colors.white,
                child: LVVertSearchInvenWidget(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ATemplatePage()),);},
                ),
              ))
       
          ],),
        ),
      ),
    );
  }
}