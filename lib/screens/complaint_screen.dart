import 'dart:convert';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
 import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/compliant_done_screen.dart';
import 'package:hayat/shared/component/component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;
class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  final compliantController=new TextEditingController();
  void compliant(String  compliant)async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://eibtek2-001-site3.atempurl.com/api/PostComplains'));
    request.body = json.encode({
      "Deails": compliant
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.to(ComplaintsDoneScreen());
    }
    else {
      print(response.reasonPhrase);
    }

  }
  @override
  void dispose(){
    compliantController.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    final double height=120.h;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.h,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Styles.defualtColor,


        // leading: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Icon(
        //       Icons.arrow_back_ios_rounded,
        //       color: Colors.white,
        //       size: 25.sp,
        //     )),
        centerTitle: true,
        title: Text(
          "Complaints".tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(30.h),

            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 33.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    'assets/ccc.png',
                    fit: BoxFit.cover,
                    height: 200.h,
                    width: 200.h,
                  )),
                  Gap(15.h),
                  Text(
                    "Complaints and suggestion".tr(),
                    style:  TextStyle(
                      color: Color(0xff22D27F),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  Gap(15.h),
                  SizedBox(
                    height: height,
                    child: TextFormField(
                      cursorColor: Colors.grey.shade400,
                      maxLines: height ~/20.h,

                     controller: compliantController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        alignLabelWithHint: true,
                        helperMaxLines: 10,

                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding:
                        EdgeInsets.fromLTRB(10.h, 2.h, 20.h, 10.h),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: .6.r),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: .6.r),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        labelText: "Your Message".tr(),
                        hintText: "Your Message".tr(),
                        hintStyle: TextStyle(color: Color(0xffB6B6B6), fontWeight: FontWeight.w600,fontSize: 14.sp,),
                        labelStyle: TextStyle(color: Color(0xffB6B6B6), fontWeight: FontWeight.w600,fontSize: 14.sp,),
                      ),
                    ),
                  ),
                  Gap(60.r),
                  SizedBox(
                    width:double.infinity,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        compliant(compliantController.text.toString());

                      },
                      child: Text(
                        LocaleKeys.Send.tr(),
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

                  // Gap(8),
                  // TextButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: Text(
                  //       "Back".tr(),
                  //       style: Styles.headLineGray2.copyWith(fontSize: 15.sp),
                  //     ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
