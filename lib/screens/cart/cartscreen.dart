import 'package:bestir/provider/product_provider.dart';
import 'package:bestir/screens/cart/cartsingleproduct.dart';
import 'package:bestir/screens/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatefulWidget {
  
  @override
  State<CartScreen> createState() => _CartScreenState();
}
late ProductProvider productProvider;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
      productProvider=Provider.of<ProductProvider>(context);
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
                        onPressed: (){ 
                          
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context)=>CheckOut(),
                              ),
                            );

                        },
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
        iconTheme: IconThemeData(color: Colors.black),
            actions: <Widget>[
              IconButton(
                icon:const  Icon(
                  Icons.notifications_none,
                  color: Colors.black,),
                  onPressed: (){},
                  ),
            ],
      ),
      body: ListView.builder(
        itemCount: productProvider.getCartModelListLength,
     itemBuilder: (ctx,index)=>CartSingleProduct(
       //isCount:false,
       name: productProvider.getCartModelList[index].name,
        image: productProvider.getCartModelList[index].image,
         quantity: productProvider.getCartModelList[index].quantity,
          price: productProvider.getCartModelList[index].price),

      ),
    );
  }
}