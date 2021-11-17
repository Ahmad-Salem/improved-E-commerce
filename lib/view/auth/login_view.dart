import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/core/view_model/auth_view_model.dart';
import 'package:salem/view/auth/register_view.dart';
import 'package:salem/view/auth/second_screen.dart';
import 'package:salem/view/widgets/custom_button.dart';
import 'package:salem/view/widgets/custom_button_social.dart';
import 'package:salem/view/widgets/custom_text.dart';
import 'package:salem/view/widgets/custom_text_form_field.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: "Sign Up",
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
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
                CustomText(
                  text: 'Forgot Password',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Sign In',
                  onPressed: () {
                    _globalKey.currentState?.save();
                    if (_globalKey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }

                    // Get.to(const SecondScreen());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  text: 'Sign In with Facebook',
                  imageAssetName: 'assets/images/facebook.png',
                  onPressed: () {
                    controller.FBSignIn();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  text: 'Sign In with Google',
                  imageAssetName: 'assets/images/google.png',
                  onPressed: () {
                    controller.googleSignInMethod();
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
