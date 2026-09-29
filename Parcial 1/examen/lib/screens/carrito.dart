import 'package:examen/api/dataCarritos.dart';
import 'package:examen/screens/detalleCarrito.dart';
import 'package:flutter/material.dart';


class Carritoscreen extends StatelessWidget{
  const Carritoscreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Carritos de compra")),

      body: FutureBuilder<List<dynamic>>(
        future: fetchCarritos(),

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

                subtitle: Text("Click para ver detalles",),
              );
            },
          );
        },
      ),
    );
  }
}