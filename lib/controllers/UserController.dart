
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_commerce/app_constants/constants.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/models/UserModel.dart';
import 'package:smart_commerce/services/AuthApis.dart';

class UserController extends GetxController {
  UserModel userModel = UserModel();
  AuthApis authApis = AuthApis();
  Utils utils = Utils();
  var box = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getUser() async {
    var val = await box.read(currentUser);

    if (val != null) {
      userModel = UserModel.fromJson(jsonDecode(jsonEncode(val)));
    } else {
      Get.offAllNamed(loginRoute);
    }

    update(['0']);
    notifyChildrens();
  }

  login(data, theme) async {
    try {
      var res = await authApis.loginApi(data);

      if (res.statusCode == 200) {
        userModel = UserModel.fromJson(jsonDecode(jsonEncode(res.body)));
        await box.write(currentUser, userModel.toJson());
        getUser();
          Get.offAllNamed(homeRoute);
      } else {
        var title = "Network Error";
        var message = "Please check your internet connection.";

        if (res.body != null) {
          message = jsonDecode(jsonEncode(res.body))['message'];
          utils.alert(
              title: title, message: message, theme: theme, type: 'error');
        } else {
          utils.alert(
              title: title, message: message, theme: theme, type: 'error');
        }
      }
    } catch (e) {
    } finally {
      EasyLoading.dismiss();
    }
    
  }


  signUp(data, theme) async {
    try {
      var res = await authApis.signUPApi(data);

    log("sign up response here :::::::::: ${res.body}");

      if (res.statusCode == 201) {

       Get.snackbar("Success", "Successfully regestered user!");
      Get.toNamed(loginRoute,arguments: data);
        // userModel = UserModel.fromJson(jsonDecode(jsonEncode(res.body)));
        // await box.write(currentUser, userModel.toJson());
        // getUser();
        //   Get.offAllNamed(homeRoute);
      } else {
        var title = "Network Error";
        var message = "Please check your internet connection.";

        if (res.body != null) {
          message = jsonDecode(jsonEncode(res.body))['message'];
          utils.alert(
              title: "Failed!", message: message, theme: theme, type: 'error');
        } else {
          utils.alert(
              title: title, message: message, theme: theme, type: 'error');
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
    
  }

deleteAccount({required String email,required ThemeController theme})async{
  try{
var response=await authApis.getUserIdApi(email);
log("user get id response here  ::::::${response.body}");
 if (response.statusCode == 200) {
    // Parse the JSON response
    final List<dynamic> jsonResponse = jsonDecode(jsonEncode( response.body));
    
    // Check if response contains any user data
    if (jsonResponse.isNotEmpty) {
      // Extract the 'id' of the first user in the list
       var userId = jsonResponse[0]['id'];
var res=await authApis.deleteUserAccountApi(userId);


log("delete user api response here  ::::::${res.body}");

if(res.statusCode==200){
 await  box.erase();
  Get.snackbar("Success", "Delete Account successfully");

  

  Get.offAllNamed(loginRoute);


}
else{
   utils.alert(theme: theme,title: "Failed!",message: "Failed to delete account",type: "error");

}

      print('User ID: $userId');
    } else {
      print('No user found');
    }
  } else {
    utils.alert(theme: theme,title: "Failed!",message: "Failed to delete account",type: "error");
    print('Failed to load data');
  }
  }
  catch(e){

  }
  finally{

    EasyLoading.dismiss();
  }
}

}
