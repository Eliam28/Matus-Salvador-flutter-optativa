import 'package:flutter/material.dart';
import 'package:tarea_3/widgets/CustomButton.dart';

class Pantalla2 extends StatelessWidget {

  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla 2"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: SizedBox(
          width: double.infinity,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              const SizedBox(height: 30),

              const CustomButton(
                texto: "Botón 1",
              ),

              const SizedBox(height: 20),

              const CustomButton(
                texto: "Botón 2",
              ),

              const SizedBox(height: 20),

              const CustomButton(
                texto: "Botón 3",
                readOnly: true,
              ),

              const SizedBox(height: 20),

              const CustomButton(
                texto: "Botón 4",
              ),

              const SizedBox(height: 20),

              const CustomButton(
                texto: "Botón 5",
              ),

            ],
          ),
        ),
      ),
    );
  }
}