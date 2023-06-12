import 'package:dio/dio.dart';
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
 import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/core/utils/img_controller.dart';
import 'package:hayat/models/accont_details_model.dart';
import 'package:hayat/screens/Edit_account.dart';
import 'package:hayat/screens/account_screen.dart';
import 'package:hayat/shared/component/component.dart';

class accountDetailScreen extends StatefulWidget {



    accountDetailScreen({Key? key ,  }) : super(key: key);

  @override
  State<accountDetailScreen> createState() => _accountDetailScreenState();
}

class _accountDetailScreenState extends State<accountDetailScreen> {
  final userData = GetStorage();
   Future<AccountDetailsModel?> accountDetail() async {
     String url =
        'http://eibtek2-001-site3.atempurl.com/api/auth/GetAccountData/${userData.read('token')}';
    final dio = Dio();
    Response response;
    response =  await dio.post(url,
        data: {},
        options: Options(headers: {
          'Cookie':
              '.AspNetCore.Antiforgery.gOa3Bn9zkk4=CfDJ8HfbaXDqR-dAnx3DwbR3Yzsw1bpk2lPFnT64SiyIC2plAso1nBlV5-AcvTE-p6duZfAHHsX5u2GPuf4ladlKEdXkgl1ksSs1qLAf521Lt_kZk0s4-BOElfIHsO4n58jotfK2hRbrlLixmsPVtjAVD3M'
        }));
    if (response.statusCode == 200) {
      print(response.data);
      return AccountDetailsModel .fromJson(response.data);


    } else {
      print('fail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.ScafoldColor2,
      appBar: AppBar(
        toolbarHeight: 65.h,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
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
          "Profile".tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 130.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Styles.defualtColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 23.h, vertical: 15.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Container(
                          height: 32.h,
                          width: 80.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "Edit".tr(),
                              style: Styles.headLine1
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ),
                        ),
                        onTap: () {
                          navigateTo(context, EditProfileScreen( ));
                        },
                      ),
                      Gap(20.h),
                      Container(
                        height: 135.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Center(
                              child: Text(
                                '${userData.read('FullName')}',
                                style: Styles.headLine1
                                    .copyWith(fontSize: 17.sp),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 111.h,
                  left: 124.h,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://eibtek2-001-site3.atempurl.com/Uploads/Users/${userData.read('Img')}'),
                    radius: 40.r,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Personal info".tr(),
                      style: Styles.headLine1.copyWith(fontSize: 17.sp),
                    ),
                  ),
                  Gap(14.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Styles.IconColor,
                        ),
                        Gap(15.h),
                        Text(
                          '${userData.read('PhoneNumber')}',
                          style: Styles.lable_Hint.copyWith(
                              color: Colors.black, fontSize: 12.sp),
                        )
                      ],
                    ),
                  ),
                  Gap(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail_outline_rounded,
                          color: Styles.IconColor,
                        ),
                        Gap(15.h),
                        Text(
                          '${userData.read('Email')}',
                          style: Styles.lable_Hint.copyWith(
                              color: Colors.black, fontSize: 12.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Gap(217),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Back".tr(),
                  style: Styles.headLineGray2.copyWith(fontSize: 17.sp),
                )),
          ],
        ),
      )
    );
  }

}
