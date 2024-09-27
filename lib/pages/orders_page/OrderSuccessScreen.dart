
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_commerce/app_constants/constants.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';


class OrderSuccessScreen extends StatefulWidget {
  @override
  _OrderSuccessScreen createState() => _OrderSuccessScreen();
}

class _OrderSuccessScreen extends State<OrderSuccessScreen> {
  var utils = FontUtils();
  var appUtils=Utils();


  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      id: "0",
      builder: (theme) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                elevation: 0,
                backgroundColor: theme.backgroundColor,
              ),
            ),
            body: SafeArea(
              child: Container(
                width: Get.width,
                height: Get.height,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                color: theme.cardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.check_mark_circled_solid , color: theme.greenColor, size: 56,),
                    const SizedBox(height: 12,),
                    Text("Order placed successfully" , style: utils.boldLabel(theme.textColor),),
                    const SizedBox(height: 12,),
                    // utils.button(theme.primaryColor, "Go to Orders", theme.whiteColor,theme.whiteColor, 1.0, (){
                    //   Get.offAllNamed(homeCRoute , arguments: 1);
                    //   cartController.emptyCart();
                    // }),
                    const SizedBox(height: 12,),
                     appUtils.button(theme.primaryColor, "Go to Home",
                                theme.whiteColor, null, null, null, null, () {
                              //   if (nameCntr.text.isEmpty) {
                              //     Get.snackbar("Required", "Name is required",
                              //         backgroundColor: theme.redColor,
                              //         colorText: theme.whiteColor);

                              //     return;
                              //   }
                              //  else  if (phnCntr.text.isEmpty) {
                              //     Get.snackbar("Required", "Phone No is required",
                              //         backgroundColor: theme.redColor,
                              //         colorText: theme.whiteColor);

                              //     return;
                              //   }
                              //     else  if (addressCntr.text.isEmpty) {
                              //     Get.snackbar("Required", "Address is required",
                              //         backgroundColor: theme.redColor,
                              //         colorText: theme.whiteColor);

                              //     return;
                              //   }
                             Get.offAllNamed(homeRoute);
                            })
                    // utils.button(whiteColor, "Go to Home", checkAdminController.system.mainColor, checkAdminController.system.mainColor, 2.0, (){
                    //   Get.offAllNamed(homeCRoute);
                    //   cartController.emptyCart();
                    // })
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
