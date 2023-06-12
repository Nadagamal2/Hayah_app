import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/have_question.dart';
import 'package:hayat/screens/have_question_screen.dart';
import 'package:hayat/shared/component/component.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;
import 'package:hayat/models/Question_model.dart';

class AnswerQuestionScreen extends StatefulWidget {
  const AnswerQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AnswerQuestionScreen> createState() => _AnswerQuestionScreenState();
}

class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {
  final userData = GetStorage();
  Future<HaveQuestionModel> getData() async {
    final response = await http.post(
        Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetByUserId/${userData.read('token')}'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode==200) {

      print(data);
      return HaveQuestionModel.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.h,
        elevation: 0,
        backgroundColor: Styles.defualtColor,
        // leading: InkWell(
        //   child: Container(
        //     padding: EdgeInsets.all(10),
        //     child: Image(
        //       image: AssetImage(
        //         'assets/whats.png',
        //       ),
        //
        //
        //     ),
        //   ),
        // ),
        centerTitle: true,
        title:  Text(
          LocaleKeys.Answer_your_questions.tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),

      ),
      backgroundColor: Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Gap(10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FutureBuilder(
                future: getData(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return SizedBox(
                      height: 500.h,
                      child: ListView.separated(
                        itemBuilder: (context,index)=> Column(
                          children: [
                            // snapshot.data!.records[index].answer==null?
                            //     Center(child: Text(LocaleKeys.We_will_answer_your_questions_as_soon_as_possible.tr(),)):
                              
                            
                        FadeInRight(
                        child: Column(
                        children: [
                          Row(
                          children: [
                          Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:NetworkImage(
                                    'http://eibtek2-001-site3.atempurl.com/Uploads/Users/${userData.read('Img')}'),),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Gap(15),
                        Container(

                          width: 210.h,
                          padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),
                          decoration: BoxDecoration(
                            color: Color(0xff22D27F),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(23.r),
                                topLeft: Radius.circular(23.r),
                                bottomRight: Radius.circular(23.r)),
                          ),
                          child: Center(
                            child: Text(
                              '${snapshot.data!.records[index].question}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                        ],
                      ),
                      Gap(8),
                          snapshot.data!.records[index].answer==null? Container():Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(

                                width: 220.h,

                                padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),

                                decoration: BoxDecoration(
                                  color: Color(0xff77b297),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(23.r),
                                      topLeft: Radius.circular(23.r),
                                      bottomLeft: Radius.circular(23.r)),
                                ),
                                child: Center(
                                  child: Text(
                                    '${snapshot.data!.records[index].answer}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                            // BuildQuestionScreen(text1:   '${snapshot.data!.records[index].question}',
                            //   text2:  '${snapshot.data!.records[index].answer}',),


                          ],
                        ),
                        separatorBuilder: (context,index)=>Gap(5.h),
                        itemCount: snapshot.data!.records.length,
                      ),
                    );
                  }else {
                    return Center(
                      child:  Text(LocaleKeys.We_will_answer_your_questions_as_soon_as_possible.tr())
                    );
                  }
                },

              ),
            )
          ],),
      ),
    );
  }
}
//668194