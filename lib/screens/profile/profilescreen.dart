import 'package:bestir/widgets/notification_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  
  Widget _buildSingleContainer({required String  startText,required String endText}){
    return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(20)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadiusDirectional.circular(20)
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(startText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                        ),
                        ),
                        Text(endText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                        fontWeight: FontWeight.bold
                        ),
                        ),
                  ],
                ),
              ),
            );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.grey,
          actions: [
            NotificationButton(),
          ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              color:Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                   CircleAvatar(
                    maxRadius: 65,
                    backgroundImage: AssetImage("assets/logouser.jpg"),
                   ),
                 ],
              ),
            ),
            Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       _buildSingleContainer(startText: "Name", endText: "Tiago Ferreira"),
                        _buildSingleContainer(startText: "Email", endText: "TiagoFerreira@gmail.com"),
                          _buildSingleContainer(startText: "Phone Number", endText: "912345678"),
                            _buildSingleContainer(startText: "Gender", endText: "Male")                    
                      ],
                    ),
                  )
          ],
        ),
      ),
     

        
     

    );
  }
}