//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seeinven/screens/ATemplatePage.dart';
import 'package:seeinven/screens/MorePage.dart';
import 'package:seeinven/screens/SearchPage.dart';
import 'package:seeinven/screens/TagPage.dart';
import 'package:seeinven/widgets/LVVertSearchInvenWidget.dart';
// import 'package:seedeal01/widgets/ButtonBarWidget.dart';
// import 'package:seedeal01/widgets/RadioButtonWidget.dart';
// import 'package:seedeal01/widgets/TextFieldWidget.dart';
// import '../models/AppConfigModel.dart';

//==========================================================================
// CLASS
//==========================================================================
class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _MainMenuPageState extends State<MainMenuPage> {
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
            onPressed: () => Navigator.of(context).pop(),
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
//==========================================================================
// BUTTOM NAVIGATION BAR
// www.willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation
//==========================================================================
            bottomNavigationBar: BottomNavigationBar(
              onTap: (int index){
                switch (index) {
                  case 0: {Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenuPage()),);}break;
                  case 1: {Navigator.push(context, MaterialPageRoute(builder: (context) => TagPage()),);}break;
                  case 2: {Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()),);}break;
                  case 3: {Navigator.push(context, MaterialPageRoute(builder: (context) => MorePage()),);}break;                   
                  default:
                }
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Items'), ),
                BottomNavigationBarItem( icon: Icon(Icons.business_center),title: Text('Tag'),),
                BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Search')),
                BottomNavigationBarItem(icon: Icon(Icons.more_horiz), title: Text('More')),
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


            // Text('E-mail',style: AppConfigModel().textStyleMBold),
            // TextFieldWidget(text: '*E-mail', icon: Icons.email),
            // SizedBox(height: 8),            
            // Text('Personal Details',style: AppConfigModel().textStyleMBold),
            // TextFieldWidget(text: '*Name', icon: Icons.account_box),
            // TextFieldWidget(text: '*Surname', icon: Icons.account_circle),    
            // RadioButtonWidget(),                    
            // SizedBox(height: 8),
            // ButtonBarWidget(onPressed: () {},splashColor: Colors.pink,text: "Save",),            
          ],),
        ),
      ),
    );
  }
}