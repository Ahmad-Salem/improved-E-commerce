import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/core/view_model/profile_view_model.dart';
import 'package:salem/view/auth/login_view.dart';
import 'package:salem/view/widgets/custom_list_title.dart';
import 'package:salem/view/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: primaryColor,
                  color: primaryColor,
                ),
              )
            : Container(
                padding: const EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: (controller.userModel.pic !=
                                            'default')
                                        ? NetworkImage(controller.userModel.pic)
                                        : const AssetImage(
                                                'assets/images/Avatar.png')
                                            as ImageProvider,
                                  )),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: controller.userModel.name,
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                                CustomText(
                                  text: controller.userModel.email,
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomListTitle(
                        text: 'Edit Profile',
                        IconPath: 'assets/menu_icon/Icon_Edit_Profile.png',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomListTitle(
                        text: 'Shipping Address',
                        IconPath: 'assets/menu_icon/Icon_Location.png',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomListTitle(
                        text: 'Order History',
                        IconPath: 'assets/menu_icon/Icon_History.png',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomListTitle(
                        text: 'Cards',
                        IconPath: 'assets/menu_icon/Icon_Payment.png',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomListTitle(
                        text: 'Notifications',
                        IconPath: 'assets/menu_icon/Icon_Alert.png',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomListTitle(
                        text: 'Log Out',
                        IconPath: 'assets/menu_icon/Icon_Exit.png',
                        onPressed: (){
                          controller.signOut();
                          Get.offAll(LoginView());
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
