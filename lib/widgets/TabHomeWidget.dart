
//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../main.dart';
import 'LVVertSearchInvenWidget.dart';
//==========================================================================
// TAB HOME WIDGET
//==========================================================================
class TabHomeWidget extends StatelessWidget {
  //  final VoidCallback onBackPressed;
//==========================================================================
// CONSTRUCTURE
//==========================================================================    
  const TabHomeWidget({
    Key key,
    // this.onBackPressed
  }) : super(key: key);
//==========================================================================
// BUILD
//==========================================================================  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()),);},
          ),
          title: Text('IT Inventory'),
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
      body: 
      buildContainer(context)
    );
  } // CLASS

//==========================================================================
// BUILD CONTAINER
//==========================================================================    
  Container buildContainer(BuildContext context) {
    return Container(
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
            onTap: (){},
          ),
        ))
       
    ],),
  );
  }
}