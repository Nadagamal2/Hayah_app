import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:gap/gap.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/change%20password.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  bool isCurrent = true;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.h,
        elevation: 0,
        backgroundColor: Styles.defualtColor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 25.sp,
            )),
        centerTitle: true,
        title: Text(
          "Settings".tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(80.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    height: 190.h,
                    width: 190.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Change Password".tr(),
                        style: Styles.headLineGray2.copyWith(fontSize: 16.sp),
                      )
                    ],
                  ),
                  Gap(11.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          height: 44.h,
                          //  margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 20.h),

                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black54, width: .8),
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FluentSystemIcons.ic_fluent_lock_regular,
                                color: Styles.IconColor,
                              ),
                              Gap(10.h),
                              Container(
                                height: 9.h,
                                width: 9.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff898A8F),
                                ),
                              ),
                              Gap(5.h),
                              Container(
                                height: 9.h,
                                width: 9.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff898A8F),
                                ),
                              ),
                              Gap(5.h),
                              Container(
                                height: 9.h,
                                width: 9.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff898A8F),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          height: 44.h,
                          width: 65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: Styles.buttomColor,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            changePasswordScreen()));
                              },
                              child: Text(
                                "Change".tr(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.h,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Gap(25.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Text('Change Password',
                  //         style: TextStyle(
                  //           color: Styles.defualtColor,
                  //           fontSize: 16.sp,
                  //           fontWeight: FontWeight.w600,
                  //         ))
                  //   ],
                  // ),
                  // Gap(15.h),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 15.h),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       InkWell(
                  //         child: Container(
                  //           height: 38.h,
                  //           width: 120.w,
                  //           decoration: BoxDecoration(
                  //             color: isCurrent
                  //                 ? Color(0xff22D27F)
                  //                 : Color(0xffBCBCBB),
                  //             borderRadius: BorderRadius.circular(7.r),
                  //           ),
                  //           child: Center(
                  //             child: Text(
                  //               'English',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 18.sp,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         onTap: () {
                  //           setState(() {
                  //             isCurrent = true;
                  //           });
                  //         },
                  //       ),
                  //       Gap(10.h),
                  //       InkWell(
                  //         child: Container(
                  //           height: 38.h,
                  //           width: 120.w,
                  //           decoration: BoxDecoration(
                  //             color: isCurrent
                  //                 ? Color(0xffBCBCBB)
                  //                 : Color(0xff22D27F),
                  //             borderRadius: BorderRadius.circular(7.r),
                  //           ),
                  //           child: Center(
                  //             child: Text(
                  //               'Arabic',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 18.sp,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         onTap: () {
                  //           setState(() {
                  //             isCurrent = false;
                  //           });
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Gap(50.h),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back".tr(),
                        style: Styles.headLineGray2.copyWith(fontSize: 17.sp),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
