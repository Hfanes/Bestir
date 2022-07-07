import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';
class AddProduct extends StatelessWidget {

  final controller=TextEditingController();
 
 
   
   final TextEditingController cname = TextEditingController();
   final TextEditingController cdes =  TextEditingController();
   final TextEditingController cprice =  TextEditingController();
   final TextEditingController cimage = TextEditingController();


  //const AddProduct({Key? key}) : super(key: key);
  

  Future createCap({required String name,required String description,required double price,required String image})async{
    final docProduct=FirebaseFirestore.instance.collection("category").doc("CQaOOiVnrpTB9n0nPRKj").collection("cap").doc();
      final json={
        'name':name,
        "price":price,
        "image":image,
        "description":description
      };
      await docProduct.set(json);
  }
  
  Future createDress({required String name,required String description,required double price,required String image})async{
    final docProduct=FirebaseFirestore.instance.collection("category").doc("CQaOOiVnrpTB9n0nPRKj").collection("dress").doc();
      final json={
        'name':name,
        "price":price,
        "image":image,
        "description":description
      };
      await docProduct.set(json);
  }

  Future createShirt({required String name,required String description,required double price,required String image})async{
    final docProduct=FirebaseFirestore.instance.collection("category").doc("CQaOOiVnrpTB9n0nPRKj").collection("shirt").doc();
      final json={
        'name':name,
        "price":price,
        "image":image,
        "description":description
      };
      await docProduct.set(json);
  }
  
  Future createShoes({required String name,required String description,required double price,required String image})async{
    final docProduct=FirebaseFirestore.instance.collection("category").doc("CQaOOiVnrpTB9n0nPRKj").collection("shoes").doc();
      final json={
        'name':name,
        "price":price,
        "image":image,
        "description":description
      };
      await docProduct.set(json);
  }
  
  Future createWatch({required String name,required String description,required double price,required String image})async{
    final docProduct=FirebaseFirestore.instance.collection("category").doc("CQaOOiVnrpTB9n0nPRKj").collection("watch").doc();
      final json={
        'name':name,
        "price":price,
        "image":image,
        "description":description
      };
      await docProduct.set(json);
  }

  Widget _buildAllTextFormField() {
    return Container(
      child: Column(
        children: <Widget>[
         TextFormField(
          controller: cdes,
           decoration: const InputDecoration( hintText: "Description"),
        ),   
         TextFormField(
          controller: cname,
           decoration: const InputDecoration( hintText: "Name"),
        ), 
         TextFormField(
          controller: cimage,
           decoration: const InputDecoration( hintText: "Image"),
        ), 
         TextFormField(
          controller: cprice,
           decoration: const InputDecoration( hintText: "Price"),
        ),    
        ],
      ),
    );
  }

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
      title:Text( "Add Product"),
      centerTitle: true,
    leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreeen(),
                ),
              );
            },
          ),
    ),
     body: Container(
      height: 900,
      child: ListView(
        
      children:<Widget>[
        TextFormField(
          controller: cdes,
           decoration: const InputDecoration( hintText: "Description"),
        ),
         TextFormField(
          controller: cname,
           decoration: const InputDecoration( hintText: "Name"),
        ),
         TextFormField(
          controller: cprice,
           decoration: const InputDecoration( hintText: "Price"),
        ),
         TextFormField(
          controller: cimage,
           decoration: const InputDecoration( hintText: "Image"),
        ),
        ElevatedButton(
          onPressed: (){
            
          createCap(name: cname.text, description: cdes.text, price:double.parse(cprice.text), image: cimage.text);
        }, 
        child: Text(
          "Add Cap")
          ),
          Container(
            height: 30,
            color: Colors.amber,
          ),
           TextFormField(
          controller: cdes,
           decoration: const InputDecoration( hintText: "Description"),
        ),
         TextFormField(
          controller: cname,
           decoration: const InputDecoration( hintText: "Name"),
        ),
         TextFormField(
          controller: cprice,
           decoration: const InputDecoration( hintText: "Price"),
        ),
         TextFormField(
          controller: cimage,
           decoration: const InputDecoration( hintText: "Image"),
        ),
        ElevatedButton(
          onPressed: (){
          createDress(name: cname.text, description: cdes.text, price:double.parse(cprice.text) , image: cimage.text);
        }, 
        child: Text(
          "Add Dress")
          ),
          Container(
            height: 30,
            color: Colors.amber,
          ),
           TextFormField(
          controller: cdes,
           decoration: const InputDecoration( hintText: "Description"),
        ),
         TextFormField(
          controller: cname,
           decoration: const InputDecoration( hintText: "Name"),
        ),
         TextFormField(
          controller: cprice,
           decoration: const InputDecoration( hintText: "Price"),
        ),
         TextFormField(
          controller: cimage,
           decoration: const InputDecoration( hintText: "Image"),
        ),
        ElevatedButton(
          onPressed: (){
          createShirt(name: cname.text, description: cdes.text, price:double.parse(cprice.text) , image: cimage.text);
        }, 
        child: Text(
          "Add Shirt")
          ),
          Container(
            height: 30,
            color: Colors.amber,
          ),
           TextFormField(
          controller: cdes,
           decoration: const InputDecoration( hintText: "Description"),
        ),
         TextFormField(
          controller: cname,
           decoration: const InputDecoration( hintText: "Name"),
        ),
         TextFormField(
          controller: cprice,
           decoration: const InputDecoration( hintText: "Price"),
        ),
         TextFormField(
          controller: cimage,
           decoration: const InputDecoration( hintText: "Image"),
        ),
        ElevatedButton(
          onPressed: (){
          createShoes(name: cname.text, description: cdes.text, price:double.parse(cprice.text) , image: cimage.text);
        }, 
        child: Text(
          "Add Shoes")
          ),
          Container(
            height: 30,
            color: Colors.amber,
          ),
          TextFormField(
          controller: cdes,
           decoration: const InputDecoration( hintText: "Description"),
        ),
         TextFormField(
          controller: cname,
           decoration: const InputDecoration( hintText: "Name"),
        ),
         TextFormField(
          controller: cprice,
           decoration: const InputDecoration( hintText: "Price"),
        ),
         TextFormField(
          controller: cimage,
           decoration: const InputDecoration( hintText: "Image"),
        ),
        ElevatedButton(
          onPressed: (){
          createWatch(name: cname.text, description: cdes.text, price:double.parse(cprice.text) , image: cimage.text);
        }, 
        child: Text(
          "Add Watch")
          ),
      ],
    ),
    )
  );
  }
}

  