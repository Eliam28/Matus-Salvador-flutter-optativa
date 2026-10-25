import 'package:examen/Login/LoginService.dart';
import 'package:examen/Products/ProductsService.dart';
import 'package:examen/cart_by_id/CartByIdService.dart';
import 'package:examen/carts/CartsService.dart';
import 'package:examen/product_by_id/ProductByIdService.dart';
import 'package:examen/user_by_id/UserByIdService.dart';
import 'package:examen/widgets/MyBottomNavigatorBar.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final LoginService loginService;
  final ProductsService productsService;
  final ProductByIdService productByIdService;
  final CartsService cartsService;
  final CartByIdService cartByIdService;
  final UserByIdService userByIdService;

  const LoginForm({
    super.key,
    required this.loginService,
    required this.productsService,
    required this.productByIdService,
    required this.cartsService,
    required this.cartByIdService,
    required this.userByIdService,
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
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
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
            cartsService: widget.cartsService,
            cartByIdService: widget.cartByIdService,
            userByIdService: widget.userByIdService,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

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