
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {

  final String label;
  final TextEditingController controller;
  final Function(String) buscar_producto;
  const TextFieldCustom(this.buscar_producto,this.label, this.controller, {Key? key})
      : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: TextField(

          maxLines: 1,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          controller: widget.controller,
          onSubmitted: (value) => widget.buscar_producto(value),
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffFEF2F4),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(30)
              ),

              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(30),
              ),
              label: Text(widget.label),
              floatingLabelStyle: Theme.of(context).textTheme.bodyText1)
      ),
    );
  }
}