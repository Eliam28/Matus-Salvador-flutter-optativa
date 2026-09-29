import 'package:examen/widgets/MyBottomNavigatorBar.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),

        child: SizedBox(
          width: double.infinity,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 250),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.storefront,size: 45),

                  SizedBox(width: 12),

                  Text(
                    "TIENDA EXAMEN",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 30),

              const TextField(
                decoration: InputDecoration(
                  hintText: "Usuario / Correo",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              const TextField(
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 35),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context) => const MyBottomNavigatorBar(),
                    ),
                  );
                },
                child: const Text("Aceptar"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}