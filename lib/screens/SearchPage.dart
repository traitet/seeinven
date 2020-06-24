//==========================================================================
// IMPORT
//==========================================================================
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:seeinven/screens/ATemplatePage.dart';
import 'package:seeinven/screens/MainMenuPage.dart';
import 'package:seeinven/screens/MorePage.dart';
import 'package:seeinven/screens/TagPage.dart';
import 'package:seeinven/widgets/LVVertSearchInvenWidget.dart';
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
          child: Column(children: <Widget>[
//==========================================================================
// SEARCH BAR
//==========================================================================            
          SafeArea(
            child: SearchBar<Post>(
              onSearch: search,
              onItemFound: (Post post, int index) {
                return Container();}),
          ),
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


class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}