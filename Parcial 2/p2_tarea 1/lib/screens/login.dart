import 'package:examen/widgets/LoginForm.dart';
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
                      color: Colors.lightBlue
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}