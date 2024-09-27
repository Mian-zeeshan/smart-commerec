import 'dart:io';
import 'dart:typed_data';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/models/GetProductsModel.dart';
import 'package:smart_commerce/pages/product_detail/ProductDetails.dart';

class Utils {
  FontUtils fontUtils = FontUtils();

  button(Color backgroundColor, text, textColor, startIcon, startIconColor, endIcon, endIconColor, onPress, {disabled = false, paddingH, paddingV}) {
    return InkWell(
      onTap: disabled ? (){} : onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.w),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: disabled ? [backgroundColor, backgroundColor.withOpacity(0.4), backgroundColor.withOpacity(0.3), backgroundColor.withOpacity(0.2)] :[backgroundColor, backgroundColor.withOpacity(0.9), backgroundColor.withOpacity(0.8), backgroundColor.withOpacity(0.7)]
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: paddingH??8.w, vertical: paddingV??8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(startIcon != null) Icon(startIcon, size: 18.w, color: startIconColor,),
            SizedBox(width: 2.w,),
            Expanded(child: Center(child: Text(text, style: fontUtils.buttonStyle(textColor),),)),
            SizedBox(width: 2.w,),
            if(endIcon != null) Icon(endIcon, size: 18.w, color: endIconColor,)
          ]
        ),
      ),
    );
  }

  nonBorderedInputField(hint, hintColor, borderColor, startIcon, startIconColor, textColor, endIcon, endIconColor, onClickEndIcon, isPassword, enabled, controller, onChange, {isError = false, errorMessage = "Invalid Value!", errorColor = Colors.red, onClick, numericKeyboard = false}) {
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        width: Get.width,
        child: TextFormField(
          enabled: enabled,
          onChanged: onChange,
          keyboardType: numericKeyboard ? TextInputType.number : TextInputType.text,
          controller: controller,
          obscureText: isPassword,
          style: fontUtils.label(textColor),
          decoration: InputDecoration(
            labelStyle: fontUtils.description(hintColor),
            floatingLabelStyle: fontUtils.description(textColor),
            focusColor: borderColor,
            labelText: hint,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
            hintFadeDuration: const Duration(seconds: 1),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            prefixIcon: startIcon != null ? Icon(startIcon, color: startIconColor, size: 20.w,) : null,
            prefixIconColor: startIconColor,
            suffixIcon:  endIcon != null ? IconButton(onPressed: onClickEndIcon, icon: Icon(endIcon, color: endIconColor, size: 20.w,)) : null,
            suffixIconColor: endIconColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide(
                color: borderColor,
                width: 1.5
              )
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(
                color: textColor.withOpacity(0.5),
                width: 1.5
              )
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(
                    color: hintColor,
                    width: 1.5
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(
                    color: textColor.withOpacity(0.5),
                    width: 1.5
                )
            ),
            error: isError ? Text("${errorMessage??"Invalid Value!"}".tr, style: fontUtils.small(errorColor),) : null
          ),
        ),
      ),
    );
  }

  borderedInputField(hint, hintColor, borderColor, startIcon, startIconColor, textColor, endIcon, endIconColor, onClickEndIcon, isPassword, enabled, controller, onChange, {isError = false, errorMessage = "Invalid Value!", errorColor = Colors.red, onClick, numericKeyboard = false}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: TextFormField(
          enabled: enabled,
          onChanged: onChange,
          keyboardType: numericKeyboard ? TextInputType.number : TextInputType.text,
          controller: controller,
          obscureText: isPassword,
          style: fontUtils.label(textColor),
          decoration: InputDecoration(
            labelStyle: fontUtils.description(borderColor),
            floatingLabelStyle: fontUtils.description(borderColor),
            focusColor: borderColor,
            // labelText: hint,
            label: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: (hint??"").replaceAll("*", ""),
                    style: fontUtils.description(borderColor)
                  ),
                  if((hint??"").contains("*")) TextSpan(
                    text: "*",
                    style: fontUtils.description(Colors.red)
                  ),
                ]
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
            hintFadeDuration: const Duration(seconds: 1),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: startIcon != null ? Icon(startIcon, color: startIconColor, size: 20.w,) : null,
            prefixIconColor: startIconColor,
            suffixIcon:  endIcon != null ? IconButton(onPressed: onClickEndIcon, icon: Icon(endIcon, color: endIconColor, size: 20.w,)) : null,
            suffixIconColor: endIconColor,
            // border: InputBorder.none,
            error: isError ? Text("${errorMessage??"Invalid Value!"}".tr, style: fontUtils.small(errorColor),) : null
          ),
        ),
      ),
    );
  }

  borderedInputArea(hint, hintColor, borderColor, startIcon, startIconColor, textColor, endIcon, endIconColor, onClickEndIcon, isPassword, enabled, controller, onChange) {
    return SizedBox(
      width: Get.width,
      child: TextFormField(
        enabled: enabled,
        onChanged: onChange,
        controller: controller,
        obscureText: isPassword,
        maxLines: 8,
        minLines: 3,
        maxLength: 4045,
        decoration: InputDecoration(
          labelStyle: fontUtils.description(hintColor),
          floatingLabelStyle: fontUtils.description(textColor),
          focusColor: borderColor,
          labelText: hint,
          counterText: "",
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          hintFadeDuration: const Duration(seconds: 1),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: startIcon != null ? Icon(startIcon, color: startIconColor, size: 20.w,) : null,
          prefixIconColor: startIconColor,
          suffixIcon:  endIcon != null ? IconButton(onPressed: onClickEndIcon, icon: Icon(endIcon, color: endIconColor, size: 20.w,)) : null,
          suffixIconColor: endIconColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.w),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.5
            )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide(
              color: textColor.withOpacity(0.5),
              width: 1.5
            )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide(
                  color: hintColor,
                  width: 1.5
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: BorderSide(
                  color: textColor.withOpacity(0.5),
                  width: 1.5
              )
          )
        ),
      ),
    );
  }


  horizontalLine(ThemeController theme) {
    return Container(
      width: Get.width,
      height: 1,
      color: theme.textColor.withOpacity(0.2),
      margin: EdgeInsets.symmetric(vertical: 2.h),
    );
  }

  alert({String title = "Error Occurred", String message = "An unknown error occurred. we are on it.", required ThemeController theme, String type = "error", onPositivePress, onNegativePress, positiveText, negativeText = "Close"}) {
    Get.dialog(
      Container(
        width: Get.width,
        height: Get.height,
        margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                boxShadow: [
                  BoxShadow(
                    color: theme.textColor.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3,
                  )
                ],
                color: theme.cardColor
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(type == 'success' ? TablerIcons.circle_check_filled : type == 'warning' ? TablerIcons.info_circle : TablerIcons.circle_x_filled, color: type == 'success' ? theme.greenColor : type == 'warning' ? theme.yellowColor : theme.redColor,),
                        SizedBox(width: 6.w,),
                        Expanded(child: Text(title, style: fontUtils.boldLabel(type == 'success' ? theme.greenColor : type == 'warning' ? theme.yellowColor : theme.redColor),))
                      ],
                    ),
                  ),
                  horizontalLine(theme),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Text("${type == "error" ? "You got an error.".tr : ""} \"${message.tr}\"", style: fontUtils.label(theme.grayColor),),)
                          ],
                        )
                      ],
                    ),
                  ),
                  horizontalLine(theme),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if(onPositivePress != null) Expanded(child: Center(
                            child: TextButton(
                              onPressed: onPositivePress,
                              child: Text("$positiveText".tr, style: fontUtils.boldLabel(theme.greenColor),),
                            ),
                          )),
                          if(onPositivePress != null) Container(
                            width: 1,
                            color: theme.textColor.withOpacity(0.2),
                          ),
                            Expanded(child: TextButton(
                            onPressed: onNegativePress ?? () {
                              Get.back();
                            },
                            child: SizedBox(
                              width: Get.width,
                              child: Center(child: Text("$negativeText".tr, style: fontUtils.boldLabel(theme.redColor),)),
                            ),
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      barrierDismissible: false
    );
  }
  Column noDataAvailableWidget(theme, {bool showLottile = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showLottile)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('Assets/lottie/no-found.json',
                  width: Get.width * 0.6),
              Text(
                "No data available",
                style: fontUtils.small(theme.textColor.withOpacity(0.3)),
              )
            ],
          ),
        if (!showLottile)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.info, color: theme.redColor, size: 32),
              const SizedBox(
                height: 8,
              ),
              Text(
                "No Data available!",
                style: fontUtils.boldSmall(theme.textColor),
              ),
            ],
          )
      ],
    );
  }
  productAlert({onPressAddToCard, onPressBuyNow, required ThemeController theme,required GetProductsModel item}) {
    return Get.dialog(SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: theme.cardColor
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    constraints: BoxConstraints(
                      minHeight: 120.h,
                    ),
                    child: Image.asset("assets/images/products/product_3.jpg", fit: BoxFit.cover,),
                  )),
                  Expanded(child: Container(
                    width: Get.width,
                    padding: EdgeInsets.all(8.w),
                    constraints: BoxConstraints(
                      minHeight: 120.h
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Audionic Headset U8900 (Wireless + Chargeable)".tr, style: fontUtils.boldLabel(theme.textColor),),
                        Text("Color: Black | Brand: Audionic".tr, style: fontUtils.small(theme.textColor.withOpacity(0.8)),),
                        SizedBox(height: 6.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(TablerIcons.star_filled, color: theme.yellowColor, size: 10.w,),
                            SizedBox(width: 2.w,),
                            Expanded(child: Text("4.5 (550)".tr, style: fontUtils.xSmall(theme.textColor),)),
                            Text("(110 Sold)".tr, style: fontUtils.xSmall(theme.redColor),)
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Text("Colors:".tr, style: fontUtils.boldLabel(theme.textColor),),
                        Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            for(var i = 0; i < 4; i++)
                              Container(
                                width: 30.w,
                                height: 30.w,
                                padding: EdgeInsets.all(1.w),
                                margin: EdgeInsets.only(right: 4.w, bottom: 6.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.w),
                                    border: Border.all(color: i == 0 ? theme.primaryColor : theme.transparentColor)
                                ),
                                child: Container(
                                  width: 30.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                      color: i == 0 ? theme.redColor : i == 1 ? theme.brownColor : i == 2 ? theme.blueColor : theme.yellowColor,
                                      borderRadius: BorderRadius.circular(6.w)
                                  ),
                                ),
                              )
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        button(theme.redColor, "Add To Cart", theme.whiteColor, null, null, null, null, (){}, paddingH: 12.w, paddingV: 4.h),
                        SizedBox(height: 6.h,),
                        button(theme.primaryColor, "Buy Now", theme.whiteColor, null, null, null, null, (){}, paddingH: 12.w, paddingV: 4.h),
                        SizedBox(height: 6.h,),
                        InkWell(
                          onTap: (){
                            Get.back();
                            // Get.to(() => const ProductDetails());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Go to Details >>".tr, style: fontUtils.label(theme.blueColor, underline: true),)
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    ));
}

  String kFormatter(double value) {
    if (value >= 1000000000) {
      // Convert to billions (B)
      return '${(value / 1000000000).toStringAsFixed(1)}B';
    } else if (value >= 1000000) {
      // Convert to millions (M)
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      // Convert to thousands (K)
      return '${(value / 1000).toStringAsFixed(1)}k';
    }else if (value <= -1000000000) {
      // Convert to billions (B)
      return '${(value / 1000000000).toStringAsFixed(1)}B';
    } else if (value <= -1000000) {
      // Convert to millions (M)
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value <= -1000) {
      // Convert to thousands (K)
      return '${(value / 1000).toStringAsFixed(1)}k';
    } else {
      // Keep the original value
      if(value.toStringAsFixed(1).substring(value.toStringAsFixed(1).length-2, value.toStringAsFixed(1).length) == ".0") {
        return value.toStringAsFixed(1).replaceAll(".0", "");
      } else {
        return value.toStringAsFixed(1);
      }
    }
  }

  formatAmount(double allAmount, {withoutRounding = false}) {

    if(withoutRounding) {
      final oCcy = NumberFormat("#,##0", "en_US");

      return oCcy.format(allAmount);
    } else {
      final oCcy = NumberFormat("#,##0.00", "en_US");

      return oCcy.format(allAmount);
    }
  }

  convertWholeNumber(double wholeNumber) {

    return wholeNumber % 1 == 0 ? wholeNumber.toInt() : wholeNumber;

  }

  Future<Uint8List> fileToUnit8List(File file) async {
    List<int> bytes = await file.readAsBytes();
    Uint8List uint8List = Uint8List.fromList(bytes);

    return uint8List;
  }

}