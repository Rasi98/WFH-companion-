import 'package:flutter/material.dart';

class LargeCurveButton extends StatelessWidget {
  final String text;
  final color;
  final double height;
  final double width;
  final textcolor;
  final Function onClick;
  final double borderadius;

  LargeCurveButton(
      {this.text,
      this.color,
      this.height,
      this.width,
      this.textcolor,
      this.borderadius,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * height,
        width: MediaQuery.of(context).size.width * width,
        child: FlatButton(
          color: color,
          child: Text(
            text,
            style: textcolor,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderadius)),
          onPressed: onClick,
        ));
  }
}
