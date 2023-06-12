import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/TermsAndConditions_model.dart';
import 'package:hayat/screens/account_screen.dart';
import 'package:hayat/shared/component/component.dart';
import 'package:http/http.dart' as http;

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  Future<TermsAndConditionsModel> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetAllTerms'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode==200) {

      print(response.body.length);
      return TermsAndConditionsModel.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.ScafoldColor2,
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
          "Terms and Conditions" .tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
      ),
      body: Padding(
        padding:   EdgeInsets.all(20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                decoration: BoxDecoration(
                  color: Styles.ScafoldColor,
                  borderRadius: BorderRadius.circular(10.h)
                ),
                child: Padding(
                  padding:   EdgeInsets.all(10.h),
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: getData(),

                        builder: (  context,  snapshot) {
                          if(snapshot.hasData){
                            return Column(
                              children: snapshot.data!.records!.map((e) =>
                                  Container(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Styles.defualtColor,
                                          radius: 3.r,

                                        ),
                                        Gap(10.h),
                                        SizedBox
                                          (
                                          width: 250.h,
                                          child: Text(
                                          '${e.details}'
                              ),
                                        ),
                                      ],
                                    ),
                                  ),).toList());

                          }else {
                            return Center(
                              child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defualtColor),),
                            );
                          }
                        },

                      ),
                      Gap(20.h),


                      Row(
                        children: [
                          buildBottum(
                            height: 34.h,
                            width: 100.w,
                            text: Text( "Accept".tr(),style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),),
                            onTap: () =>Get.back(),
                            decoration: BoxDecoration(
                              color: Styles.buttomColor,
                              borderRadius: BorderRadius.circular(14),)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
