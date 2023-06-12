import 'package:dio/dio.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/compliant_done_screen.dart';
import 'package:hayat/screens/donePassword_screen.dart';
import 'package:hayat/shared/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
class changePasswordScreen extends StatefulWidget {
  const changePasswordScreen({Key? key}) : super(key: key);

  @override
  State<changePasswordScreen> createState() => _changePasswordScreenState();
}

class _changePasswordScreenState extends State<changePasswordScreen> {
  final OldPaasswordController=TextEditingController();
  final NewPasswordController=TextEditingController();
  final ConfirmNewPasswordController=TextEditingController();
  final userData = GetStorage();
  void changePassword({
    required dynamic OldPaassword,
    required dynamic NewPassword,
    required dynamic ConfirmNewPassword,
  }) async {
    String url =
        'http://eibtek2-001-site3.atempurl.com/api/auth/EditePassword/${userData.read('token')}';
    final dio = Dio();
    Response response;
    response = await dio.post(url,
        data: {
          "OldPaassword": OldPaassword,
          "NewPassword": NewPassword,
          "ConfirmNewPassword": ConfirmNewPassword
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Cookie':
              '.AspNetCore.Antiforgery.gOa3Bn9zkk4=CfDJ8NpUteykIA5KqXdr8-bJ3BQpmSUHvLAqZNk9LcNtI-cJpOVxNdHrOHQ3wyLZdqnPWK7rSSn4mn-silGygZiCDhI0lRHnPnW5YpZC62UwrGDzAKgt_eZR-QQgUZxsBBPn-450EEV6LM9sD3La7aIq_hI'
        }));
    if (response.statusCode == 200) {
     print('done');
      userData.write("isChanged", true);
      userData.write('NewPassword', NewPassword);
      userData.write('ConfirmNewPassword', ConfirmNewPassword);
      print(response.data);
      Get.to(DonePassScreen());
    } else {
      print('fail');
    }


  }

  @override
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
          "Change Password".tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.h),
          child: Column(
            children: [
              Gap(20.h),
              Center(
                  child: Image.asset(
                'assets/w.png',
                fit: BoxFit.cover,
                height: 190.h,
                width: 190.h,
              )),
              Gap(25.h),
              Text(
                "Change Your Password".tr(),
                style: Styles.headLine1.copyWith(fontSize: 17.sp),
              ),
              Gap(15.h),
              defaultFieldForm(
                controller: OldPaasswordController,
                padding: EdgeInsets.symmetric(vertical: 3),
                Type: TextInputType.text,
                prefix: FluentSystemIcons.ic_fluent_lock_regular,
                lable: "Old Password".tr(),
                hint: "Old Password".tr(),
              ),
              Gap(18.h),
              defaultFieldForm(
                controller: NewPasswordController,
                padding: EdgeInsets.symmetric(vertical: 3),
                Type: TextInputType.text,
                prefix: FluentSystemIcons.ic_fluent_lock_regular,
                lable: "New Password".tr(),
                hint: "New Password".tr(),
              ),
              Gap(18.h),
              defaultFieldForm(
                controller: ConfirmNewPasswordController,
                padding: EdgeInsets.symmetric(vertical: 3),
                Type: TextInputType.text,
                prefix: FluentSystemIcons.ic_fluent_lock_regular,
                lable: "Confirm Password".tr(),
                hint: "Confirm Password".tr(),
              ),
              Gap(33.h),
              buildBottum(
                height: 42.h,
                width: 290.h,
                decoration: BoxDecoration(
                  color: Styles.buttomColor,
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                text: Text(
                  "Next".tr(),
                  style: Styles.buttomStyle,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  changePassword(OldPaassword: OldPaasswordController.text.toString(), NewPassword: NewPasswordController.text.toString(), ConfirmNewPassword: ConfirmNewPasswordController.text.toString());
                },
              ),
              Gap(10.h),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back".tr(),
                    style: Styles.headLineGray2.copyWith(fontSize: 15.sp),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
