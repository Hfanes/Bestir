import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/welcome.png")
                  ),
                ),
              ),
             const Text("Welcome",style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black
                ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const  <Widget>[
                    Text("Ready to Start Shopping Sign Up To get Start",
                    style: TextStyle(
                      fontSize: 16
                      ),
                      ),
                      Text("",
                      style: TextStyle(
                        fontSize: 16
                        ),
                        ),
                  ],
                ),
            ],
          ),
        ),
      ),

    );
  }
}