import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salem/helper/local_storage_data.dart';
import 'package:salem/model/user_model.dart';

class ProfileViewModel extends GetxController{
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  final LocalStorageData localStorageData=Get.find<LocalStorageData>();
  UserModel _userModel=UserModel(email: '',name: '',pic: '',userId: '');
  UserModel get userModel=> _userModel;
  @override
  void onInit()
  {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async{
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel=value!;
    });
    _loading.value = false;
    update();
  }
  Future<void> signOut()async
  {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

}