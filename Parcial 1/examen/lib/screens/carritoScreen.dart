import 'dart:convert';

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
            padding: const EdgeInsets.all(20),
            itemCount: carritos.length,

            itemBuilder: (context, index) {

              final carrito = carritos[index];

              return ListTile(
                leading: Image.network(
                  "https://cdn5.coppel.com/pm/5660233-1.jpg?iresize=width:846,height:677",
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),

               title: Text(
                  "Cliente - ${carrito["userId"]}",
                ),

                subtitle: Text(
                  "Clik para ver detalles",
                ),
              );
            },
          );
        },
      ),
    );
  }
}