import 'dart:convert';

import 'package:examen/screens/detalleCarrito.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Carritoscreen extends StatelessWidget{
  const Carritoscreen({super.key});

  Future<List<dynamic>> loadcarritos() async {
    final String response = await rootBundle.loadString('lib/api/dataCarrito.json');

    final List<dynamic> data = jsonDecode(response);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Carrito de compra")),

      body: FutureBuilder<List<dynamic>>(
        future: loadcarritos(),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"),);
          }

          final carritos = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: carritos.length,

            itemBuilder: (context, index) {

              final carrito = carritos[index];

              return ListTile(
                minTileHeight: 80,

                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=> Detallecarrito(idCarrito:carrito["id"] ,))
                  );
                },

                leading: Image.network(
                  "https://img.pikbest.com/wp/202413/outline-sketch-shopping-cart-coloring-page-vector-illustration-drawing_10473014.jpg!bw800",
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),

               title: Text("Carrito - ${carrito["id"]}",),

                subtitle: Text("Clik para ver detalles",),
              );
            },
          );
        },
      ),
    );
  }
}