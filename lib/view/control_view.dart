import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/core/view_model/auth_view_model.dart';
import 'package:salem/core/view_model/control_view_model.dart';
import 'package:salem/view/auth/login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: Get.find<ControlViewModel>(),
              builder: (controller) {
                return Scaffold(
                  body: controller.currentScreen,
                  bottomNavigationBar: bottomNavigationBar(),
                );
              },
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text('Explore'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text('Card'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/images/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text('Account'),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/images/Path 5.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ))
        ],
        currentIndex: controller.navigateValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
