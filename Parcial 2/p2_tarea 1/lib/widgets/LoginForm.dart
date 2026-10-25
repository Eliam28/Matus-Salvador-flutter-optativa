import 'package:examen/Login/LoginService.dart';
import 'package:examen/Products/ProductsService.dart';
import 'package:examen/product_by_id/ProductByIdService.dart';
import 'package:examen/widgets/MyBottomNavigatorBar.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final LoginService loginService;
  final ProductsService productsService;
  final ProductByIdService productByIdService;

  const LoginForm({
    super.key,
    required this.loginService,
    required this.productsService,
    required this.productByIdService,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final username = usuarioController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ingrese ambos campos"),
        ),
      );

      return;
    }

    try {
      await widget.loginService.login(
        username,
        password,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyBottomNavigatorBar(
            productsService: widget.productsService,
            productByIdService: widget.productByIdService,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuario o contraseña incorrectos"),
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
          ),
        ),

        const SizedBox(height: 20),

        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
            hintText: "Contraseña",
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