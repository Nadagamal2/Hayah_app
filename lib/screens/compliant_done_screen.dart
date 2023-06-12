import 'dart:convert';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/bottom.dart';
import 'package:hayat/screens/home_screen.dart';
import 'package:hayat/shared/component/component.dart';
import 'package:hayat/translations/locale_keys.g.dart';
 class ComplaintsDoneScreen extends StatelessWidget {
  const ComplaintsDoneScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 65.h,
      //   elevation: 0,
      //   systemOverlayStyle: SystemUiOverlayStyle.light,
      //   backgroundColor: Styles.defualtColor,
      //
      //
      //   leading: InkWell(
      //       onTap: () {
      //         Navigator.pop(context);
      //       },
      //       child: Icon(
      //         Icons.arrow_back_ios_rounded,
      //         color: Colors.white,
      //         size: 30.sp,
      //       )),
      //   centerTitle: true,
      //   title: Text(
      //     ' ',
      //     style: TextStyle(
      //       fontSize: 18.sp,
      //     ),
      //   ),
      //
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(100.h),

              Padding(
                padding:   EdgeInsets.symmetric(horizontal: 33.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Image.asset(
                        'assets/done.png',
                        fit: BoxFit.cover,
                        height: 170.h,
                        width: 170.h,
                      ),
                      Gap(20.h),
                      Text(
                        "Done !".tr(),
                        style: Styles.headLine1,
                      ),


                      Gap(60.h),
                      SizedBox(
                        width:double.infinity,
                        height: 36.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAll(BottomNav());                          },
                          child: Text(
                            LocaleKeys.Go_To_Home.tr(),
                            style: TextStyle(
                              color: Styles.ScafoldColor,
                              fontFamily: 'Tajawal7',
                              fontSize: 15.sp,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.defualtColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
