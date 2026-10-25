import 'package:examen/Login/LoginService.dart';
import 'package:examen/Products/ProductsService.dart';
import 'package:examen/cart_by_id/CartByIdService.dart';
import 'package:examen/carts/CartsService.dart';
import 'package:examen/product_by_id/ProductByIdService.dart';
import 'package:examen/user_by_id/UserByIdService.dart';
import 'package:examen/widgets/LoginForm.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final LoginService loginService;
  final ProductsService productsService;
  final ProductByIdService productByIdService;
  final CartsService cartsService;
  final CartByIdService cartByIdService;
  final UserByIdService userByIdService;

  const LoginScreen({
    super.key,
    required this.loginService,
    required this.productsService,
    required this.productByIdService,
    required this.cartsService,
    required this.cartByIdService,
    required this.userByIdService,
  });

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

              LoginForm(
                loginService: loginService,
                productsService: productsService,
                productByIdService: productByIdService,
                cartsService: cartsService,
                cartByIdService: cartByIdService,
                userByIdService: userByIdService,
              ),
            ],
          ),
        ),
      ),
    );
  }
}