import 'package:bestir/screens/login/localwidgets/loginform.dart';
import 'package:flutter/material.dart';

import 'localwidgets/signUpForm.dart';

class OurSignUp extends StatelessWidget {
  const OurSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(40.0),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    BackButton(
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  height: 250,
                  width: 300,
                  child: Image.asset("assets/logo.png"),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const OurSignUpForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
