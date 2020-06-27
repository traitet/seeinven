//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seeinven/main.dart';
import 'package:seeinven/screens/MainMenuPage.dart';

//==========================================================================
// STATE
//==========================================================================
class TabMoreWidget extends StatelessWidget {
  const TabMoreWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('More'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()),);},
          ),
        actions: <Widget>[
          IconButton(onPressed: (){},icon: Icon(Icons.person)),                     
        ],          
          ),

//==========================================================================
// BODY
//==========================================================================
        body: 
        ListView(
          children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================

//==========================================================================
// LIST TILE & TEXT: MY PERFERENCE
//==========================================================================  
            ListTile(trailing: Icon(Icons.home),title: Text('Profile'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()),);},),  
            ListTile(trailing: Icon(Icons.hotel),title: Text('Maintain Inventory'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()),);},),     
            ListTile(trailing: Icon(Icons.flight),title: Text('Config Storage Location'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()),);},),   
            ListTile(trailing: Icon(Icons.book),title: Text('Stock Movement Report'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()),);},),   
            ListTile(trailing: Icon(Icons.people),title: Text('Stock Card'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()),);},),                                                      
            ListTile(trailing: Icon(Icons.help),title: Text('Need help?'),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()),);},),         
            ListTile(trailing: Icon(Icons.rate_review),title: Text('Rate the app'),),      
            ListTile(trailing: Icon(Icons.web),title: Text('About'),onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainMenuPage()),);},),         

          ],
//==========================================================================
// LISTTILE
//==========================================================================
        ),
      );
  }
}