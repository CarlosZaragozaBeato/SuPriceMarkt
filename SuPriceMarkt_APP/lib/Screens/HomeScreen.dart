import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:supricemarkt_app/Data/model/Producto.dart';
import 'package:supricemarkt_app/screens/ListScreen.dart';
import 'package:supricemarkt_app/screens/SearchScreen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

List<Producto> lista_productos = [];


class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    SearchScreen(lista_productos),
    ListScreen(lista_productos),
  ];
  final List<String> _titles = [
    "Busqueda",
    "TOTAL",
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color(0xff2C3639),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color(0xff2C3639),
          color:Color(0xff1B262C),
          buttonBackgroundColor: Color(0xff1B262C),
          animationDuration: Duration(milliseconds: 300),
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            Icon(Icons.home, color: Color(0xffFEF2F4),),
            Icon(Icons.shopping_bag,color: Color(0xffFEF2F4)),
          ]),
      body: SafeArea(child: _children[_selectedIndex]),


    );
  }
}

