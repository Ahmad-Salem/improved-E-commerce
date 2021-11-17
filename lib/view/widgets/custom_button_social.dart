import 'package:flutter/material.dart';
import 'package:salem/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageAssetName;
  final dynamic onPressed;
  const CustomButtonSocial(
      {Key? key, this.text = '', this.imageAssetName = '', this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100),
      child: RawMaterialButton(
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(imageAssetName),
            const SizedBox(
              width: 60,
            ),
            CustomText(text: text)
          ],
        ),
      ),
    );
  }
}
