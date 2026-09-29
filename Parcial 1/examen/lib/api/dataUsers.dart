import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchUserById(String id) async {
  final response = await http.get(Uri.parse("https://fakestoreapi.com/users/$id"));

  if (response.statusCode == 200){
    return jsonDecode(response.body);
  }

  throw Exception("Error al cargar usuario");

}

Future<dynamic> loginUser(String username,String password,) async {
  
  final response = await http.post( 
    
    Uri.parse("https://dummyjson.com/auth/login"),

    headers: {
      "Content-Type": "application/json",
    },

    body: jsonEncode({
      "username": username,
      "password": password,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }

  throw Exception("Usuario o contraseña incorrectos");
}