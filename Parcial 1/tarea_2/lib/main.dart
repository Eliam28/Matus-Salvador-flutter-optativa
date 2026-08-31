import 'package:flutter/material.dart';

import 'package:tarea_2/widgets/CustomInput.dart';
import 'package:tarea_2/widgets/CustomText.dart';
import 'package:tarea_2/widgets/OperationButton.dart';
import 'package:tarea_2/widgets/ResetButton.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  final TextEditingController _numero1Controller = TextEditingController();

  final TextEditingController _numero2Controller = TextEditingController();

  String resultado = "";
  String accion = "";

  void actualizarResultado(String nuevoResultado, String nuevaAccion) {
    setState(() {
      resultado = nuevoResultado;
      accion = nuevaAccion;
    });
  }

  void resetearResultado() {
    setState(() {
      resultado = "";
      accion = "";
    });
  }

  @override
  void dispose() {
    _numero1Controller.dispose();
    _numero2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Calculadora"),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 30),

            CustomText(
              text: "Resultado: $resultado",
            ),

            const SizedBox(height: 10),

            CustomText(
              text: "Acción: $accion",
            ),

            const SizedBox(height: 30),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [

                  Row(
                    children: [
                      Expanded(
                        child: CustomInput(
                          label: "Num 1",
                          controller: _numero1Controller,
                        ),
                      ),

                      const SizedBox(width: 20),

                      Expanded(
                        child: CustomInput(
                          label: "Num 2",
                          controller: _numero2Controller,
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      OperationButton(
                        symbol: "+",
                        numero1Controller: _numero1Controller,
                        numero2Controller: _numero2Controller,
                        onResultado: actualizarResultado,
                      ),

                      OperationButton(
                        symbol: "-",
                        numero1Controller: _numero1Controller,
                        numero2Controller: _numero2Controller,
                        onResultado: actualizarResultado,
                      ),

                      OperationButton(
                        symbol: "*",
                        numero1Controller: _numero1Controller,
                        numero2Controller: _numero2Controller,
                        onResultado: actualizarResultado,
                      ),

                      OperationButton(
                        symbol: "/",
                        numero1Controller: _numero1Controller,
                        numero2Controller: _numero2Controller,
                        onResultado: actualizarResultado,
                      ),

                    ],
                  ),

                  const SizedBox(height: 40),

                  ResetButton(
                    numero1Controller: _numero1Controller,
                    numero2Controller: _numero2Controller,
                    onReset: resetearResultado,
                  ),

                ],
              ),
            ),

            const SizedBox(height: 40),
            
            Image.network(
              "https://i.pinimg.com/1200x/4c/5a/a3/4c5aa34e40c5819f2beae52020744d2d.jpg",
              height: 300,
              width: 300,
              )

          ],
        ),
      ),
    );
  }
}