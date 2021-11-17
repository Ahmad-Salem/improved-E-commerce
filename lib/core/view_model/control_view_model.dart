import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:salem/view/card_view.dart';
import 'package:salem/view/home_view.dart';
import 'package:salem/view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigateValue = 0;
  Widget _currentScreen = HomeView();

  get navigateValue => _navigateValue;
  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectedValue) {
    _navigateValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }

      case 1:
        {
          _currentScreen = CardView();
          break;
        }

      case 2:
        {
          _currentScreen =  ProfileView();
          break;
        }
    }
    update();
  }
}
