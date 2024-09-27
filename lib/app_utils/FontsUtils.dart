import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_commerce/app_configs/config.dart';
import 'package:smart_commerce/app_constants/constants.dart';

class FontUtils {

  h1(color){
    return TextStyle(
        color: color,
        fontSize: fsHeading1.sp,
        fontWeight: fwHeading1,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  h2(color){
    return TextStyle(
        color: color,
        fontSize: fsHeading2.sp,
        fontWeight: fwHeading2,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  h3(color){
    return TextStyle(
        color: color,
        fontSize: fsHeading3.sp,
        fontWeight: fwHeading3,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  h4(color){
    return TextStyle(
        color: color,
        fontSize: fsHeading4.sp,
        fontWeight: fwHeading4,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  h5(color, {underline = false}){
    return TextStyle(
        color: color,
        fontSize: fsHeading5.sp,
        fontWeight: fwHeading5,
        decoration: underline ? TextDecoration.underline :TextDecoration.none,
        decorationColor: color,
        fontFamily: appFontFamily
    );
  }

  h6(color){
    return TextStyle(
        color: color,
        fontSize: fsHeading6.sp,
        fontWeight: fwHeading6,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  h6Bold(color, {underline = false}){
    return TextStyle(
        color: color,
        fontSize: fsHeading6.sp,
        fontWeight: FontWeight.w600,
        decoration: underline ? TextDecoration.underline :TextDecoration.none,
        decorationColor: color,
        fontFamily: appFontFamily
    );
  }

  h6BoldItalic(color){
    return TextStyle(
        color: color,
        fontSize: fsHeading6.sp,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  description(color, {underline = false}){
    return TextStyle(
        color: color,
        fontSize: fsDesc.sp,
        fontWeight: FontWeight.normal,
        decoration: underline ? TextDecoration.underline :TextDecoration.none,
        decorationColor: color,
        fontFamily: appFontFamily
    );
  }

  label(color, {underline = false, lineThrough = false}){
    return TextStyle(
        color: color,
        fontSize: fsLabel.sp,
        fontWeight: FontWeight.normal,
        decoration: underline ? TextDecoration.underline :  lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  boldLabel(color, {underline = false}){
    return TextStyle(
        color: color,
        fontSize: fsLabel.sp,
        fontWeight: FontWeight.bold,
        decoration: underline ? TextDecoration.underline :TextDecoration.none,
        decorationColor: color,
        fontFamily: appFontFamily
    );
  }

  boldDescription(color){
    return TextStyle(
        color: color,
        fontSize: fsDesc.sp,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  boldItalicDescription(color){
    return TextStyle(
        color: color,
        fontSize: fsDesc.sp,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  boldSmall(color){
    return TextStyle(
        color: color,
        fontSize: fsSmall.sp,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  small(color){
    return TextStyle(
        color: color,
        fontSize: fsSmall.sp,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  linkStyle(color){
    return TextStyle(
        color: color,
        fontSize: fsSmall.sp,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        fontFamily: appFontFamily
    );
  }

  xSmall(color){
    return TextStyle(
        color: color,
        fontSize: fsxSmall.sp,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

  underlineSmall(color){
    return TextStyle(
        color: color,
        fontSize: fsSmall.sp,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        decorationColor: color,
        fontFamily: appFontFamily
    );
  }

  buttonStyle(color){
    return TextStyle(
        color: color,
        fontSize: fsButton.sp,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
        fontFamily: appFontFamily
    );
  }

}