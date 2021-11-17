import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;
  final FontWeight fontWeight;
  CustomText(
      {Key? key,
      this.text = '',
      this.fontSize = 16,
      this.alignment = Alignment.topLeft,
      this.color = Colors.black,
      this.height = 1,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            height: height,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight),
      ),
    );
  }
}
