import 'package:flutter/material.dart';
import 'package:supricemarkt_app/screens/HomeScreen.dart';
import 'package:supricemarkt_app/screens/SplashScreen.dart';


void main() {
  runApp(const MyApp());
}

/*
* colors
*
* black -> 1B262C
* dark blue -> 0F4C75
* blue -> 3282B8
* light blue -> BBE1FA
*
* red -> D14D72
* orange -> FFABAB
* light orange -> FCC8D1
* white -> FEF2F4
* */

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuPriceMarkt',
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
        routes: {
          '/home': (ctx) => const HomeScreen(),
        }
    );
  }
}
