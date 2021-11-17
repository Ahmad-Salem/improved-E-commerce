import 'package:flutter/material.dart';
import 'package:salem/view/widgets/custom_text.dart';


class CustomListTitle extends StatelessWidget {
  final String text;
  final String IconPath;
  final dynamic onPressed;
  const CustomListTitle({Key? key, this.text = '', this.onPressed,this.IconPath=''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RawMaterialButton(
          onPressed: () {},
          child: ListTile(
            title: CustomText(
              text: text,
            ),
            leading: Image.asset(
                IconPath),
            trailing:
            Icon(Icons.navigate_next, color: Colors.black),
          ),
        ));
  }
}