import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/core/view_model/auth_view_model.dart';
import 'package:salem/view/auth/login_view.dart';
import 'package:salem/view/widgets/custom_button.dart';
import 'package:salem/view/widgets/custom_text.dart';
import 'package:salem/view/widgets/custom_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Welcome",
                      fontSize: 30,
                    ),
                    CustomText(
                      text: "Sign Up",
                      fontSize: 18,
                      color: primaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    text: 'Name',
                    hinttext: 'Ahmed',
                    onSave: (value) {
                      controller.name = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print('Error');
                      }
                    }),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                    text: 'Email',
                    hinttext: 'Example@gmail.com',
                    onSave: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print('Error');
                      }
                    }),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                    text: 'Password',
                    hinttext: '***********',
                    onSave: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print('Error');
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    _globalKey.currentState?.save();
                    if (_globalKey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }

                    // Get.to(const SecondScreen());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
