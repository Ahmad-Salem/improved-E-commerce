import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salem/core/services/fire_store_user.dart';
import 'package:salem/helper/local_storage_data.dart';
import 'package:salem/model/user_model.dart';
import 'package:salem/view/control_view.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, name;
  final LocalStorageData localStorageData=Get.find<LocalStorageData>();
  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser!=null)
      {
        getCurrentUserData(_auth.currentUser!.uid);
      }

  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) async {
      saveUserSocial(user, user.user!.displayName.toString());
      Get.offAll(ControlView());
    });
    // print(userCredential.user);
  }

  void FBSignIn() async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
    // or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      // print(accessToken);
      final faceCredential = FacebookAuthProvider.credential(accessToken.token);
      await _auth.signInWithCredential(faceCredential).then((user) async {
        saveUserSocial(user, user.user!.displayName.toString());
        Get.offAll(ControlView());
      });
    } else {
      // print(result.status);
      // print(result.message);
    }
  }

  void facebookSignInMethod() async {
    final AccessToken? accessToken = await FacebookAuth.instance.accessToken;

    if (accessToken != null) {
      // final userData = await FacebookAuth.instance.getUserData();
      final faceCredential = FacebookAuthProvider.credential(accessToken.token);
      await _auth.signInWithCredential(faceCredential).then((user) async {
        saveUserSocial(user, user.user!.displayName.toString());
        Get.offAll(ControlView());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
        getCurrentUserData(value.user!.uid);
        });
      Get.offAll(ControlView());
    } catch (e) {
      // print(e);
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(ControlView());
    } catch (e) {
      // print(e);
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user!.uid,
        name: name,
        email: user.user!.email.toString(),
        pic: ''));
  }

  void saveUserSocial(UserCredential user, String name) async {
    UserModel userModel =UserModel(
        userId: user.user!.uid,
        name: name,
        email: user.user!.email.toString(),
        pic: '');
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String uid)async
  {
    await FireStoreUser().getCurrentUser(uid).then((value){
      setUser(UserModel.fromjson(value.data() as Map<String, dynamic>));
    });
  }
  void  setUser(UserModel userModel)async
  {
    await localStorageData.setUser(userModel);
  }
}
