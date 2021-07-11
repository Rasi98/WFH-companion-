import 'package:flutter/material.dart';

class TextFieldV1 extends StatelessWidget {
  final fieldcolor;
  final bordercolor;
  final double borderwidth;
  final double borderradius;
  final double height;
  final double width;
  final textcolor;
  final obsecure;
  final controler;
  final keyboardtype;
  final String hint;
  final hintcolor;
  final double padding;
  final Function onchange;

  TextFieldV1(
      {this.fieldcolor,
      this.bordercolor,
      this.borderwidth,
      this.borderradius,
      this.padding,
      this.obsecure,
      this.controler,
      this.keyboardtype,
      this.height,
      this.width,
      this.hint,
      this.hintcolor,
      this.onchange,
      this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: fieldcolor,
          border: Border.all(color: bordercolor, width: borderwidth),
          borderRadius: BorderRadius.circular(borderradius)),
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: TextField(
        obscureText: obsecure,
        controller: controler,
        keyboardType: keyboardtype,
        style: TextStyle(color: textcolor),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: hintcolor),
            border: InputBorder.none),
        onChanged: onchange,
      ),
    );
  }
}
