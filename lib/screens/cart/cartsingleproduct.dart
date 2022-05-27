import 'package:flutter/material.dart';

class CartSingleProduct extends StatefulWidget {
 

  final String name;
  final String image;
   int quantity;
    final double price;

   CartSingleProduct({required this.name, required this.image, required this.quantity, required this.price});
  

  @override
  State<CartSingleProduct> createState() => _CartSingleProductState();
}

   
class _CartSingleProductState extends State<CartSingleProduct> {
  @override
  Widget build(BuildContext context) {

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
                            image:NetworkImage(widget.name),
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
                            Text(widget.image),
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
                                Text("Quantity"),
                                 Text(
                                   widget.quantity.toString(),
                                 style: const TextStyle(
                                   fontSize: 18
                                   ),
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
}