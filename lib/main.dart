import 'package:bestir/provider/category_provider.dart';
import 'package:bestir/provider/product_provider.dart';
import 'package:bestir/screens/home/home.dart';
import 'package:bestir/screens/login/login.dart';
import 'package:bestir/states/currentUser.dart';
import 'package:bestir/utils/ourTheme.dart';
import 'package:bestir/widgets/detailscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
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
          home: MultiProvider(
            providers: [
              ListenableProvider<ProductProvider>(create:((ctx) =>ProductProvider())),
              ListenableProvider<CategoryProvider>(create:((ctx) =>CategoryProvider())),
            ],
            child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx,snapshot){
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(iconTheme: IconThemeData(color: Colors.black)),
                  home: snapshot.hasData ? HomeScreeen():OurLogin(),
                );
              },
            ),
          )
          ),
    );
  }
}
