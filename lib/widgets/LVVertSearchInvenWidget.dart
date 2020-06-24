//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class LVVertSearchInvenWidget extends StatelessWidget {
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
  LVVertSearchInvenWidget({
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
      padding: const EdgeInsets.only(top:4, left: 4, right: 4),
//==========================================================================
// LIST VIEW.BILDER
//==========================================================================      
      child: ListView.builder(
//==========================================================================
// NUMBER OF LIST
//==========================================================================   
        itemCount: itemList.length,
        scrollDirection: Axis.vertical,
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
    );
  }

//==========================================================================
// BUILD CARD
//==========================================================================
  buildCard(String imageAssetName, String title, String textRating, String name, String tag, String serial, String comment, String location,double price, double qty) {
    return Container(
      width: 150,
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Row(
            children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================
    Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageAssetName),fit: BoxFit.cover),  
        borderRadius: BorderRadius.circular(12)
      )),
//==========================================================================
// COLUMN
//==========================================================================
              Expanded(
                child: Container(               
                  padding: EdgeInsets.only(left: 8),
                  width: 250,     // need to auto calcuate
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,         
                    children: <Widget>[
//==========================================================================
// TEXT RATING
//==========================================================================                  
                      // Text(textRating,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black)),
//==========================================================================
// TITLE: HOTEL NAME
//==========================================================================                  
                      Row(
                        children: <Widget>[
                          Expanded(child: Text(name,overflow: TextOverflow.visible,maxLines: 1,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black))),
                          IconButton(icon: Icon(Icons.more_vert), onPressed: (){})                         
                        ],
                      ), 
//==========================================================================
// STAR
//==========================================================================                  
                      Row(
                        children: <Widget>[
                            Text("${(qty)} Qty ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)), 
                            Text("| \$ ${(price)} ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black45)),                                                     
                        ],
                      ),   
//==========================================================================
// TAG
//==========================================================================                                                 
                        tag != '' && tag != null ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Tag: ', style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black45)),                          
                          Expanded(child: Text(tag, overflow:TextOverflow.ellipsis,maxLines:1, style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black))),
                        ],
                        ):Container(),         
//==========================================================================
// TAG
//==========================================================================                                                 
                      comment != '' && comment != null ? Row(
                        children: <Widget>[
                          Text('Notes: ', style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black45)),                          
                          Text(comment, maxLines: 1,style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black)),
                        ],
                      ):Container(),                                          
//==========================================================================
// STAR
//==========================================================================                  
                      Row(
                        children: <Widget>[
                          Icon(Icons.star,size: 18,color: Colors.orange,),
                          Icon(Icons.star,size: 18,color: Colors.orange,),
                          Icon(Icons.star,size: 18,color: Colors.orange,),                                    
                        ],
                      ),   
//==========================================================================
// LOCATION
//==========================================================================                  
                      // Row(
                      //   children: <Widget>[
                      //     Icon(Icons.location_on,size: 18),
                      //     Text(location,style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black)),                        
                      //   ],
                      // ),     
                                        
                    ],
                  ),
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
