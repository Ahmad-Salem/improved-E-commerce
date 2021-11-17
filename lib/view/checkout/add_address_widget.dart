import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/view/widgets/custom_text.dart';
import 'package:salem/view/widgets/custom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.68,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            CustomText(text: 'Billing address is the same as delivery address'),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(
                text: 'Street 1', hinttext: '21, Alex Davidson Avenue'),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(
                text: 'Street 2',
                hinttext: 'Opposite Omegatron, Vicent Quarters'),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(text: 'City', hinttext: 'Victoria Island'),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                            text: 'State', hinttext: 'Lagos State'),
                      )),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                            text: 'Country', hinttext: 'Nigeria'),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
