//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class LVHoriSearchInvenWidget extends StatelessWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================
  final VoidCallback onTap;
  final String imageAssetName; //CHANGE TO LIST
  final String title;
  final String textDescription;
//==========================================================================
// GET/SET
//==========================================================================
  LVHoriSearchInvenWidget({
    this.onTap,
    this.imageAssetName = '',
    this.title = '',
    this.textDescription = '',
    Key key,
  })  : assert(title != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:4, bottom: 4),
//==========================================================================
// LIST VIEW.BILDER
//==========================================================================      
      child: Container(
        height: 200,
        // decoration: BoxDecoration(color: Colors.white),
        // padding: EdgeInsets.only(top:4, bottom: 4),
        child: ListView.builder(
//==========================================================================
// NUMBER OF LIST
//==========================================================================   
          itemCount: itemList.length,
          scrollDirection: Axis.horizontal,
//==========================================================================
// RETRN ITEM BUILDER
//==========================================================================        
          itemBuilder: (context,index){
            return  buildCard(
                itemList[index].imageAssetName,
                itemList[index].title,
                itemList[index].textRating,
                itemList[index].name,
                itemList[index].tag,
                itemList[index].serial,
                itemList[index].comment,
                itemList[index].location,itemList[index].price,itemList[index].qty,);
          },
        ),
      ),
    );
  }

//==========================================================================
// BUILD CARD
//==========================================================================
  buildCard(String imageAssetName, String title, String textRating, String name, String tag, String serial, String comment, String location,double price, double qty) {
    return Container(
      width: 120,
      child: InkWell(
        onTap: onTap,
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
