 import 'dart:convert';
 import 'package:easy_localization/easy_localization.dart';
 import 'package:get/get_core/src/get_main.dart';
 import 'package:get/get_navigation/get_navigation.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
 import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/bottom.dart';
import 'package:hayat/screens/sign_in_screen.dart';
import 'package:hayat/screens/verify_screen.dart';
import 'package:hayat/translations/locale_keys.g.dart';
 import 'package:http/http.dart' as http;
 import 'package:get_storage/get_storage.dart';

import 'package:hayat/shared/component/component.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final userData =GetStorage();
  final userNameController=new TextEditingController();
  final PhoneNumberController=new TextEditingController();
  final emailController=new TextEditingController();
  final passwordController=new TextEditingController();
  final confirmPasswordController=new TextEditingController();

  void re(
      String FullName,
      PhoneNumber,
      email,
      password,
      confirmPassword,
      ) async {
    try {
      var response = await http.post(
          Uri.parse(
              'http://eibtek2-001-site3.atempurl.com/api/auth/Register'),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "FullName": FullName,
            "PhoneNumber": PhoneNumber,
            "email": email,
            "password": password,
            "confirmPassword": confirmPassword
          }));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(await response.body);
        var log = json.decode(response.body);
        print('token${log['Token']}');
        Map<String, dynamic> payload = Jwt.parseJwt(log['Token']);




        print('read token ${userData.read('token')}');

        userData.write('isLogged', true);
        userData.write('token', payload['Id']);
        userData.write('FullName', payload['FullName']);
        userData.write('Email', payload['Email']);
        userData.write('PhoneNumber', payload['PhoneNumber']);



        // userData.write('isLogged', true);
        // userData.write('Email', payload['Email']);
        // userData.write('PhoneNumbe', payload['PhoneNumber']);
        // userData.write('FullName', payload['FullName']);
        // userData.write('CountId', payload['CountId']);
        // userData.write('token', payload['Id']);
        // userData.write('email', email);
        // userData.write('password', password);
        // userData.write('confirmPassword', confirmPassword);

        Get.offAll(BottomNav());
      } else {

        print(await response.body);
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
  // final userData =GetStorage();
  // void re(String FullName,  PhoneNumber,  email,  password,  confirmPassword,)async{
  //   var headers = {
  //     'Content-Type': 'application/json'
  //   };
  //   var request = http.Request('POST', Uri.parse('http://eibtek2-001-site3.atempurl.com/api/auth/Register'));
  //   request.body = json.encode({
  //     "FullName":FullName,
  //     "PhoneNumber":PhoneNumber,
  //     "email":email,
  //     "password":password,
  //     "confirmPassword":confirmPassword
  //   });
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //     print(data);
  //     var log=json.decode(response.body);
  //
  //     print('token${log['Token']}');
  //     Map<String, dynamic> payload = Jwt.parseJwt(log['Token']);
  //     var tokenId=payload['Id'];
  //     print('tokenId ${tokenId}');
  //
  //
  //     print('read token ${userData.read('token')}');
  //
  //     userData.write('isLogged', true);
  //     userData.write('token', payload['Id']);
  //     userData.write('isLogged', true);
  //     userData.write('FullName', FullName);
  //     userData.write('PhoneNumber', PhoneNumber);
  //     userData.write('email', email);
  //     userData.write('password', password);
  //     userData.write('confirmPassword', confirmPassword);
  //     Get.offAll(BottomNav());
  //   }
  //   else {
  //     print(await response.stream.bytesToString());
  //   print(response.reasonPhrase);
  //   }
  // }
  // void register(String FullName,  PhoneNumber,  email,  password,  confirmPassword,)async{
  //   try{
  //     final response = await http.post(
  //         Uri.parse('http://eibtekone-001-site11.atempurl.com/api/auth/Register'),
  //         headers: {
  //           "Content-Type": "application/json",
  //         },
  //         body: jsonEncode(<String, dynamic>{
  //           "FullName":FullName,
  //           "PhoneNumber":PhoneNumber,
  //           "email":email,
  //           "password":password,
  //           "confirmPassword":confirmPassword
  //         }
  //
  //         ));
  //     var data=jsonDecode(response.body.toString());
  //      if(response.statusCode==200){
  //
  //       print(data);
  //       // userData.write('isLogged', true);
  //       // userData.write('email', email);
  //       // userData.write('password', password);
  //       Get.offAll(BottomNav());
  //
  //
  //       //  return login.fromJson(jsonDecode(response.body));
  //
  //     }else{
  //       print("Faild");
  //     }
  //
  //
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }
  @override
  void dispose(){
    PhoneNumberController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    confirmPasswordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  Gap(10.h),
                  Text(
                    "Create an account".tr(),
                    style: Styles.headLine1,
                  ),
                  Gap(10.h),
                  Text(
                    "Welcome".tr(),
                    style: Styles.headLineGray2,
                  ),
                  Gap(20.h),
                  defaultFieldForm(
                    controller: userNameController,
                      padding:  EdgeInsets.symmetric(vertical: 3.h),
                      Type: TextInputType.text,
                      prefix: FluentSystemIcons.ic_fluent_person_regular,
                      lable: "User Name".tr(),
                      hint:  "User Name".tr(),),
                  Gap(15.h),
                  defaultFieldForm(
                      controller: PhoneNumberController,
                      padding:  EdgeInsets.symmetric(vertical: 3.h),
                      Type: TextInputType.number,
                      prefix: FluentSystemIcons.ic_fluent_phone_regular,
                      lable: "phone Number".tr(),
                      hint: "phone Number".tr(),),
                  Gap(15.h),
                  defaultFieldForm(


                      controller: emailController,

                      padding:  EdgeInsets.symmetric(vertical: 3.h),
                      Type: TextInputType.emailAddress,
                      prefix: FluentSystemIcons.ic_fluent_mail_regular,
                      lable: "Email".tr(),
                      hint:  "Email".tr(),),
                  Gap(15.h),
                  defaultFieldForm(
                      controller: passwordController,
                      padding:  EdgeInsets.symmetric(vertical: 3.h),
                      Type: TextInputType.text,
                      prefix: FluentSystemIcons.ic_fluent_lock_regular,
                      lable: "Password".tr(),
                      hint: "Password".tr(),),
                  Gap(15.h),
                  defaultFieldForm(
                      controller: confirmPasswordController,
                      padding:  EdgeInsets.symmetric(vertical: 3.h),
                      Type: TextInputType.text,
                      prefix: FluentSystemIcons.ic_fluent_lock_regular,
                      lable:  "Confirm Password".tr(),
                      hint:"Confirm Password".tr(),),
                  Gap(25.h),
                  SizedBox(
                    width:double.infinity,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        re(userNameController.text.toString(),PhoneNumberController.text.toString(),emailController.text.toString(), passwordController.text.toString(),confirmPasswordController.text.toString());

                      },
                      child: Text(
                        LocaleKeys.SIGN_UP.tr(),
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
                  // buildBottum(
                  //   height: 42.h,
                  //   decoration: BoxDecoration(
                  //     color: Styles.buttomColor,
                  //     borderRadius: BorderRadius.circular(7.5.r),
                  //   ),
                  //   width:double.infinity,
                  //   text: Text(
                  //     "SIGN UP".tr(),
                  //     style: Styles.buttomStyle,
                  //     textAlign: TextAlign.center,
                  //   ),
                  //   onTap: (){
                  //     re(userNameController.text.toString(),PhoneNumberController.text.toString(),emailController.text.toString(), passwordController.text.toString(),confirmPasswordController.text.toString());
                  //
                  //   },
                  // ),
                  Gap(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have An Account ?".tr(),
                        style: Styles.headLineGray2.copyWith(fontSize: 12.5.sp),
                      ),
                      defaultTextBottom(
                        onPressed: () {
                          Get.offAll(SignInScreen());
                        },
                        text: "LOG IN".tr(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "For registration problems,contact technical support".tr(),
                  style: Styles.headLineGray2.copyWith(fontSize: 14.sp),
                ),
                Gap(9.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("via WhatsApp :".tr(),
                        style: Styles.headLineGray2.copyWith(fontSize: 14.5.sp)),
                    Gap(10.h),
                    buildBottum(
                      height: 36.h,
                      width: 111.h,
                      decoration: BoxDecoration(
                        color: Styles.buttomColor,
                        borderRadius: BorderRadius.circular(4.5.r),
                      ),
                      text: Text(
                        '01099095701',
                        style: Styles.buttomStyle.copyWith(fontSize: 15.sp),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        _launchUrl('whatsapp://send?phone=+201099095701');

                      },
                    ),


                  ],
                )
              ],
            ),
            Gap(20.h),
          ],
        )),
      ),
    );
  }
  Future<void> _launchUrl(String link) async {
    if (await launchUrl(Uri.parse(link))) {
      throw Exception('Could not launch  ');
    }
  }

}
