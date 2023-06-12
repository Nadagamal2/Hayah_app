import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:gap/gap.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:animate_do/animate_do.dart';
import 'package:hayat/models/center_model.dart';
import 'package:hayat/translations/locale_keys.g.dart';
 import 'package:http/http.dart' as http;


class CenterScreen extends StatefulWidget {
  CenterScreen({Key? key}) : super(key: key);

  @override
  State<CenterScreen> createState() => _CenterScreenState();
}

class _CenterScreenState extends State<CenterScreen> {
  Future<centerModel> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetAllMedcinfo'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode==200) {

      print(data);
      return centerModel.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load album');
    }
  }



@override
  void initState() {
     super.initState();


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        //     ),
        //   ),
        // ),
        title: Text(
          LocaleKeys.Hayat_capsule.tr(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
      ),
      backgroundColor: Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInRight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.h, vertical: 11.w),
                child: FutureBuilder(
                  future: getData(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return  SizedBox(
                        height: 520.h,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(right: 15.h,left: 15.h,bottom: 50.h),
                            itemBuilder: (context,index)=>Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsets.only(top: 22.h, right: 22.h, left: 22.h),
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Transform.rotate(
                                                angle: .9.sign,
                                                child: Container(
                                                  height: 48.h,
                                                  width: 48.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black54,
                                                        blurRadius: 2,
                                                        spreadRadius: .8,
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius.circular(13.r),
                                                    //     border: Border.all(color: Colors.red),
                                                    // color: Colors.white,
                                                  ),
                                                  child: Transform.rotate(
                                                    angle: -.099.sign,
                                                    child: Image(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(

                                                        'assets/WhatsApp_Image_2023-05-30_at_3.44.38_PM-removebg-preview.png',
                                                      ),
                                                      height: 100.h,
                                                      width: 100.h,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                           Gap(15.h),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width:190.h,
                                                  child: Text(
                                                    '${snapshot.data!.records![index].title}',
                                                   maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: Styles.headLine1.copyWith(

                                                        fontSize: 15.sp,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('yyyy-MM-dd').format(DateTime.parse('${snapshot.data!.records![index].date}'))}',
                                                  style: Styles.headLine1.copyWith(
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                                ),

                                              ],
                                            ),
                                            Spacer(
                                              flex: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(10.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                                        child: InkWell(
                                          onTap: (){
                                            showDialog(
                                              context: context,
                                              builder:(context)=>
                                                  Dialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10)),

                                                    child: Container(
                                                      height: 200.h,
                                                      width: 280.h,


                                                      child: InteractiveViewer(

                                                          clipBehavior: Clip.none,
                                                          child: Container(
                                                            width: double.infinity,


                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                image: DecorationImage(
                                                                  fit: BoxFit.fill,

                                                                  image: NetworkImage('http://eibtek2-001-site3.atempurl.com${snapshot.data!.records![index].imgUrl}'),

                                                                )
                                                            ),
                                                          )
                                                      ),
                                                    ),

                                                  ),

                                            );
                                          },
                                          child: Container(
                                            // height: 160.h,
                                            // width: double.infinity,
                                            // decoration: BoxDecoration(
                                            //   borderRadius: BorderRadius.circular(15.r),
                                            //   color: Colors.black,
                                            // ),
                                              child: Image(
                                                height: 180.h,
                                                image: NetworkImage('http://eibtek2-001-site3.atempurl.com${snapshot.data!.records![index].imgUrl}'),
                                              )
                                          ),
                                        ),
                                      ),
                                      Gap(5.h),
                                      Padding(
                                        padding:   EdgeInsets.symmetric(horizontal: 10.h),
                                        child: Text(
                                          '${snapshot.data!.records![index].description}',
                                          style: Styles.headLineGray2,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            separatorBuilder: (context,index)=>Gap(10.h),
                            itemCount: snapshot.data!.records!.length),
                      );
                    }else {
                      return Center(
                        child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defualtColor),),
                      );
                    }
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

}
