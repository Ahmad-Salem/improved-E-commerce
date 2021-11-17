import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/core/view_model/card_view_model.dart';
import 'package:salem/core/view_model/checkout_view_model.dart';
import 'package:salem/core/view_model/control_view_model.dart';
import 'package:salem/core/view_model/profile_view_model.dart';
import 'package:salem/view/control_view.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(CardViewModel(),tag: "CardViewModel");
  Get.putAsync<CardViewModel>(()async => await CardViewModel());
  Get.putAsync<ControlViewModel>(()async => await ControlViewModel());
  Get.putAsync<CheckOutViewModel>(()async => await CheckOutViewModel());
  // Get.putAsync<ProfileViewModel>(()async => await ProfileViewModel());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),
      ),
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        primaryColor: primaryColor,
      ),
    );
  }
}
