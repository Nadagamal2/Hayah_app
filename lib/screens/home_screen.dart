import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
 import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/contact_us_model.dart';
import 'package:hayat/models/slider_model.dart';
import 'package:hayat/screens/Medical_center_element.dart';
import 'package:hayat/screens/analysis_laboratory.dart';
import 'package:hayat/screens/clinic_element.dart';
import 'package:hayat/screens/clinic_element_discription.dart';
import 'package:hayat/screens/hospital_element.dart';
import 'package:hayat/screens/language_screen.dart';
import 'package:hayat/screens/medical_element_screen.dart';
import 'package:hayat/screens/pharmacies_element.dart';
import 'package:hayat/screens/x_ray_elelment.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<SliderModel> getData() async {
    final response = await http.get(Uri.parse(
        'http://eibtek2-001-site3.atempurl.com/api/GetAllSliders'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(data);
      return SliderModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
  Future<contactUsModel> getData2() async {
    final response = await http.get(
        Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetAllContactUs'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode==200) {

      print(response.body.length);
      return contactUsModel.fromJson(jsonDecode(response.body));
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
        leading: Container(
          padding: EdgeInsets.all(6.h),
          child: Center(
            child: Text(
                LocaleKeys.Hayat.tr(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(6.h),
            child: TextButton(
                onPressed: () {
                Get.to(LanguageScreen());
                },
                child: Text(
                  "Language".tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
      backgroundColor: Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [

            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    //height: 170,
                    width: double.infinity,

                    margin:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.h),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 145.h,
                        autoPlay: true,
                        viewportFraction: .9.h,

                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9.h,
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                        pauseAutoPlayOnTouch: true,
                        //enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 900),
                        //  viewportFraction: .8,
                      ),
                      items: snapshot.data!.records!
                          .map((e) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.h),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      'http://eibtek2-001-site3.atempurl.com${e.sliderImgUrl}',
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Styles.defualtColor),
                    ),
                  );
                }
              },
            ),
            Gap(20.h),
            Container(
              height: 260.h,
              padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 4.h),
              child: GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ClinicElement()));
                        Get.to(
                          () => ClinicElement(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/11.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Clinics".tr(),
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => MedicalElement(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(9.0.h),
                              child: Image(
                                image: AssetImage(
                                  'assets/22.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Medical Centers".tr(),
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => HospitalElement(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.5.h),
                              child: Image(
                                image: AssetImage(
                                  'assets/33.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Hospital".tr(),
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => PharmaciesElement(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.h),
                              child: Image(
                                image: AssetImage(
                                  'assets/44.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Pharmacies".tr(),
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => AnalysisLapElement(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 11.h),
                              child: Image(
                                image: AssetImage(
                                  'assets/55.png',
                                ),

                              ),
                            ),
                            Gap(5.h),
                            Text(
                              "Analysis Laboratory".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => XRayElement(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/wwww.png',

                              ),
                              height: 60.h,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "complexes".tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: .7.h,
                    crossAxisSpacing: 18.h,
                  )),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 40),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //               fit: BoxFit.cover,
            //               image: AssetImage(
            //                 'assets/print-171042142.jpg',
            //               )),
            //           // color: Styles.buttomColor,
            //           shape: BoxShape.circle,
            //         ),
            //         height: 70,
            //         width: 70,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(String link ) async {
    if (await launchUrl(Uri.parse(link))) {
      throw Exception('Could not launch  ');
    }
  }
}
//FutureBuilder(
//           future: getData2(),
//           builder: (context,snapshot){
//             if(snapshot.hasData){
//               return InkWell(
//                 onTap: (){
//                   _launchUrl('${snapshot.data!.records![0].whatsappLink}');
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(10.h),
//                   child: Image(
//
//                     image: AssetImage(
//                       'assets/whats.png',
//                     ),
//                   ),
//                 ),
//               );
//             }else{
//               return Padding(
//                 padding:
//                 EdgeInsets.all(10.h),
//                 child: Image(
//                   image: AssetImage(
//                     'assets/whats.png',
//                   ),
//                 ),
//               );
//             }
//           },
//         ),