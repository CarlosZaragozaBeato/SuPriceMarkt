import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:supricemarkt_app/Data/model/Producto.dart';



class Data {



  static Future<List<List<List<String>>>> buscarProducto(String producto) async {
     Future<List<List<List<String>>>> lista_productos= Future(() => []);
    var url2 = Uri.parse('http://192.168.1.141:8000/main/api/search?producto=$producto');
    var response = await http.get(url2);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) ;
      lista_productos = Future(()=>formatearLista(jsonResponse));
    } else {print(response);}
     return lista_productos;
    }

    static List<List<List<String>>> formatearLista(List<dynamic> lista) {
      List<List<List<String>>> transformedList = lista.map((element) =>
          (element as List<dynamic>).map((innerElement) =>
              (innerElement as List<dynamic>).map((innermostElement) =>
                  innermostElement.toString()).toList()
          ).toList()
      ).toList();
    return   transformedList;
  }





}