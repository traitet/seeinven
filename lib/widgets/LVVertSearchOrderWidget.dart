//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class LVVertSearchOrderWidget extends StatelessWidget {
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
  LVVertSearchOrderWidget({
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
              itemList[index].isOrder,  
              itemList[index].imageAssetName,
              itemList[index].title,
              itemList[index].textRating,
              itemList[index].name,
              itemList[index].tag,
              itemList[index].serial,
              itemList[index].comment,
              itemList[index].orderDate,
              itemList[index].price,
              itemList[index].qty,);
        },
      ),
    );
  }

//==========================================================================
// BUILD CARD
//==========================================================================
  buildCard(bool isOrder, String imageAssetName, String title, String textRating, String name, String tag, String serial, String comment, String orderDate,double price, double qty) {
    return Container(
      // width: 150,
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Row(
            children: <Widget>[
//==========================================================================
// IMAGE
//==========================================================================
    Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageAssetName),fit: BoxFit.cover),  
        borderRadius: BorderRadius.circular(6)
      )),
//==========================================================================
// COLUMN
//==========================================================================
              Expanded(
                child: Container(               
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,         
                    children: <Widget>[
//==========================================================================
// ROW
//========================================================================== 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
//==========================================================================
// COLUMN
//==========================================================================                                 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
//==========================================================================
// TEXT
//========================================================================== 
                                    Text("${(qty.toStringAsFixed(0))} x ${(name)}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black)),
                                    Text("Order Date: ${(orderDate)}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)), 
                                    Text("Total: \$${(price)} ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),                                      
                                  ],
                                ),
//==========================================================================
// ICON
//==========================================================================                                 
                               isOrder ? IconButton(icon: Icon(Icons.done, color: Colors.blue,), onPressed: (){}): null
                              ],
                            ),                  
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
  const Inven({this.isOrder,this.imageAssetName, this.title,  this.name, this.tag,this.comment, this.serial,this.textRating, this.orderDate, this.price, this.qty});
  final bool isOrder;
  final String title;    
  final String name;      
  final String tag;     
  final String comment;
  final String serial;  
  final String imageAssetName;
  final String textRating;
  final String orderDate; 
  final double price;   
  final double qty;     
}

//==========================================================================
// CLASS CHOICE
//==========================================================================
const List<Inven> itemList = const <Inven>[
  Inven(isOrder:true,imageAssetName: 'assets/images/camera1.jpg',name:'Panasonic GX 800',serial:'11250003', tag:'Panasonic, Entry level, compact',comment:'does not have a flash',textRating:'Very Good', title: 'Paradisus Cancun All Inclusive', orderDate:  '2020/01/02 17:30', price: 5035,qty: 5),
  Inven(isOrder:true,imageAssetName: 'assets/images/camera2.jpg',name:'Nikon Coolpix A', serial:'11250004',tag:'',comment:'',textRating: 'Excellent', title: 'Grand Riviera Princess All Suites Resort & Spa-All Inclusive', orderDate:'2020/01/02 17:30', price: 15199.42,qty: 38),
  Inven(isOrder:false,imageAssetName: 'assets/images/camera3.jpg',name:'Canon EOS 200D',serial: '95200538', tag:'Canon,EOS,200D,Entry,Slightly heavy Scratches, level',comment:'Slightly heavy Scratches on the screen',textRating: 'Excellent', title: 'Ocean Riviera Paradise All Inclusive', orderDate:'2020/01/02 17:30', price: 2994,qty: 6),
  Inven(isOrder:true,imageAssetName: 'assets/images/camera4.jpg',name: 'Fujifilm', serial:'11250005',tag: 'Fufifilm,camera,retro',comment:'Batter change last 6 months',textRating: 'Excellent', title: 'Occidental At Xcaret Destination', orderDate:'2020/01/02 17:30', price: 12966,qty: 6),
  Inven(isOrder:false,imageAssetName: 'assets/images/camera5.jpg',name:'Panasonic GX 800',serial:'11250003', tag:'Panasonic, Entry level, compact',comment:'Good price with 98%',textRating:'Very Good', title: 'Paradisus Cancun All Inclusive', orderDate:'Puerto Jures', price: 5035,qty: 5),
  Inven(isOrder:true,imageAssetName: 'assets/images/camera6.jpg',name:'Nikon Coolpix A', serial:'11250004',tag:'',comment:'Awesome and good take care',textRating: 'Excellent', title: 'Grand Riviera Princess All Suites Resort & Spa-All Inclusive', orderDate:'2020/01/02 17:30', price: 15199.42,qty: 38),
  Inven(isOrder:false,imageAssetName: 'assets/images/camera7.jpg',name:'Canon EOS 200D',serial: '95200538', tag:'Canon,EOS,200D,Entry,Slightly heavy Scratches, level',comment:'Nice and good conditions',textRating: 'Excellent', title: 'Ocean Riviera Paradise All Inclusive', orderDate:'2020/01/02 17:30', price: 2994,qty: 6),
  Inven(isOrder:true,imageAssetName: 'assets/images/camera8.jpg',name: 'Fujifilm', serial:'11250005',tag: 'Fufifilm,camera,retro',comment:'Not have lens',textRating: 'Excellent', title: 'Occidental At Xcaret Destination', orderDate:'2020/01/02 17:30', price: 12966,qty: 6),
];
