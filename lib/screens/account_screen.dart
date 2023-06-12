import 'package:dio/dio.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
 import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/accont_details_model.dart';
import 'package:hayat/screens/Notification_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hayat/screens/account_Detail_screen.dart';
import 'package:hayat/screens/change%20password.dart';
import 'package:hayat/screens/city_detail_screen.dart';
import 'package:hayat/screens/complaint_screen.dart';
import 'package:hayat/screens/contact_us_screen.dart';
import 'package:hayat/screens/setting.dart';
import 'package:hayat/screens/sign_in_screen.dart';
import 'package:hayat/screens/term_condition_screen.dart';
import 'package:hayat/shared/component/component.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final userData =GetStorage();
  Future<AccountDetailsModel?> accountDetail() async {
    String url =
        'http://eibtekone-001-site11.atempurl.com/api/auth/GetAccountData/${userData.read('token')}';
    final dio = Dio();
    Response response;
    response =  await dio.post(url,
        data: {},
        options: Options(headers: {
          'Cookie':
          '.AspNetCore.Antiforgery.gOa3Bn9zkk4=CfDJ8HfbaXDqR-dAnx3DwbR3Yzsw1bpk2lPFnT64SiyIC2plAso1nBlV5-AcvTE-p6duZfAHHsX5u2GPuf4ladlKEdXkgl1ksSs1qLAf521Lt_kZk0s4-BOElfIHsO4n58jotfK2hRbrlLixmsPVtjAVD3M'
        }));
    if (response.statusCode == 200) {
      return AccountDetailsModel .fromJson(response.data);

    } else {
      print('fail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 65.h,
        elevation: 0,
        backgroundColor: Styles.defualtColor,
        title: Text(
          "Account".tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        // leading: InkWell(
        //   child: Container(
        //     padding: EdgeInsets.all(10.h),
        //     child:  InkWell(
        //       onTap: () {
        //         Get.to(() => SettingScreen());
        //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
        //       },
        //       child: Icon(
        //         FluentSystemIcons.ic_fluent_settings_regular,
        //         color: Colors.white,
        //         size: 35.sp,
        //       ),
        //     )
        //   ),
        // ),
      ),
      backgroundColor: Styles.ScafoldColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(10.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.h),
              child: Stack(
                children: [
                  Container(
                      height: 180.h,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(10.h),
                          CircleAvatar(
                           // backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                'http://eibtek2-001-site3.atempurl.com/Uploads/Users/${userData.read('Img')}'),
                            radius: 40.r,
                          ),
                          Gap(10.h),
                          Text(
                            '${userData.read('FullName')}',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Gap(10.h),
                          Text(
                            '${userData.read('PhoneNumber')}',
                            style: TextStyle(
                                fontSize: 16.5.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.r),
                        color: Styles.buttomColor,
                      )),
                  Positioned(
                      bottom: 89.h,
                      height: 130.h,
                      width: 220.w,
                      right: -72.h,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => changePasswordScreen());
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
                        },
                        child: Icon(
                          FluentSystemIcons.ic_fluent_settings_regular,
                          color: Colors.white,
                          size: 35.sp,
                        ),
                      )),
                ],
              ),
            ),
            Gap(25.h),
            BuildAccountScreen(
              text: "Account".tr(),
              icons: FluentSystemIcons.ic_fluent_person_regular,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r)),
              onTap: () {
                Get.to(()=>accountDetailScreen( ));
              },
            ),
            BuildAccountScreen(
              text: "City".tr(),
              icons: FluentSystemIcons.ic_fluent_location_regular,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0), topRight: Radius.circular(0)), onTap: () {
              Get.to(()=>CityDetailScreen());

            },
            ),
            BuildAccountScreen(
              text: "Contact Us".tr(),
              icons: FluentSystemIcons.ic_fluent_person_support_regular,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0), topRight: Radius.circular(0)), onTap: () {
              Get.to(()=>ContactUsScreen());
            },
            ),
            // BuildAccountScreen(
            //   text: "Complaints".tr(),
            //   icons: FluentSystemIcons.ic_fluent_notebook_question_mark_regular,
            //   borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(0), topRight: Radius.circular(0))
            //   , onTap: () {
            //   Get.to(()=>ComplaintsScreen());
            // },
            // ),
            BuildAccountScreen(
              text:  "Terms and Conditions".tr(),
              icons: FluentSystemIcons.ic_fluent_handshake_regular,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0), topRight: Radius.circular(0)), onTap: () {
              Get.to(()=>TermsAndConditions());
            },
            ),
            // BuildAccountScreen(
            //   text: "Notifications".tr(),
            //   icons: Icons.notifications_none_outlined,
            //   borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(0), topRight: Radius.circular(0)), onTap: () {
            //   Get.to(()=>NotificationScreen());
            // },
            // ),
            BuildAccountScreen(
              text:"Logout".tr(),
              color: Colors.white,
              icons: Icons.logout_rounded,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              onTap: () {
                userData.write('isLogged', false);
                userData.remove('email');
                userData.remove('password');
              showDialog(
                context: context,
                builder:(context)=>AlertDialog(
                  title: Text("Logout".tr(),  style: TextStyle(
                    fontSize: 18.sp,
                  ),),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text( "Are you sure to leave ?".tr(),
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      const SizedBox(height: 32,),

                    ],

                  ),
                  actions: [
                    TextButton(onPressed: ()=>Get.offAll(()=>SignInScreen()), child: Text(
                      "Ok".tr(),
                      style: TextStyle(
                      fontSize: 15.sp,
                    ),
                    )),
                    TextButton(onPressed: ()=>Get.back(), child: Text(
                      "Cancel".tr(),style: TextStyle(
                      fontSize: 15.sp,
                    ),
                    )),
                  ],

                ),
              );

            },
            ),
            Gap(10.h),
          ],
        ),
      ),
    );
  }
}
