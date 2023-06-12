import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color primary = const Color(0xffffffff);

class Styles {
  static Color defualtColor=Color(0xff22D27F);
  static Color defualtColor2=Color(0xffBCBCBB);
  static Color defualtColor3=  Color(0xff77b297);
  static Color ScafoldColor = primary;
  static Color ScafoldColor2 =  Color(0xffF5F5F5);
  static Color buttomColor = const Color(0xff22D27F);
  static Color IconColor = const Color(0xff22D27F);
  static Color borderColor = const Color(0xff52a1ce);

  static TextStyle buttomStyle = TextStyle(
    color: Styles.ScafoldColor,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
  static TextStyle headLineGray1 = TextStyle(
    color: Colors.grey.shade500,
    fontSize: 12.sp,
  );
  static TextStyle headLine1 = TextStyle(
    color: Color(0xff22D27F),
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headLine2 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headLine3 = TextStyle(
    fontSize: 14.sp,
    color: Colors.black54,
  );
  static TextStyle textButtom = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    decoration: TextDecoration.underline,
  );


  static TextStyle headLineGray2 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: Colors.grey.shade600,
  );
  static TextStyle lable_Hint =  TextStyle(color: Color(0xffB6B6B6), fontWeight: FontWeight.w600,fontSize: 14.sp,);
}
