 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:gap/gap.dart';
 import 'package:animate_do/animate_do.dart';

 import 'package:hayat/core/utils/app_style.dart';
import 'package:flutter/services.dart';
TextEditingController? CodeController;
Widget buildBottum({
  required double height,
  required double width,
  required Text text,
  required Function() onTap,
  EdgeInsetsGeometry? margin,
  required BoxDecoration? decoration,
}) =>
    Container(
      height: height,
      margin: margin,
      width: width,
      decoration: decoration,
      child: InkWell(
        child: Center(
          child: text,
        ),
        onTap: onTap,
      ),
    );
Widget defaultFieldForm({
  required TextInputType Type,
  required IconData prefix,
  required String lable,
  required String hint,
 required EdgeInsets?  padding,
   String? Function(String?)?  validator,
   String? Function(String?)?  onChanged,
    TextEditingController? controller,

}) =>
    TextFormField(
      validator: validator,
      onChanged: onChanged,
      cursorColor: Colors.grey.shade400,
      keyboardType: Type,
      controller: controller,
      cursorHeight: 25.h,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:padding,


        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: .5),
          borderRadius: BorderRadius.circular(6),
        ),
        border: OutlineInputBorder(),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: .5),
          borderRadius: BorderRadius.circular(6),
        ),
        prefixIcon: Icon(
          prefix,
          size: 20,
          color: Styles.IconColor,
        ),
        labelText: lable,
        hintText: hint,
        hintStyle: Styles.lable_Hint,
        labelStyle: Styles.lable_Hint,
      ),
    );
Widget defaultTextBottom({
  required Function() onPressed,
  required String text,
}) =>
    TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textButtom,
        ));
Widget verifyTextField(context,{

required  double width,

  List<TextInputFormatter>? inputList,
  void Function(String)? onChanged,
 }) => SizedBox(
      height: 45,
      width: width,
      child: TextFormField(
        controller: CodeController,
        cursorColor: Colors.grey.shade400,
        cursorHeight: 35,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Color(0xff898A8F),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Color(0xff898A8F)),
            borderRadius: BorderRadius.circular(6),
          ),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 3),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Color(0xff898A8F)),
            borderRadius: BorderRadius.circular(6),
          ),
          hintStyle: Styles.lable_Hint,
          labelStyle: Styles.lable_Hint,
        ),
        onChanged: onChanged,
        //     (value) {
        //   if (value.length == 1) {
        //     FocusScope.of(context).nextFocus();
        //   }
        // },
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        inputFormatters:  inputList
      ),
    );

Widget BuildAppParHomeScreen({
  Widget? widget,
  MainAxisAlignment? mainAxisAlignment,
  Widget? image,
}) =>
    Container(
      height: 95.h,
      width: double.infinity,
      color: Styles.buttomColor,
      child: Padding(
          padding:   EdgeInsets.only(top: 20.h, left: 17.h, right: 11.h),
          child: Column(
            children: [
              Gap(30.h),
              Row(
                mainAxisAlignment: mainAxisAlignment!,
                children: [
                  image!,
                  widget!,
                ],
              ),
            ],
          )),
    );

Widget BuildQuestionScreen({
  required String text1,
  required String text2,
}) =>
    FadeInRight(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/print-171042142.jpg',
                      )),
                  shape: BoxShape.circle,
                ),
              ),
              Gap(15),
              Container(

                width: 210.h,
                padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),
                decoration: BoxDecoration(
                  color: Color(0xff22D27F),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(23.r),
                      topLeft: Radius.circular(23.r),
                      bottomRight: Radius.circular(23.r)),
                ),
                child: Center(
                  child: Text(
                    text1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(

                width: 220.h,

                padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),

                decoration: BoxDecoration(
                  color: Color(0xff77b297),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(23.r),
                      topLeft: Radius.circular(23.r),
                      bottomLeft: Radius.circular(23.r)),
                ),
                child: Center(
                  child: Text(
                    text2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );

Widget BuildAccountScreen({
  required String text,
  required IconData icons,
  required BorderRadius borderRadius,
  Color color =Colors.black,


  required Function() onTap,

}) =>
    FadeInRight(
      duration: Duration(milliseconds: 900),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius:borderRadius,
            color: Colors.white,
          ),
          child: Column(
            children: [
              InkWell(
                onTap: onTap,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(

                        children: [
                          Icon(
                            icons,
                            size: 24.sp,
                            color: Styles.IconColor,
                          ),
                          Gap(8),
                          Text(text,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              )),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Styles.IconColor,
                            size: 14.sp,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        height: 10,
                        color: color,
                        thickness: .2,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
void navigateTo(context, Widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Widget,
  ),
);
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);
Widget buildCityDetail(
{  required String text,
   required BorderRadius borderRadius,
  required Function () ontap,
  Color color =Colors.black,}

    )=>InkWell(
  onTap: ontap,
      child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15),
  child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.white,
      ),
      child: Column(
        children: [

          InkWell(
            onTap: (){},
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_flags_rounded,color: Styles.IconColor,
                        size: 24,

                      ),
                      Gap(8),
                      Text(text,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),


                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    height: 10,
                    color: color,
                    thickness: .2,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
  ),
),
    );