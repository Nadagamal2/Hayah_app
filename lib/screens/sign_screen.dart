import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/sign_in_screen.dart';
import 'package:hayat/screens/sign_up_screen.dart';
 import 'package:hayat/shared/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hayat/translations/locale_keys.g.dart';
class SignScreen extends StatelessWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: 415.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35.r),
                      bottomRight: Radius.circular(35.r)),
                  image: DecorationImage(
                      opacity: 80,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/doctor.jpg',
                      ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 170.h,
                    width: 150.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 5,
                            spreadRadius: .1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.white70,
                        image: DecorationImage(
                            opacity: 20,
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/logo.png',
                            ))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 20.h),
              child: SizedBox(
                width:double.infinity,
                height: 34.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(SignInScreen());
                  },
                  child: Text(
                    LocaleKeys.sign_in.tr(),
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
            ),
            // buildBottum(
            //   height: 48,
            //   width: 290,
            //   decoration: BoxDecoration(
            //     color: Styles.buttomColor,
            //     borderRadius: BorderRadius.circular(11),
            //   ),
            //   text:  Text(
            //     "sign in".tr(),
            //
            //     style: Styles.buttomStyle ,
            //     textAlign: TextAlign.center,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => SignInScreen(),
            //         ));
            //   },
            // ),
            SizedBox(
              height: 20.h,

            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 20.h),
              child: SizedBox(
                width:double.infinity,
                height: 34.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(SignUpScreen());
                  },
                  child: Text(
                    LocaleKeys.sign_Up.tr(),
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
            ),
            // buildBottum(
            //   height: 48,
            //   decoration: BoxDecoration(
            //     color: Styles.buttomColor,
            //     borderRadius: BorderRadius.circular(11),
            //   ),
            //
            //   width: 290,
            //   text:Text(
            //     "sign Up".tr(),
            //
            //     style: Styles.buttomStyle ,
            //     textAlign: TextAlign.center,
            //   ),
            //   onTap: () {
            //    Get.to(SignUpScreen());
            //   },
            // ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              "By counting ,You agree to Terms & Conditions".tr(),
              style: Styles.headLineGray1,
            ),
          ],
        ),
        Positioned(
          bottom: -113.h,
          height: 155.h,
          width: 220.h,
          right: -95.h,
          child: Container(
             decoration: BoxDecoration(
              color: Styles.buttomColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ));
  }
}
