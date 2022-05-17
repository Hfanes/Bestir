import 'package:flutter/material.dart';


class CartScreen extends StatefulWidget {
  
  final String image;
  final String name;
  final double price;
  CartScreen({required this.image,required this.name,required this.price});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int count=1;

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
                        decoration: BoxDecoration(
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
                            Text(widget.name),
                           const Text("Clothes"),
                             Text("\$ ${widget.price.toString()}",
                             style:const TextStyle(
                               color: Colors.grey,
                               fontWeight: FontWeight.bold
                               ),
                               ),
                               
                         Container(
                             height: 35,
                             width: 120,
                             decoration:BoxDecoration(
                               color: Color.fromARGB(255, 218, 211, 211),
                               borderRadius: BorderRadius.circular(20),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 GestureDetector(
                                    child:const Icon(Icons.remove),
                                    onTap: (){
                                      setState(() {
                                        if(count>1){
                                          count--;
                                        }
                                      }
                                      );
                                    },
                                    ),
                                 Text(
                                   count.toString(),
                                 style: const TextStyle(
                                   fontSize: 18
                                   ),
                                   ),
                                GestureDetector(
                                    child:const Icon(Icons.add),
                                    onTap: (){
                                      setState(() {
                                        count++;
                                      }
                                      );
                                    },
                                    ),    
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
           style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        )
                      ),
         onPressed: (){},
                      child:const Text("Continous",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white
                      ),),
        ),
      ),
      appBar: AppBar(
        title:  const Text("Cart Page",
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
      body: ListView(
        children: <Widget>[
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
        ],
      ),
    );
  }
}