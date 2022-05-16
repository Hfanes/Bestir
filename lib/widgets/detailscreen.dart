import 'dart:ui';

import 'package:bestir/screens/home/home.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {

  final String image;
  final String name;
  final double price;
    DetailScreen({required this.image,required this.name,required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count=1;

  Widget _buildSizeColorProduct(String size,Color color){
      return Container(
        
              height:60,
              width: 60,
              color: color,
              child: Center(
                child:Text(size,
                style: const TextStyle(
                  fontSize: 18
                  ),
                ),
              ),
            ); 
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,
        style:const TextStyle(
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
            onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx)=>HomeScreeen(),
                  ),
                 );
                },
               ) ,
            actions: <Widget>[
              IconButton(
                icon:const  Icon(
                  Icons.notifications_none,
                  color: Colors.black,),
                  onPressed: (){},
                  ),
            ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 350,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(13),
                        child: Container(
                          height: 220,
                          decoration:BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image:AssetImage("assets/${widget.image}"))
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical:10,horizontal:10 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Container(
                        height: 100,
                        child: Row(
                          children:<Widget> [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                Text(widget.name,
                                style: const TextStyle(
                                  fontSize: 18
                                    ),
                                    ),
                                    Text("\$ ${widget.price.toString()}",
                                    style:const TextStyle(
                                      fontSize: 18,
                                      fontStyle:FontStyle.italic,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    const Text("Description",
                                style: TextStyle(
                                  fontSize: 18
                                    ),
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        child: ListView(//Container
                          children:const  <Widget>[
                            Text("It is will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lores will bpoint of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, cMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident",
                            style: TextStyle(
                              fontSize: 15
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const  Text("Size",style: TextStyle(
                        fontSize: 18,
                      ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 265,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                             _buildSizeColorProduct("S", Colors.grey),
                             _buildSizeColorProduct("M", Colors.grey),
                             _buildSizeColorProduct("L", Colors.grey),
                             _buildSizeColorProduct("XL", Colors.grey),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      const  Text("Color",style: TextStyle(
                        fontSize: 18,
                      ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 265,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                           _buildSizeColorProduct("Green", Colors.green),
                           _buildSizeColorProduct("Blue", Colors.blue),
                           _buildSizeColorProduct("Orange", Colors.orange),
                           _buildSizeColorProduct("Yellow", Colors.yellow),
                          ],
                        ),
                      ),
                     const  SizedBox(height: 10,),
                     const Text("Quantity",
                      style: TextStyle(
                        fontSize: 18,
                        ),
                        ),
                         const  SizedBox(height: 10,),
                       Container(
                         height: 40,
                         width: 130,
                         decoration:BoxDecoration(
                           color: Color.fromARGB(255, 181, 144, 189),
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

                                  });
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
                       const SizedBox(height: 15,),
                  Container(
                    //color: Colors.pink,
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                        
                      ),
                      onPressed: (){},
                     child:const Text("Add Product",
                     style: TextStyle(
                       fontSize:18
                           ),
                         ),
                       ),
                     )
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