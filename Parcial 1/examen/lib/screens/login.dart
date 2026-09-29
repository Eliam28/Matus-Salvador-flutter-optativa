import 'dart:convert';

import 'package:examen/widgets/MyBottomNavigatorBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<List<dynamic>> loadUsers() async {

    final String response = await rootBundle.loadString('lib/api/dataUser.json');

    final List<dynamic> users = jsonDecode(response);

    return users;
  }

  Future<void> login() async {

    final users = await loadUsers();

    if (!mounted) return;

    String usuarioIngresado = usuarioController.text.trim();
    String passwordIngresado = passwordController.text.trim();

    if (usuarioIngresado.isEmpty || passwordIngresado.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ingrese ambos campos"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return;
    }

    bool usuarioEncontrado = false;

    for (var user in users) {

      String username = user["username"];
      String email = user["email"];
      String password = user["password"];

      if ((usuarioIngresado == username || usuarioIngresado == email) && passwordIngresado == password) {
        usuarioEncontrado = true;
        break;
      }
    }

    if (usuarioEncontrado) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyBottomNavigatorBar(),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuario o contraseña incorrectos"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  void dispose() {
    usuarioController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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

                  Icon(
                    Icons.storefront,
                    size: 45,
                  ),

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

              TextField(
                controller: usuarioController,
                decoration: const InputDecoration(
                  hintText: "Usuario / Correo",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 35),

              ElevatedButton(
                onPressed: login,
                child: const Text("Aceptar"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}