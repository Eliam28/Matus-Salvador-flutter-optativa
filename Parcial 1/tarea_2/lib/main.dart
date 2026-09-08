import 'package:flutter/material.dart';
import 'package:tarea_2/Props/NumInpProps.dart';
import 'package:tarea_2/Props/OpBtnProps.dart';
import 'package:tarea_2/widgets/CustomInput.dart';
import 'package:tarea_2/widgets/NumberInput.dart';
import 'package:tarea_2/widgets/OperationButton.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController inputIzq = TextEditingController();
    TextEditingController inputDer = TextEditingController();
    TextEditingController inputRespuesta = TextEditingController();
    FocusNode focusIzq = FocusNode();
    FocusNode focusDer = FocusNode();

    Opbtnprops actionProps = Opbtnprops(inputIzq: inputIzq, inputDer: inputDer, inputRespuesta: inputRespuesta);
    Numinpprops numProps = Numinpprops(focusDer: focusDer, focusIzq: focusIzq, inputDer: inputDer, inputIzq: inputIzq);

    return MaterialApp(
      home: Scaffold(

       appBar: AppBar(
        title: const Text("Calculadora 2"),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
       ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Row(
              children: [
                Expanded(child: Custominput(input: inputIzq, labelText: "Numero 1", focusNode: focusIzq,)),
                const SizedBox(width: 16,),
                Expanded(child: Custominput(input: inputDer, labelText: "Numero 2", focusNode: focusDer,))
              ],
            ),

            const SizedBox(height: 26,),

            Center(
              child: Custominput(input: inputRespuesta, labelText: "Respuesta", readOnly: true,),
            ),

            const SizedBox(height: 26,),

            Row(
              children: [
                Expanded(child: Numberinput(props: numProps, labelNumber: "1",)),
                const SizedBox(width: 16,),
                Expanded(child: Numberinput(props: numProps, labelNumber: "2",)),
                const SizedBox(width: 16,),
                Expanded(child: Numberinput(props: numProps, labelNumber: "3",)),
              ],
            ),

            const SizedBox(height: 26,),

            Row(
              children: [
                Expanded(child: Numberinput(props: numProps, labelNumber: "4",)),
                const SizedBox(width: 16,),
                Expanded(child: Numberinput(props: numProps, labelNumber: "5",)),
                const SizedBox(width: 16,),
                Expanded(child: Numberinput(props: numProps, labelNumber: "6",)),
              ],
            ),

            const SizedBox(height: 26,),

            Row(
              children: [
                Expanded(child: Numberinput(props: numProps, labelNumber: "7",)),
                const SizedBox(width: 16,),
                Expanded(child: Numberinput(props: numProps, labelNumber: "8",)),
                const SizedBox(width: 16,),
                Expanded(child: Numberinput(props: numProps, labelNumber: "9",)),
              ],
            ),

            const SizedBox(height: 26,),

            Center(child: Numberinput(props: numProps, labelNumber: "0",),),

            const SizedBox(height: 26,),

            Row(
              children: [
                Expanded(child: Operationbutton(props: actionProps, labelAction: "+")),
                const SizedBox(width: 16,),
                Expanded(child: Operationbutton(props: actionProps, labelAction: "-")),
                const SizedBox(width: 16,),
                Expanded(child: Operationbutton(props: actionProps, labelAction: "*")),
                const SizedBox(width: 16,),
                Expanded(child: Operationbutton(props: actionProps, labelAction: "/")),
              ],
            ),

            const SizedBox(height: 26,),


            Center(child: Operationbutton(props: actionProps, labelAction: "CLEAR"),)
          ],
        ),
      ),
        
      ),
    );
  }
}