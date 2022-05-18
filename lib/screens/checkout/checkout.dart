import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {

  final String image;
  final String name;
  final double price;
  CheckOut({required this.image,required this.name,required this.price});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {


Widget _buildSingleCartProduct(){
    return Container(
            height: 150,
            width: double.infinity,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 130,
                        width: 150,
                        decoration:BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:AssetImage("assets/${widget.image}"),
                            ),
                        ),
                      ),
                   Container(
                     height: 140,
                     width: 200,
                     child:ListTile(
                       title: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children:<Widget> [
                           Text(
                                "${widget.name}"
                              ),
                           const Text(
                             "Clothes"
                             ),
                            Text(
                               "\$ ${widget.price}",
                             style: TextStyle(
                               color: Colors.grey,
                               fontWeight: FontWeight.bold
                               ),
                               ),
                         Container(
                             height: 35,
                             width: 100,
                             decoration:BoxDecoration(
                               color: Color.fromARGB(255, 218, 211, 211),
                               borderRadius: BorderRadius.circular(20),
                             ),
                             child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children:  <Widget>[
                                Text("Quantity:"),
                                Text("1")
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   )
                    ],
                  )
                ],
              ),
            ),
          );
  }

Widget _buildBottomDetail({required String startName,required String endName}){
  return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget>[
              Text(
                startName,
                style: TextStyle(
                  fontSize:18  
                  ),
                  ),
              Text(
                endName, 
                style: TextStyle(
                  fontSize:18  
                  ),
                ),
            ],
          );
}





  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       appBar: AppBar(
        title:  const Text("Check Out Page",
        style:  TextStyle(
          fontWeight: FontWeight.bold
          ),
          ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation:0.0,
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back,
            color: Colors.white
            ),
            onPressed: (){},
               ),
            actions: <Widget>[
              IconButton(
                icon:const  Icon(
                  Icons.notifications_none,
                  color: Colors.black,),
                  onPressed: (){},
                  ),
            ],
      ),
       bottomNavigationBar: Container(
        height: 60,
        width: 100,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
           style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 5, 41, 71),
                        shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        )
                      ),
                        onPressed: (){},
                      child:const Text("Buy",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white
                      ),),
        ),
      ),
      backgroundColor: Colors.white,
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSingleCartProduct(),
              _buildSingleCartProduct(),
                 _buildSingleCartProduct(),
              _buildSingleCartProduct(),
                 _buildSingleCartProduct(),
              _buildSingleCartProduct(),
                 _buildSingleCartProduct(),
              _buildSingleCartProduct(),
              
             Container(
               height: 150,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   _buildBottomDetail(startName: "Your Price", endName: "\$ 60.00"),
                   _buildBottomDetail(startName: "Discount", endName: "3%"),
                   _buildBottomDetail(startName: "Shipping", endName: "\$ 6.00"),
                   _buildBottomDetail(startName: "Total ", endName: "\$ 830.00"),
                   
                                
                 ],
               ),
             ),
            ],
          ),
        ],
      ),
    ),
    );
    
  }
}