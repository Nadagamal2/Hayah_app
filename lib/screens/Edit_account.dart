import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/doneScreen.dart';
import 'package:hayat/shared/component/component.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decode/jwt_decode.dart';


import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final userData = GetStorage();



  final userNameController = new TextEditingController();
  final PhoneNumberController = new TextEditingController();
  final emailController = new TextEditingController();
  // void editProfile(
  //     String FullName,
  //     String PhoneNumber,
  //     String email,
  //     String img,
  //     ) async {
  //   var headers = {
  //     'Content-Encoding': 'application/ecmascript',
  //     'Accept': 'image/jpeg',
  //     'Cookie': '.AspNetCore.Antiforgery.-YTNMYcmo-k=CfDJ8Kmgtrcmz91Mp3vhnvHKpHw9pSEsoMEzFtc5g0rQ6J_Tt7ENmwegQcaOn6f9YwFDtyCQqSJ4KxuM_S8TqXokGvPOgbjOVwIrsUez6mfGWKOV1m-7qOMtk7J5WwCevO3A6K5n8au_QRx8eY8WKiIPXZM'
  //   };
  //   var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse(
  //           'http://eibtek2-001-site3.atempurl.com/api/auth/EditeAccount/${userData.read('token')}'));
  //   request.fields
  //       .addAll({'email': email, 'name': FullName, 'phone': PhoneNumber});
  //
  //
  //   request.files.add(await http.MultipartFile.fromPath('photo', img));
  //   request.headers.addAll(headers);
  //
  //   var streamedResponse  = await request.send();
  //   var response   = await http.Response.fromStream(streamedResponse);
  //   final result = jsonDecode(response .body) as Map<String, dynamic>;
  //
  //   if (response.statusCode == 200) {
  //    Get.offAll(DoneScreen());
  //     print(result['Token']);
  //     Map<String, dynamic> payload = Jwt.parseJwt(result['Token']);
  //     userData.write('token', payload['Id']);
  //     userData.write('FullName', payload['FullName']);
  //     userData.write('Email', payload['Email']);
  //     userData.write('PhoneNumber', payload['PhoneNumber']);
  //     userData.write('Img', payload['Img']);
  //
  //
  //     // print(result['token']);
  //     // Map<String, dynamic> payload = Jwt.parseJwt(result['token']);
  //     // var  tokenId=payload['Id'];
  //     // var userName=payload['FullName'];
  //     // var Email=payload['Email'];
  //     // var PhoneNumber=payload['PhoneNumber'];
  //     // var ImgUrl=payload['ImgUrl'];
  //     // print('ImgUrl= ${ImgUrl}');
  //     // userData.write('tokenEdit', payload['Id']);
  //     //
  //     // userData.write('EmailEdit', payload['Email']);
  //     // userData.write('PhoneNumberEdit', payload['PhoneNumber']);
  //     // userData.write('ImgUrlEdit', ImgUrl);
  //
  //   } else {
  //     print(response.reasonPhrase);
  //
  //   }
  // }
  void editNameProfile(
      String FullName,

      ) async {
    var headers = {
      'Content-Encoding': 'application/ecmascript',
      'Accept': 'image/jpeg'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://eibtek2-001-site3.atempurl.com/api/auth/EditeAccount/${userData.read('token')}'));
    request.fields
        .addAll({'name': FullName,});



    request.headers.addAll(headers);

    var streamedResponse  = await request.send();
    var response   = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response .body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print(1);
     Get.offAll(DoneScreen());
      print(result['Token']);
      Map<String, dynamic> payload = Jwt.parseJwt(result['Token']);

      userData.write('FullName', payload['FullName']);


      // print(result['token']);
      // Map<String, dynamic> payload = Jwt.parseJwt(result['token']);
      // var  tokenId=payload['Id'];
      // var userName=payload['FullName'];
      // var Email=payload['Email'];
      // var PhoneNumber=payload['PhoneNumber'];
      // var ImgUrl=payload['ImgUrl'];
      // print('ImgUrl= ${ImgUrl}');
      // userData.write('tokenEdit', payload['Id']);
      //
      // userData.write('EmailEdit', payload['Email']);
      // userData.write('PhoneNumberEdit', payload['PhoneNumber']);
      // userData.write('ImgUrlEdit', ImgUrl);

    } else {
      print(response.reasonPhrase);

    }
  }
  void  editEmailProfile(
      String email,

      ) async {
    var headers = {
      'Content-Encoding': 'application/ecmascript',
      'Accept': 'image/jpeg'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://eibtek2-001-site3.atempurl.com/api/auth/EditeAccount/${userData.read('token')}'));
    request.fields
        .addAll({'email':    email, 'phone': '${userData.read('PhoneNumber')}', });


     request.headers.addAll(headers);

    var streamedResponse  = await request.send();
    var response   = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response .body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print(2);
     Get.offAll(DoneScreen());
      print(result['Token']);
      Map<String, dynamic> payload = Jwt.parseJwt(result['Token']);

      userData.write('Email', payload['Email']);




      // print(result['token']);
      // Map<String, dynamic> payload = Jwt.parseJwt(result['token']);
      // var  tokenId=payload['Id'];
      // var userName=payload['FullName'];
      // var Email=payload['Email'];
      // var PhoneNumber=payload['PhoneNumber'];
      // var ImgUrl=payload['ImgUrl'];
      // print('ImgUrl= ${ImgUrl}');
      // userData.write('tokenEdit', payload['Id']);
      //
      // userData.write('EmailEdit', payload['Email']);
      // userData.write('PhoneNumberEdit', payload['PhoneNumber']);
      // userData.write('ImgUrlEdit', ImgUrl);

    } else {
      print(response.reasonPhrase);

    }
  }
  void editPhoneProfile(
      String PhoneNumber,

      ) async {
    var headers = {
      'Content-Encoding': 'application/ecmascript',
      'Accept': 'image/jpeg'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://eibtek2-001-site3.atempurl.com/api/auth/EditeAccount/${userData.read('token')}'));
    request.fields
        .addAll({  'phone': PhoneNumber});


     request.headers.addAll(headers);

    var streamedResponse  = await request.send();
    var response   = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response .body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print(3);
     Get.offAll(DoneScreen());
      print(result['Token']);
      Map<String, dynamic> payload = Jwt.parseJwt(result['Token']);

      userData.write('PhoneNumber', payload['PhoneNumber']);
      print( payload['PhoneNumber']);



      // print(result['token']);
      // Map<String, dynamic> payload = Jwt.parseJwt(result['token']);
      // var  tokenId=payload['Id'];
      // var userName=payload['FullName'];
      // var Email=payload['Email'];
      // var PhoneNumber=payload['PhoneNumber'];
      // var ImgUrl=payload['ImgUrl'];
      // print('ImgUrl= ${ImgUrl}');
      // userData.write('tokenEdit', payload['Id']);
      //
      // userData.write('EmailEdit', payload['Email']);
      // userData.write('PhoneNumberEdit', payload['PhoneNumber']);
      // userData.write('ImgUrlEdit', ImgUrl);

    } else {
      print(response.reasonPhrase);

    }
  }
  void editImageProfile(
      String img,

      ) async {
    var headers = {
      'Content-Encoding': 'application/ecmascript',
      'Accept': 'image/jpeg'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://eibtek2-001-site3.atempurl.com/api/auth/EditeAccount/${userData.read('token')}'));

    request.fields
        .addAll({



      'phone': '${userData.read('PhoneNumber')}',
    });

    request.files.add(await http.MultipartFile.fromPath('photo', img));
   //  request.files.add(await http.MultipartFile.fromPath('photo', '${userData.read('Img')}'));
    request.headers.addAll(headers);

    var streamedResponse  = await request.send();
    var response   = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response .body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print(4);
     Get.offAll(DoneScreen());
      print(result['Token']);
      Map<String, dynamic> payload = Jwt.parseJwt(result['Token']);

      userData.write('Img', payload['Img']);


      // print(result['token']);
      // Map<String, dynamic> payload = Jwt.parseJwt(result['token']);
      // var  tokenId=payload['Id'];
      // var userName=payload['FullName'];
      // var Email=payload['Email'];
      // var PhoneNumber=payload['PhoneNumber'];
      // var ImgUrl=payload['ImgUrl'];
      // print('ImgUrl= ${ImgUrl}');
      // userData.write('tokenEdit', payload['Id']);
      //
      // userData.write('EmailEdit', payload['Email']);
      // userData.write('PhoneNumberEdit', payload['PhoneNumber']);
      // userData.write('ImgUrlEdit', ImgUrl);

    } else {
      print(response.reasonPhrase);

    }
  }
  var formKey1 = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var formKey3 = GlobalKey<FormState>();
  var formKey4 = GlobalKey<FormState>();


  @override
  void dispose() {
    PhoneNumberController.dispose();
    userNameController.dispose();
    emailController.dispose();

    super.dispose();
  }

  static File? file;
  String? imag;
  ImagePicker image = ImagePicker();
  getGallery() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
      print(img.path);

      imag = img.path;
      userData.write('path', file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(70.h),
              Text(
                LocaleKeys.Modify_your_Account.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(30.h),
              Form(
                key: formKey4,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    file == null
                        ? CircleAvatar(
                      backgroundImage: AssetImage('assets/2345.png'),
                      radius: 45.r,
                    )
                        : CircleAvatar(
                      backgroundImage: FileImage(file!),
                      radius: 45.r,
                    ),
                    InkWell(
                      onTap: () {
                        getGallery();
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0xff898A8F),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Styles.ScafoldColor,
                          size: 14.sp,
                        ),
                        radius: 13.r,
                      ),
                    )
                  ],
                ),
              ),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  children: [
                    Form(
                key:formKey1,
                      child: TextFormField(
                        cursorColor: Colors.grey.shade400,
                        keyboardType: TextInputType.text,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return LocaleKeys.Please_Enter_Your_Updated_Name.tr();
                          }
                        },
                        controller: userNameController,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3.h, horizontal: 10.h),
                            filled: true,
                            fillColor: Color(0xffF6F5F5),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: .1.r, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: .1.r, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            labelText: LocaleKeys.new_user_name.tr(),
                            hintText: LocaleKeys.new_user_name.tr(),
                            labelStyle: TextStyle(
                                fontSize: 15.sp, color: Colors.grey.shade400),
                            hintStyle: TextStyle(
                                fontSize: 15.sp, color: Colors.grey.shade400)),
                      ),
                    ),
                    Gap(15.h),
                    Form(
                      key: formKey2,
                      child: TextFormField(
                        cursorColor: Colors.grey.shade400,
                        keyboardType: TextInputType.number,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return LocaleKeys.Please_Enter_Your_Updated_Number.tr();
                          }
                        },
                        controller: PhoneNumberController,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3.h, horizontal: 10.h),
                            filled: true,
                            fillColor: Color(0xffF6F5F5),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: .1.r, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: .1.r, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            labelText: LocaleKeys.new_phone_number.tr(),
                            hintText:LocaleKeys.new_phone_number.tr(),
                            labelStyle: TextStyle(
                                fontSize: 15.sp, color: Colors.grey.shade400),
                            hintStyle: TextStyle(
                                fontSize: 15.sp, color: Colors.grey.shade400)),
                      ),
                    ),
                    Gap(15.h),
                    Form(
                      key: formKey3,
                      child: TextFormField(
                        cursorColor: Colors.grey.shade400,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return LocaleKeys.Please_Enter_Your_Updated_Email.tr();
                          }
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3.h, horizontal: 10.h),
                            filled: true,
                            fillColor: Color(0xffF6F5F5),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: .1.r, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: .1.r, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            labelText: LocaleKeys.new_email.tr(),
                            hintText: LocaleKeys.new_email.tr(),
                            labelStyle: TextStyle(
                                fontSize: 15.sp, color: Colors.grey.shade400),
                            hintStyle: TextStyle(
                                fontSize: 15.sp, color: Colors.grey.shade400)),
                      ),
                    ),
                    Gap(50.h),
                    buildBottum(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: double.infinity,
                      text: Text(
                        LocaleKeys.Change_Name.tr(),
                        style: TextStyle(
                            color: Styles.defualtColor2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        if(formKey1.currentState!.validate()){ editNameProfile(  userNameController.text.toString(),);}

                       //  editEmailProfile( emailController.text.toString(),);
                        // editPhoneProfile( PhoneNumberController.text.toString(),);
                      //  editImageProfile(imag!);
                        // editProfile(
                        //     userNameController.text.toString(),
                        //     PhoneNumberController.text.toString(),
                        //     emailController.text.toString(),
                        //     imag!);


                      },
                    ),
                    Gap(10.h),

                    buildBottum(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: double.infinity,
                      text: Text(
                        LocaleKeys.Change_phone.tr(),
                        style: TextStyle(
                            color: Styles.defualtColor2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        // editNameProfile(  userNameController.text.toString(),);
                        // editEmailProfile( emailController.text.toString(),);
                        if(formKey2.currentState!.validate()){editPhoneProfile( PhoneNumberController.text.toString(),);}

                        //  editImageProfile(imag!);
                        // editProfile(
                        //     userNameController.text.toString(),
                        //     PhoneNumberController.text.toString(),
                        //     emailController.text.toString(),
                        //     imag!);


                      },
                    ),
                    Gap(10.h),
                    buildBottum(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: double.infinity,
                      text: Text(
                        LocaleKeys.Change_Email.tr(),
                        style: TextStyle(
                            color: Styles.defualtColor2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        // editNameProfile(  userNameController.text.toString(),);
                        if(formKey3.currentState!.validate()){ editEmailProfile( emailController.text.toString(),);}

                        // editPhoneProfile( PhoneNumberController.text.toString(),);
                        //  editImageProfile(imag!);
                        // editProfile(
                        //     userNameController.text.toString(),
                        //     PhoneNumberController.text.toString(),
                        //     emailController.text.toString(),
                        //     imag!);


                      },
                    ),

                    Gap(10.h),
                    buildBottum(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: double.infinity,
                      text: Text(
                        LocaleKeys.Change_Img.tr(),
                        style: TextStyle(
                            color: Styles.defualtColor2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        // editNameProfile(  userNameController.text.toString(),);
                        //  editEmailProfile( emailController.text.toString(),);
                        //  editPhoneProfile( PhoneNumberController.text.toString(),);
                        if(formKey4.currentState!.validate()){ editImageProfile(imag!);}

                        // editProfile(
                        //     userNameController.text.toString(),
                        //     PhoneNumberController.text.toString(),
                        //     emailController.text.toString(),
                        //     imag!);


                      },
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text( LocaleKeys.Back.tr(),
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp))),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
