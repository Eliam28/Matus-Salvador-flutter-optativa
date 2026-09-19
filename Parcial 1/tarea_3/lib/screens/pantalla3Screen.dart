import 'package:flutter/material.dart';

class Pantalla3 extends StatefulWidget {
  const Pantalla3({super.key});

  @override
  State<Pantalla3> createState() => _Pantalla3State();
}

class _Pantalla3State extends State<Pantalla3> {

  int cantidad = 1;

  void aumentarCantidad() {
    setState(() {
      cantidad++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Producto"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Red Dead Redemption",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Image.network(
                "https://static.wikia.nocookie.net/rdr/images/a/a7/Red_Dead_Redemption.jpg/revision/latest?cb=20100417083406&path-prefix=es",
                width: 250,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 25),

            const Center(
              child: Text(
                "Precio: \$49.99 USD",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Descripción",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Red Dead Redemption sigue la historia del exforajido "
              "John Marston, quien debe perseguir a antiguos miembros "
              "de su banda después de que agentes federales amenazan "
              "a su familia. El juego se desarrolla en el Oeste "
              "estadounidense y México e incluye también Undead Nightmare.",
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurpleAccent,
                    ),

                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Text(
                    "$cantidad",
                  ),
                ),

                ElevatedButton(
                  onPressed: aumentarCantidad,
                  child: const Text("+"),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}