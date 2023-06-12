import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:gap/gap.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/answer_question.dart';
import 'package:hayat/screens/have_question_screen.dart';
import 'package:hayat/shared/component/component.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;
import 'package:hayat/models/Question_model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Future<QuestionsModel> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetAllQuestions'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode==200) {

      print(data);
      return QuestionsModel.fromJson(jsonDecode(response.body));
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
            LocaleKeys.Common_Questions.tr(),
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
           padding: EdgeInsets.symmetric(horizontal: 15.h),
           child: InkWell(
             onTap: (){
               Get.to(
                   HaveQuestionScreen()
               );
             },
             child: Container(
               height: 40.h,
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.r),
                 border: Border.all(color: Styles.defualtColor,width: .5.r)
               ),
               child: Center(
                 child: Text(
                   LocaleKeys.do_you_have_a_question.tr(),
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Styles.defualtColor,
                   ),
                 ),
               ),
             ),
           ),
         ),
            Gap(15),
            Padding(
           padding: EdgeInsets.symmetric(horizontal: 15.h),
           child: InkWell(
             onTap: (){
               Get.to(
                   AnswerQuestionScreen()
               );
             },
             child: Container(
               height: 40.h,
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.r),
                 border: Border.all(color: Styles.defualtColor,width: .5.r)
               ),
               child: Center(
                 child: Text(
                   LocaleKeys.Answer_your_questions.tr(),
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Styles.defualtColor,
                   ),
                 ),
               ),
             ),
           ),
         ),
            Gap(15),
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
                         BuildQuestionScreen(text1:   '${snapshot.data!.records![index].question}',
                           text2:  '${snapshot.data!.records![index].answer}',),


                       ],
                     ),
                     separatorBuilder: (context,index)=>Gap(5.h),
                     itemCount: snapshot.data!.records!.length,
                   ),
                 );
               }else {
                 return Center(
                   child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defualtColor),),
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