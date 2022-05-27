import 'package:badges/badges.dart';
import 'package:bestir/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationButton extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider=Provider.of<ProductProvider>(context);

    return Badge(
      position: BadgePosition(top: 5,end: 5),
      badgeContent: Text(
        productProvider.getNotificationIndex.toString(),
        style: TextStyle(
          fontSize: 15,
            fontWeight: FontWeight.bold
            ),
          ),
      badgeColor: Colors.redAccent,
      child:IconButton(
        icon: Icon(
          Icons.notifications_none,color: Colors.black,),
      onPressed: (){

        },
      ),
    );
  }
}