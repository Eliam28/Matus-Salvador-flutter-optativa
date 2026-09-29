import 'package:examen/api/dataUsers.dart';
import 'package:examen/widgets/MyBottomNavigatorBar.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final TextEditingController usuarioController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {

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

    try {

      await loginUser(usuarioIngresado, passwordIngresado,);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const MyBottomNavigatorBar(),
        ),
      );

    } catch (error) {

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Usuario o contraseña incorrectos",
          ),
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

    return Column(
      children: [

        TextField(
          controller: usuarioController,
          decoration: const InputDecoration(
            hintText: "Usuario",
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
    );
  }
}