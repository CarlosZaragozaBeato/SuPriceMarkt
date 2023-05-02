
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:supricemarkt_app/Components/TextFieldCustom.dart';
import 'package:supricemarkt_app/Data/model/Producto.dart';
import 'package:supricemarkt_app/Data/responses/Data.dart';

class SearchScreen extends StatefulWidget {
  List<Producto>? lista_productos_2;

  SearchScreen(this.lista_productos_2);

  List<List<List<String>>> _lista_productos = [];
  String estado_aplicacion = "NO_DATA";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController producto_controller = TextEditingController();

  void GetData() async {
    setState(() {
      widget.estado_aplicacion = "CARGANDO";
    });
    Data.buscarProducto(producto_controller.text)
        .then((value) {
      setState(() {
        widget._lista_productos = value;
        widget.estado_aplicacion = "DATA_CARGADA";
      });
    })
        .catchError((error) {
      setState(() {
        widget.estado_aplicacion = "CARGANDO";
      });
    });
  }

  void addProducto(Producto producto){
    setState(() {
      widget.lista_productos_2?.add(producto);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldCustom((p0){
              GetData();
              }, "Buscar Producto", producto_controller),
            widget.estado_aplicacion == "NO_DATA"? Infomacion():
          widget.estado_aplicacion == "CARGANDO"?
          Lottie.asset('static/loading.json') :ProductosSection(widget._lista_productos, addProducto),
        ]),
      ),
    );
  }


  Widget ProductosSection(List<List<List<String>>> listaProductos, Function(Producto) addProducto){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children:[
         Text("SUPERMERCADOS",
          style:TextStyle(fontWeight:FontWeight.bold,fontSize: 25.0, color: Color(0xfFEEEEEE))),

        Supermercado("Día", 0xffD14D72,listaProductos[0], addProducto),
        Supermercado("Carrefour", 0xff3282B8,listaProductos[1], addProducto),
        Supermercado("Ahorra Más", 0xff27496D,listaProductos[2], addProducto)
      ]
      ),
    );
  }
  Widget Supermercado(String nombre,int color ,List<List<String>>listaProductos, Function(Producto) addProducto) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
      color: Color(0xffB7B7B7),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xffFDFDFD),
                border: Border(
                  bottom: BorderSide(width:2.0, color: Color(0xffB7B7B7)),
                ),),
                padding:  EdgeInsets.symmetric(vertical: 10.0),
                child: Text(nombre, style: TextStyle(fontSize:30.0,color: Color(color), fontWeight: FontWeight.bold))
            ),
          FilaProductos(listaProductos,addProducto,nombre)
        ],
      ),
    );
  }

  Widget FilaProductos(List<List<String>> listaProductos, Function(Producto) addProducto,String supermercado){
    return
      listaProductos.isNotEmpty?
      CarouselSlider(
        options: CarouselOptions(height: 350.0),
        items: listaProductos.map((card) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: .5),
                child: ProductoItem(card, addProducto,supermercado),
              );
            },
          );
        }).toList(),
  ):Container(
        width: double.infinity,
        height: 50.0,
        alignment: Alignment.center,
        child: Container(
            width: double.infinity,
            height: 100.0,
            alignment: Alignment.center,
            color: Color(0xff1B262C),
            child: Text("No hay productos", style:TextStyle(color:Color(0xffEEEEEE), fontSize: 20.0))),
      );
}
  Widget ProductoItem(Object item, Function(Producto) addProducto, String supermercado){
    List<String> producto = item as List<String>;
    String nombreProducto = producto[0];
    String precio = producto[1];
    String imagen = producto[2] as String;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 0),
        width: 300.0,
        //margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5.0),
        height: double.infinity,
        decoration: BoxDecoration( color: Color(0xff212A3E),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(imagen, width: 100.0,height: 200,),
              Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                   child: Column(
                     children: [
                       Text(
                         nombreProducto, textAlign: TextAlign.center,overflow:TextOverflow.ellipsis ,
                         style: TextStyle(color:Color(0xffEEEEEE), fontWeight: FontWeight.bold,fontSize:17.0),
                       ),
                       Text(precio,
                         style: TextStyle(color:Color(0xffF73859), fontWeight: FontWeight.bold,fontSize: 20.0)),
                     ],
                   ),
                 ),
                  ElevatedButton(onPressed: (){
                    Producto prd = Producto(nombre: nombreProducto, precio: precio, supermercado: supermercado, imagen:imagen);
                      addProducto(prd);
                   },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(side: BorderSide.none)),
                      ),
                      child: Text("AÑADIR A LA CESTA"))],
              )
          ],

      ),
    );
  }





  Widget Infomacion (){
    return Container(
      padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
      color: Color(0xffFEF2F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text("Funciones", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, ),),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("En la aplicación podrás buscar productos en tres supermercados diferentes: ",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, ),),
                Text("     Ahorra Más"),
                Text("     Carrefour"),
                Text("     Día"),
              ]),
        ),
       const  Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text("- Principalmente, podrás buscar los productos por su nombre y la aplicación se encargará de buscas en los distintos supermercados los podructos que coincididan con el nombre insertado ",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, ),),
        ),
        const Text("- Tendrás la opción de buscar el producto por su código EAN, sin embargo, esta función solo estará disponible en los supermercados Carrefour y Día.",
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, ),
        ),


      ],
    ));
  }
}

