//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seeinven/main.dart';
import 'package:seeinven/widgets/LVHoriSearchInvenWidget.dart';

//==========================================================================
// CLASS
//==========================================================================
class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({
    Key key,
  }) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return  buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()),);},
        ),
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(onPressed: (){},icon: Icon(Icons.check_box)),
          IconButton(onPressed: (){},icon: Icon(Icons.tune)),
          IconButton(onPressed: (){},icon: Icon(Icons.dialpad)),                     
        ],
      ),


//==========================================================================
// BODY
//==========================================================================
      body: Container(
        color: Colors.white,
        child: ListView(children: <Widget>[
//==========================================================================
// TEXT
//==========================================================================          
          buildContainerTextSection('Inventory Summary'),
//==========================================================================
// GRIDVIEW
//==========================================================================          
          Container(height: 300,child: buildGridView()),
//==========================================================================
// TEXT
//==========================================================================
          buildContainerTextSection('Recent Items'), 
//==========================================================================
// LISTVIEW: HORIZAONTAL WIDGET
//==========================================================================
          LVHoriSearchInvenWidget(),       

        ],),
        ) 
    );
  }

//==========================================================================
// FUNCTION: TEXT SECTION 
//==========================================================================
  Container buildContainerTextSection(String textStr) {
    return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(8),
          height: 30,
          color: Colors.black12,
          child: Text('Inventory Summary', style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,)));
  }
//==========================================================================
// BUILD CARD
//==========================================================================
  buildCard(String imageAssetName, String title, String textRating, String name, String tag, String serial, String comment, String location,double price, double qty) {
    return Container(
      width: 120,
      child: InkWell(
        // onTap: onTap,
        child: Card(
          child: Column(
            children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================    
    SizedBox(height: 8,),
    Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageAssetName),fit: BoxFit.fill),  
        borderRadius: BorderRadius.circular(12)
      )),
//==========================================================================
// COLUMN
//==========================================================================
              Container(               
                height: 70,
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,         
                  children: <Widget>[
//==========================================================================
// TEXT RATING
//========================================================================== 
                    SizedBox(height: 5,),                 
                    Text(serial,style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.grey)),
//==========================================================================
// TITLE: HOTEL NAME
//==========================================================================                  
                    Text(name,overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)), 
//==========================================================================
// STAR
//==========================================================================     
                    Expanded(child: Container()),             
                    Text("${(qty)} Qty ",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black)),   
    
                                      
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


//==========================================================================
// GRIDVIEW
//==========================================================================
  GridView buildGridView() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: <Widget>[
      buildCardDashboard(Icons.dashboard, "\$21.5M",'Items'),
      buildCardDashboard(Icons.local_offer, "238",'Folders'),  
      buildCardDashboard(Icons.crop_original, "124.6K",'Total Qty'),    
      buildCardDashboard(Icons.search, "238",'Folders'),  
      buildCardDashboard(Icons.accessible, "\$ 21.5",'Value'),     
      buildCardDashboard(Icons.attach_money, "238",'Folders'),                       
],
);
  }

//==========================================================================
// BUILD CARD DASHBOARD
//==========================================================================
  Container buildCardDashboard(IconData icon, String qtyText, String unit) {
    // RandomColor _randomColor = RandomColor();
    // Color _color = Colors.red;
    return Container(
        decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)]
      ),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(icon, color:Colors.pink,size: 20,)),
        SizedBox(height: 8,),        
        Text(qtyText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),   
        SizedBox(height: 0,),
        Text(unit, style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.grey),),
 
],)

),
    );
  }


  
}



//==========================================================================
// CLASS CHOICE  --> will change
//==========================================================================
class Inven {
  const Inven({this.imageAssetName, this.title,  this.name,this.tag,this.comment, this.serial,this.textRating, this.location, this.price, this.qty});
  final String title;    
  final String name;      
  final String tag;     
  final String comment;
  final String serial;  
  final String imageAssetName;
  final String textRating;
  final String location; 
  final double price;   
  final double qty;     
}

//==========================================================================
// CLASS CHOICE
//==========================================================================
const List<Inven> itemList = const <Inven>[
  Inven(imageAssetName: 'assets/images/camera1.jpg',name:'Panasonic GX 800',serial:'11250003', tag:'Panasonic, Entry level, compact',comment:'does not have a flash',textRating:'Very Good', title: 'Paradisus Cancun All Inclusive', location:'Puerto Jures', price: 5035,qty: 5),
  Inven(imageAssetName: 'assets/images/camera2.jpg',name:'Nikon Coolpix A', serial:'11250004',tag:'',comment:'',textRating: 'Excellent', title: 'Grand Riviera Princess All Suites Resort & Spa-All Inclusive', location:'Lafitte', price: 15199.42,qty: 38),
  Inven(imageAssetName: 'assets/images/camera3.jpg',name:'Canon EOS 200D',serial: '95200538', tag:'Canon,EOS,200D,Entry,Slightly heavy Scratches, level',comment:'Slightly heavy Scratches on the screen',textRating: 'Excellent', title: 'Ocean Riviera Paradise All Inclusive', location:'Lafitte', price: 2994,qty: 6),
  Inven(imageAssetName: 'assets/images/camera4.jpg',name: 'Fujifilm', serial:'11250005',tag: 'Fufifilm,camera,retro',comment:'Batter change last 6 months',textRating: 'Excellent', title: 'Occidental At Xcaret Destination', location:'Xcaret', price: 12966,qty: 6),
  Inven(imageAssetName: 'assets/images/camera5.jpg',name:'Panasonic GX 800',serial:'11250003', tag:'Panasonic, Entry level, compact',comment:'Good price with 98%',textRating:'Very Good', title: 'Paradisus Cancun All Inclusive', location:'Puerto Jures', price: 5035,qty: 5),
  Inven(imageAssetName: 'assets/images/camera6.jpg',name:'Nikon Coolpix A', serial:'11250004',tag:'',comment:'Awesome and good take care',textRating: 'Excellent', title: 'Grand Riviera Princess All Suites Resort & Spa-All Inclusive', location:'Lafitte', price: 15199.42,qty: 38),
  Inven(imageAssetName: 'assets/images/camera7.jpg',name:'Canon EOS 200D',serial: '95200538', tag:'Canon,EOS,200D,Entry,Slightly heavy Scratches, level',comment:'Nice and good conditions',textRating: 'Excellent', title: 'Ocean Riviera Paradise All Inclusive', location:'Lafitte', price: 2994,qty: 6),
  Inven(imageAssetName: 'assets/images/camera8.jpg',name: 'Fujifilm', serial:'11250005',tag: 'Fufifilm,camera,retro',comment:'Not have lens',textRating: 'Excellent', title: 'Occidental At Xcaret Destination', location:'Xcaret', price: 12966,qty: 6),
];




