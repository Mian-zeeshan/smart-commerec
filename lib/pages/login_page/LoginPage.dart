import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_commerce/app_configs/config.dart';
import 'package:smart_commerce/app_constants/constants.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/controllers/UserController.dart';
import 'package:smart_commerce/pages/regester_page/SignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  var data =Get.arguments;
  //** Controllers
  ThemeController theme = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserController userController =Get.find();



  //** Utils
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

  //** states
  var hidePassword = true;
  var emailError = false;
  var emailErrorMessage = "";
  var passwordError = false;
  var passwordMessage = "";

  var box = GetStorage();
  @override
  void initState() {

    if(data!=null){
    emailController.text=data['email'];
    passwordController.text=data['password'];
    }


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h,),
                SizedBox(
                  width: Get.width,
                  child: Center(
                    child: SizedBox(
                      width: Get.width * 0.6,
                      child: Image.asset("assets/images/logo/almumtaz-electronics.png", fit: BoxFit.cover,),
                    ),
                  ),
                ),
                Expanded(child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Stack(
                    children: [
                      // Container(
                      //     width: Get.width,
                      //     height: Get.height,
                      //     decoration: BoxDecoration(
                      //         color: theme.backgroundColor
                      //     ),
                      //     child: Image.asset("assets/illustrations/buildings.png", fit: BoxFit.cover,)
                      // ),
                      Container(
                        width: Get.width,
                        height: Get.height,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                            color: theme.backgroundColor.withOpacity(0.95)
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h,),
                              Text("Enter your email and password to get in 🎉🔑", style: fontUtils.description(theme.textColor),),
                              SizedBox(height: 60.h,),

                              utils.borderedInputField("Email", theme.grayColor.withOpacity(0.7), theme.buttonColor.withOpacity(0.7), TablerIcons.mail, theme.buttonColor.withOpacity(0.7), theme.textColor, null, null, null, false, true, emailController, (val) {

                              }, isError: emailError, errorMessage: emailErrorMessage, errorColor: theme.redColor),

                              SizedBox(height: 10.h,),

                              utils.borderedInputField("Password", theme.grayColor.withOpacity(0.7), theme.buttonColor.withOpacity(0.7), TablerIcons.lock, theme.buttonColor.withOpacity(0.7), theme.textColor, hidePassword ? TablerIcons.eye : TablerIcons.eye_off, theme.buttonColor,  () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              }, hidePassword, true, passwordController, (val) {

                              }, isError: passwordError, errorMessage: passwordMessage, errorColor: theme.redColor),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     TextButton(onPressed: (){
                              //       Get.toNamed(forgotPasswordRoute);
                              //     }, child: Text("Forgot Password?", style: fontUtils.underlineSmall(theme.buttonColor),))
                              //   ],
                              // ),

                              SizedBox(height: 20.h,),

                              utils.button(theme.primaryColor, "LOGIN", theme.whiteColor, TablerIcons.user, theme.whiteColor, null, null, () async {

                                     if(emailController.text.isEmpty) {
                              setState(() {
                                emailError = true;
                                emailErrorMessage = "* Email is required.";
                              });
                            }
                            else if(!(emailController.text.isEmail)) {
                              setState(() {
                                emailError = true;
                                emailErrorMessage = "* Please Enter a valid email.";
                              });
                            }
                            else if(passwordController.text.isEmpty) {
                              setState(() {
                                emailError = false;
                                passwordError = true;
                                passwordMessage = "* Password is required.";
                              });
                            }
                            else{

                                    setState(() {
                                    emailError = false;
                                    passwordError = false;
                                    emailErrorMessage = "";
                                    passwordMessage = "";
                                  });

                                  var data={
                                "username": emailController.text.trim(),
                                "password": passwordController.text,
                                // "deviceType": GetPlatform.isAndroid ? "Android" : "IOS"
                              };
                                  EasyLoading.show(status: "Logging In...");

                                await     userController.  login(data, theme) ;
                                
                                 

                            }



                              

                                // if(emailController.text.isEmpty) {
                                //   setState(() {
                                //     emailError = true;
                                //     emailErrorMessage = "* Email is required.";
                                //   });
                                // }
                                // else if(!(emailController.text.isEmail)) {
                                //   setState(() {
                                //     emailError = true;
                                //     emailErrorMessage = "* Please Enter a valid email.";
                                //   });
                                // }
                                // else if(passwordController.text.isEmpty) {
                                //   setState(() {
                                //     emailError = false;
                                //     passwordError = true;
                                //     passwordMessage = "* Password is required.";
                                //   });
                                // }
                                // else {
                            
                                // }
                              }),

                              SizedBox(height: 50.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      width: Get.width,
                                      margin: EdgeInsets.only(right: 6.w),
                                      color: theme.textColor,
                                    ),
                                  ),
                                  Text("Don't have an account? Sign up", style: fontUtils.small(theme.textColor),),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      margin: EdgeInsets.only(left: 6.w),
                                      width: Get.width,
                                      color: theme.textColor,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 12.h,),
                              utils.button(theme.buttonColor, "SIGN UP", theme.whiteColor, TablerIcons.user_plus, theme.whiteColor, null, null, (){
                               Get.toNamed(signUpRoute);
                               
                                // Get.to(() => WebviewPage(url: "https://smartbooks.finance/pricing/", title: appName.tr));
                              }),
                              SizedBox(height: 20.h,),
                            
                           
                              SizedBox(height: 20.h,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            )
        ),
      ),
    );
  }
}