import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supricemarkt_app/Data/model/Producto.dart';
import 'package:supricemarkt_app/Screens/HomeScreen.dart';

class ListScreen extends StatefulWidget {
  List<Producto>? lista_productos_2;

  ListScreen(this.lista_productos_2);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {


  void reset(){
    setState(() {
      widget.lista_productos_2!.clear();
    });
  }



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SingleChildScrollView(
          child: Column(
            children: [
               Header(),
              widget.lista_productos_2!.isEmpty ? NoItems(): Products(widget.lista_productos_2!, reset)
            ],
          ),
      ),
    );
  }

  Widget NoItems(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),

      alignment: Alignment.center,
      decoration: BoxDecoration(color: Color(0xffFF2E63),
        border: Border(
          bottom: BorderSide(width:10.0, color: Color(0xffF4EEED)),
        ),),
      child: Column(
        children: [
         Image.asset('static/empty.png'),
          SizedBox(height: 15.0),
          Text("NO HAY PRODUCTOS", style: TextStyle(color: Color(0xffF4EEED), fontSize: 25.0, fontWeight: FontWeight.bold)),
        ],
      )
    );
  }


  Widget Products(List<Producto> lista_productos, Function() reset){
    double precio = 0.0;
    lista_productos.forEach((element) {
      String precio_formateado = element.precio!.replaceAll("€", "").replaceAll(",", ".");

      precio += double.parse(precio_formateado);
    });


    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),

                decoration: BoxDecoration(color: Color(0xffEEEEEE),borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                  icon: Image.asset('static/reset.png'),
                  onPressed: () {
                    reset();
                  },
                ),
              ),
              Container(
                height: 50,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Color(0xffEEEEEE)
                  ),
                  child: Text("TOTAL: ${precio}€",
                      style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Color(0xff0F4C75)))),
            ],
          ),
        ),

        Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: EdgeInsets.only(top: 50),
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:lista_productos.length,
            itemBuilder: (_, index) =>ProductItem(lista_productos[index]),
          ),
        ),
      ],
    );
  }

  Widget ProductItem(Producto producto){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 2.5),
      width: 300.0,
      height: 200,
      decoration: BoxDecoration( color: Color(0xff1B262C)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(producto.imagen!, width: 150.0,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [

                    Text(
                      producto.supermercado!, style: TextStyle(color: Color(0xffCCF2F4), fontWeight: FontWeight.bold,fontSize:25.0),
                    ),
                    Text(
                      producto.nombre!, textAlign: TextAlign.center,overflow:TextOverflow.ellipsis ,
                      style: TextStyle(color:Color(0xffEEEEEE), fontWeight: FontWeight.bold,fontSize:17.0),
                    ),
                    Text(producto.precio!,
                        style: TextStyle(color:Color(0xffF73859), fontWeight: FontWeight.bold,fontSize: 20.0)),
                  ],
                ),
              ),],
          )
        ],
      ),
    );
  }

  Widget Header(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(color:Color(0xffFEF2F4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Lista De La Compra",
              style:TextStyle(color:Color(0xff0F4C75),fontSize: 25.0, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
          Image.asset("static/compra.png")
        ],
      ),
    );
  }
}
