import 'dart:convert';

import 'package:get/get.dart';
import 'package:salem/constants.dart';
import 'package:salem/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{

  Future<UserModel?> get getUser async{
    try{
      UserModel userModel=await _getUserData();
      if(userModel==null)
        {
          return null;
        }else{
        return userModel;
      }
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }
  _getUserData()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var value=preferences.getString(CACHED_USER_DATA);
    return UserModel.fromjson(json.decode(value!));
  }

  setUser(UserModel userModel)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    await preferences.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  void deleteUser() async
  {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    await preferences.clear();
  }
}