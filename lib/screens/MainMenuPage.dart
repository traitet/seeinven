//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../widgets/TabHomeWidget.dart';
import '../widgets/TabTagWidget.dart';
import '../widgets/TabSearchWidget.dart';
import '../widgets/TabMoreWidget.dart';
import '../widgets/TabDashboardWidget.dart';

//==========================================================================
// CLASS
//==========================================================================
class MainMenuPage extends StatefulWidget {
//==========================================================================
// CONSTRUCTURE
//========================================================================== 
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _MainMenuPageState extends State<MainMenuPage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================
  int tabIndex = 0;
//==========================================================================
// BUILD WIDGET
//==========================================================================
  // int _currentIndex = 0;
  // final List<Widget> _children = [];  
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
//==========================================================================
// BUTTOM NAVIGATION BAR
// www.willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation
//==========================================================================
            bottomNavigationBar: BottomNavigationBar(
              onTap: (int index){
                setState(() { tabIndex = index;});
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: tabIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Items'), ),
                BottomNavigationBarItem( icon: Icon(Icons.business_center),title: Text('Tag'),),
                BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Search')),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), title: Text('Dashboard')),                
                BottomNavigationBarItem(icon: Icon(Icons.more_horiz), title: Text('More')),
              ],
            ),

//==========================================================================
// BODY
//==========================================================================
        body: 
        tabIndex == 0 ? TabHomeWidget():
        tabIndex == 1 ? TabTagWidget():
        tabIndex == 2 ? TabSearchWidget():
        tabIndex == 3 ? DashBoardWidget():         
        tabIndex == 4 ? TabMoreWidget(): 
        Text('Not Found')
      ),
    );
  }
}


