
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/bottom.dart';
 import '../translations/locale_keys.g.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/www.png'),
            height: 100.h,
          ),
          Gap(30.h),
          Center(
              child: Text(
            LocaleKeys.Profile_Updated_Successfully.tr(),
            style: TextStyle(color: Styles.defualtColor, fontSize: 18.sp),
          )),
          Gap(20.h),
          ElevatedButton(
              onPressed: () {
                Get.offAll(BottomNav());
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Styles.defualtColor),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 15.sp))),
              child: Text( LocaleKeys.Go_To_Home.tr(),))
        ],
      ),
    );
  }
}
