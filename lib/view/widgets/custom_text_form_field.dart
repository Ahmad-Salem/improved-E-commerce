import 'package:flutter/material.dart';
import 'package:salem/view/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hinttext;
  final dynamic? onSave;
  final dynamic? validator;

  const CustomTextFormField(
      {Key? key,
      this.text = '',
      this.hinttext = '', this.onSave, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              fillColor: Colors.white),
        )
      ],
    );
  }
}
