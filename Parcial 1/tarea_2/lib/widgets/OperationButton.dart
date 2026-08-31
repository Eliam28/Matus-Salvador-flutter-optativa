import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {

  final String symbol;
  final TextEditingController numero1Controller;
  final TextEditingController numero2Controller;
  final Function(String resultado, String accion) onResultado;

  const OperationButton({
    super.key,
    required this.symbol,
    required this.numero1Controller,
    required this.numero2Controller,
    required this.onResultado,
  });


  void calcular(BuildContext context) {

    String textoNumero1 = numero1Controller.text.trim();
    String textoNumero2 = numero2Controller.text.trim();

    if (textoNumero1.isEmpty || textoNumero2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Por favor ingresa los dos números",),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3,),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    double? numero1 = double.tryParse(textoNumero1);

    double? numero2 = double.tryParse(textoNumero2);

    if (numero1 == null || numero2 == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ingresa valores numéricos válidos",),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3,),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    double resultado = 0;
    String accion = "";

    switch (symbol) {

      case "+":
        resultado = numero1 + numero2;
        accion = "Suma";
        break;
      case "-":
        resultado = numero1 - numero2;
        accion = "Resta";
        break;
        
      case "*":
        resultado = numero1 * numero2;
        accion = "Multiplicación";
        break;
      case "/":

        if (numero2 == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("No se puede dividir entre cero",),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3,),
              behavior: SnackBarBehavior.floating,
            ),
          );
          return;
        }

        resultado = numero1 / numero2;
        accion = "División";
        break;
    }

    onResultado(resultado.toString(),accion,);

  }


  @override
  Widget build(BuildContext context) {

    return ElevatedButton(

      onPressed: () {
        calcular(context);
      },

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        minimumSize: const Size(55,55),
      ),

      child: Text(
        symbol,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}