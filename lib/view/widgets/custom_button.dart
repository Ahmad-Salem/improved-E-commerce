import 'package:flutter/material.dart';
import 'package:salem/constants.dart';
import 'package:salem/view/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  const CustomButton({Key? key, this.text = '', this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(18),
      fillColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        alignment: Alignment.center,
        color: Colors.white,
      ),
    );
  }
}
