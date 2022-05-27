import 'package:bestir/provider/product_provider.dart';
import 'package:bestir/screens/cart/cartsingleproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

late ProductProvider productProvider;

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
     productProvider=Provider.of<ProductProvider>(context);
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
    body: SingleChildScrollView(
     scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 470,
                child: ListView.builder(
        itemCount: productProvider.getCartModelListLength,
       itemBuilder:(ctx,index){
         return CartSingleProduct(
                  name:productProvider.getCartModelList[index].name,
                 image: productProvider.getCartModelList[index].image,
                  quantity: productProvider.getCartModelList[index].quantity,
                   price: productProvider.getCartModelList[index].price
                      );
                   }
                 ),
              ),
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
    ),
    );
    
  }
}