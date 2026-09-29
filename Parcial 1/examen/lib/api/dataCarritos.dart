import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchCarritos() async {
  final response = await http.get(Uri.parse("https://fakestoreapi.com/carts"));

  if (response.statusCode == 200){ 
    return jsonDecode(response.body);
  }
  throw Exception("Error al cargar los carritos");
}

Future <dynamic> fetchCarritoById(String id) async {
  final response = await http.get(Uri.parse("https://fakestoreapi.com/carts/$id"));

  if(response.statusCode == 200){
    return jsonDecode(response.body);
  }

  throw Exception("Error al cargar el carrito");
}