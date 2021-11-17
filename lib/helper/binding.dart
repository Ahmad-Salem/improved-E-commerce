import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/core/view_model/card_view_model.dart';
import 'package:salem/core/view_model/checkout_view_model.dart';
import 'package:salem/core/view_model/control_view_model.dart';
import 'package:salem/core/view_model/home_view_model.dart';
import 'package:salem/core/view_model/profile_view_model.dart';
import 'package:salem/helper/local_storage_data.dart';
import '../core/view_model/auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CardViewModel());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutViewModel());
  }
}
