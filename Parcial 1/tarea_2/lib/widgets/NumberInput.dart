import 'package:flutter/material.dart';
import 'package:tarea_2/Props/NumInpProps.dart';

class Numberinput extends StatefulWidget{

  final Numinpprops props;
  final String labelNumber;

  const Numberinput({super.key, required this.props , required this.labelNumber});

  @override
  State<Numberinput> createState() => _Numberinput();
}

class _Numberinput extends State<Numberinput>{

  void setNumber(){
    if (widget.props.focusIzq.hasFocus){
      widget.props.inputIzq.text += widget.labelNumber;

    } else if(widget.props.focusDer.hasFocus){
      widget.props.inputDer.text += widget.labelNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: setNumber, 
      child: Text(
        widget.labelNumber
      )
    );
  }
}