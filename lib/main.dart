import 'package:bestir/screens/home/home.dart';
import 'package:bestir/screens/listProducts/listproducts.dart';
import 'package:bestir/screens/login/login.dart';
import 'package:bestir/screens/signup/signup.dart';
import 'package:bestir/states/currentUser.dart';
import 'package:bestir/utils/ourTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurretnUser(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: OurTheme().buildTheme(),
          home:HomeScreeen()),
    );
  }
}
