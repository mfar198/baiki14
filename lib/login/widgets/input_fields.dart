// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  InputTextFieldWidget(this.textEditingController, this.hintText);
  @override
  Widget build(BuildContext context) {
    //return Container(
      //height: 46,
      //child:
      return TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            contentPadding: EdgeInsets.only(
              top: 0,
              right: 16,
              bottom: 0,
              left: 16,
            ),
            filled: true,
            alignLabelWithHint: true,
            //focusedBorder: UnderlineInputBorder(
                //borderSide: BorderSide(color: Colors.black)),
            //fillColor: Colors.white54,
            hintText: hintText,
            focusColor: Colors.white60),
      );
    //);
  }
}