  import 'dart:convert';
  import 'package:easy_localization/easy_localization.dart';
  import 'package:get/get_core/src/get_main.dart';
  import 'package:get/get_navigation/get_navigation.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
 import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/Edit_account.dart';
import 'package:hayat/screens/bottom.dart';
 import 'package:hayat/screens/foget_number_screen.dart';
import 'package:hayat/screens/home_screen.dart';
import 'package:hayat/screens/sign_up_screen.dart';
import 'package:hayat/shared/component/login_api.dart';
import 'package:hayat/translations/locale_keys.g.dart';
  import 'package:http/http.dart' as http;

import 'package:hayat/shared/component/component.dart';
import 'package:jwt_decode/jwt_decode.dart';



class SignInScreen extends StatefulWidget {

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final userData =GetStorage();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  // void lo (String email,String password,)async{
  //   var headers = {
  //     'Content-Type': 'application/json'
  //   };
  //   var request = http.Request('POST', Uri.parse('http://eibtekone-001-site11.atempurl.com/api/auth/login'));
  //   request.body =  jsonEncode({
  //     "email":email,
  //     "password":password,
  //   });
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     var log=json.decode(request.body);
  //     print('log=${log }');
  //
  //     userData.write('isLogged', true);
  //     userData.write('email', email);
  //     userData.write('password', password);
  //     print(await response.stream.bytesToString());
  //     Get.offAll(BottomNav());
  //
  //   }
  //   else {
  //
  //   print(response.reasonPhrase);
  //   }
  //
  // }
  void login(String email,String password, )async{
    try{
      var response = await http.post(
          Uri.parse('http://eibtek2-001-site3.atempurl.com/api/auth/login'),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "email":email,
            "password":password,
          }
          ));
      var data=jsonDecode(response.body.toString());
      if(response.statusCode==200){
        print(data);
        var log=json.decode(response.body);

        print('token${log['Token']}');
        Map<String, dynamic> payload = Jwt.parseJwt(log['Token']);
         var tokenId=payload['Id'];
         print('tokenId ${tokenId}');


        print('read token ${userData.read('token')}');

        userData.write('isLogged', true);
        userData.write('token', payload['Id']);
        userData.write('FullName', payload['FullName']);
        userData.write('Email', payload['Email']);
        userData.write('PhoneNumber', payload['PhoneNumber']);
        userData.write('Img', payload['Img']);


        userData.write('email', email);
        userData.write('password', password);
        Get.offAll(BottomNav());


        //  return login.fromJson(jsonDecode(response.body));

      }else{
        print("Faild");
      }


    }catch(e){
      print(e.toString());
    }
  }

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: [
              Gap(100.h),
              Center(
                  child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                height: 175.h,
                width: 175.h,
              )),
              Gap(8.h),
              Text(
                "Log in to continue".tr(),
                style: Styles.headLine1,
              ) ,
              Gap(10.h),
              Text(
                "Welcome".tr(),
                style: Styles.headLineGray2,
              ),
              Gap(29.h),
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
              Padding(
                padding:   EdgeInsets.symmetric(horizontal: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetNumberScreen()));
                      },
                      child: Text(
                        "Forget your Password?".tr(),
                        style: Styles.headLineGray2 ,
                    )),
                  ],
                ),
              ),
              Gap(30.h),
              SizedBox(
                width:double.infinity,
                height: 34.h,
                child: ElevatedButton(
                  onPressed: () {
                    login(emailController.text.toString(), passwordController.text.toString());
                  },
                  child: Text(
                    LocaleKeys.LOG_IN.tr(),
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
              // buildBottum(height: 42.h, width: 290.h,
              //   decoration: BoxDecoration(
              //     color: Styles.buttomColor,
              //     borderRadius: BorderRadius.circular(7.5.r),
              //   ),
              //   text:  Text(
              //     "LOG IN".tr(),
              //
              //   style: Styles.buttomStyle ,
              //   textAlign: TextAlign.center,
              // ),
              //   onTap: (){login(emailController.text.toString(), passwordController.text.toString());},
              //
              // ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap:(){
                  //
                  //   },
                  //   child: Container(
                  //     height: 30.h,
                  //     width: 30.h,
                  //     decoration: BoxDecoration(
                  //         color: Styles.defaultColor5,
                  //
                  //         shape: BoxShape.circle,
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.grey.shade300,
                  //             spreadRadius: 1,
                  //             blurRadius: 2,
                  //             offset: Offset(1,2),
                  //           )
                  //         ]
                  //     ),
                  //     child: Stack(alignment: Alignment.center,
                  //       children: [
                  //         Container(
                  //
                  //
                  //
                  //           height: 15.h,
                  //           width: 15.h,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(2.r),
                  //               image: DecorationImage(
                  //                 fit: BoxFit.cover,
                  //                 image: AssetImage('assets/ff.png'),
                  //               )
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Gap(20.h),
                  // InkWell(
                  //   onTap:()async{
                  //     var user=await LoginApi.login();
                  //     // userData.write('isLoggedByGoogle', true);
                  //     // userData.write('isLogged', false);
                  //     //
                  //     // if(user!=null){
                  //     //   print('Done');
                  //     //   userData.write('name', user.displayName);
                  //     //   userData.write('img', user.photoUrl);
                  //     //   userData.write('email', user.email);
                  //     //   print(user.displayName);
                  //     //   print(user.email);
                  //     //   print(userData.read('name'));
                  //     //   print(userData.read('email'));
                  //     //  // Get.offAll(BottomNav());
                  //     //
                  //     //
                  //     // }
                  //   },
                  //   child: Container(
                  //     height: 30.h,
                  //     width: 30.h,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //
                  //         shape: BoxShape.circle,
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.grey.shade300,
                  //             spreadRadius: 1,
                  //             blurRadius: 2,
                  //             offset: Offset(1,2),
                  //           )
                  //         ]
                  //     ),
                  //     child: Stack(alignment: Alignment.center,
                  //       children: [
                  //         Container(
                  //
                  //
                  //
                  //           height: 15.h,
                  //           width: 15.h,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(2.r),
                  //               image: DecorationImage(
                  //                 fit: BoxFit.cover,
                  //                 image: AssetImage('assets/ggg.png'),
                  //               )
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Gap(3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don\\'t have an account ?".tr(),
                    style: Styles.headLineGray1,
                  ),
                  defaultTextBottom(onPressed:  () {
                    Get.offAll(SignUpScreen());
                  }, text:   "SIGN UP".tr(),),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
 }
