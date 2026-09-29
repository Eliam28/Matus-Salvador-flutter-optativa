import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchProducts() async {
  final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

  if(response.statusCode == 200){
    return jsonDecode(response.body);   
  }

  throw Exception("Eror al cargar productos");
}

Future<dynamic> fetchProductById(String id) async {
  final response = await http.get(Uri.parse("https://fakestoreapi.com/products/$id"));

  if (response.statusCode == 200){
    return jsonDecode(response.body);
  }

  throw Exception("Error al cargar el producto");
}

Future<List<dynamic>> fetchProductosCarrito(List<dynamic> productosCarrito,) async {

  List<dynamic> productos = [];

  for (var productoCarrito in productosCarrito) {

    final producto = await fetchProductById(productoCarrito["productId"].toString(),);

    productos.add(producto);
  }

  return productos;
}