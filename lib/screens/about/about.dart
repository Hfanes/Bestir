import 'package:bestir/screens/home/home.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> redirectTo() async {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreeen();
      }));
      return true;
    }

    return WillPopScope(
      onWillPop: redirectTo,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xfff8f8f8),
          title: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomeScreeen()));
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 27),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              Image(
                image: AssetImage("assets/welcome.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 280,
                width: 360,
                child: Wrap(
                  children: [
                    Text(
                      "Somos uma loja de roupa",
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
