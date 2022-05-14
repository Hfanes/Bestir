import 'package:bestir/screens/home/home.dart';
import 'package:bestir/widgets/singleproduct.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
    final String name;

     const ListProduct({required this.name});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("List Products",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold) ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0.0,
        leading:IconButton(icon: Icon(Icons.arrow_back),onPressed:(){ Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>HomeScreeen()));}),
        actions: <Widget>[
          IconButton(
             icon: Icon(Icons.search),
             onPressed: (){}
             ),
          IconButton( 
            icon: Icon(Icons.notifications_none,),
            onPressed: (){}
            ),
        ],
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal:20),
        child: ListView(
          children:<Widget> [
            Column(
              children: <Widget>[
                    Container(
                                height:50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          name,
                                          style: const TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                             const SizedBox(
                               height: 10,
                               ),
                         Container(
                           height: 700,
                           child: GridView.count(
                             crossAxisSpacing: 10,
                             childAspectRatio: 0.9,
                             crossAxisCount: 2,
                             scrollDirection: Axis.vertical,
                             children: <Widget>[
                                       SingleProduct(image:"relogio", price:43.0, name:"relogio.jpg"),
                                       SingleProduct(image:"Camisola", price:20.0, name:"camisola.jpg"),
                                       SingleProduct(image:"relogio", price:43.0, name:"relogio.jpg"),
                                       SingleProduct(image:"Camisola", price:20.0, name:"camisola.jpg"),
                                       SingleProduct(image:"relogio", price:43.0, name:"relogio.jpg"),
                                       SingleProduct(image:"relogio", price:43.0, name:"relogio.jpg"),
                                       SingleProduct(image:"relogio", price:43.0, name:"relogio.jpg"),
                                       SingleProduct(image:"Camisola", price:20.0, name:"camisola.jpg"),
                           ],
                           ),
                         )
                      ],
                     ),
          ],
        ),
              ),
             );
           }
          }