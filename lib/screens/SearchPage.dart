//==========================================================================
// IMPORT
//==========================================================================



import 'dart:math';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:seeinven/screens/MainMenuPage.dart';
import 'package:seeinven/screens/MorePage.dart';
import 'package:seeinven/screens/TagPage.dart';
import 'package:seeinven/widgets/LVVertSearchInvenWidget.dart';
import 'package:seeinven/widgets/SearchBarWidget.dart';

// import 'package:seedeal01/widgets/ButtonBarWidget.dart';
// import 'package:seedeal01/widgets/RadioButtonWidget.dart';
// import 'package:seedeal01/widgets/TextFieldWidget.dart';
// import '../models/AppConfigModel.dart';

//==========================================================================
// CLASS
//==========================================================================
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _SearchPageState extends State<SearchPage> {
//==========================================================================
// SEARCH BAR
// https://blog.smartnsoft.com/an-automatic-search-bar-in-flutter-flappy-search-bar-a470bc67fa1f
//==========================================================================    
    Future<List<Post>> search(String search) async {
      await Future.delayed(Duration(seconds: 2));
      return List.generate(search.length, (int index) {
        return Post("Title : $search $index","Description :$search $index",);
      });
}
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
          title: Text('Search'),
          actions: <Widget>[
            IconButton(onPressed: (){},icon: Icon(Icons.check_box)),
            IconButton(onPressed: (){},icon: Icon(Icons.tune)),
            IconButton(onPressed: (){},icon: Icon(Icons.dialpad)),                     
          ],
        ),
//==========================================================================
// FLOATING ACTION BUTTON
//==========================================================================        
      //   floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),         
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
              currentIndex: 2,
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
    padding: EdgeInsets.all(8.0),
    child: Column(children: <Widget>[

      Container(
        height: 100,
        child: SearchBar(onSearch: searchProduct, onItemFound: (Post post, int index) {return Container();})
              ),
                // SearchBarWidget()),
        //==========================================================================
        // SEARCH BAR
        //==========================================================================   
              buildTopDetails(),
        //==========================================================================
        // LISTVIEW & CARD * MUST BE COLUMN ON TOP **
        //==========================================================================
              FlatButton(onPressed: (){},child: Text('Clear Search Result',style: TextStyle(color: Colors.blue,))),
        //==========================================================================
        // LIST VIEW SEARCH IATEM
        //==========================================================================    
              Expanded(child: Container(child: LVVertSearchInvenWidget()),),
            ],),
          ),
        //==========================================================================
        // END SCAFFOLD
        //==========================================================================     
        ),);}
        
        
        //**************************************************************************************************************************
        // BUILD WIDGET
        //**************************************************************************************************************************
        //==========================================================================
        // BUILD TOP DETAIL
        //========================================================================== 
          Container buildTopDetails() {
            return Container(
        
                      height: 120,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        
              child: Row(
                  children: <Widget>[      
                  Expanded(
                    flex: 2,
                    child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey),),),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Expanded(
        //==========================================================================
        // TEXT
        //========================================================================== 
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey)),),
                            child: Text('G7x - Mark II',style: TextStyle(fontSize: 16),)),
                        ),
                        Row(children: <Widget>[
        //==========================================================================
        // IMAGE  FLAG
        //==========================================================================                   
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey)),),    
                              child: Container(height: 80,width: 80,padding: EdgeInsets.all(4),
                                child: Image(  
                                  image: AssetImage('assets/images/jpflag.jpg')),
                              ))),   
        //==========================================================================
        // TEXT 0 ORUCE
        //==========================================================================                           
                          Expanded(
                            flex: 2,
                            child: Container(                     
                            alignment: Alignment.center,                    
                              padding: EdgeInsets.all(8),
                              child: Text('\$625.00',style: TextStyle(fontSize: 16),))),              
                        ],)
                      ],),
                    ),
                  ),
        //==========================================================================
        //QR CODE
        //==========================================================================             
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      // height: 120,
                      child: Image(height: 80,width: 80,image: AssetImage('assets/images/qr.jpg')),              
                    ),
                  ),
        
                ],),
            );
          }
        

}

//==========================================================================
// FUNCTION SEARCH PRODUCT
//==========================================================================
Future<List<Post>> searchProduct(String text) async {
    await Future.delayed(Duration(seconds: text.length == 4 ? 10 : 1));
    // if (isReplay) return [Post("Replaying !", "Replaying body")];
    if (text.length == 5) throw Error();
    if (text.length == 6) return [];
    List<Post> posts = [];

    var random = new Random();
    for (int i = 0; i < 10; i++) {
      posts.add(Post("$text $i", "body random number : ${random.nextInt(100)}"));
    }
    return posts;
  }