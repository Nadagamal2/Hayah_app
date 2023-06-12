import 'dart:async';
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
 import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/contact_us_model.dart';
import 'package:hayat/models/slider_model.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
   Future<SliderModel> getData2() async {
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

  Future<contactUsModel> getData() async {
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
  // Completer<GoogleMapController>_controller=Completer();
  // static final CameraPosition _initialCameraPosition=CameraPosition(
  //     target:  LatLng( 30.7911111,  30.9980556),
  //   zoom: 18.4746,
  //
  // );
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.h,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
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
          "Contact Us".tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getData(),
           builder: (context,snapshot){
            if(snapshot.hasData){
              return Column(
                children: [
                  Gap(5.h),
                  FutureBuilder(
                    future: getData2(),
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
                                  fit: BoxFit.cover,
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
                  Gap(18.h),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 30.h),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          height: 33.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(width: .8,color: Colors.black54,)
                          ),
                          child: Row(
                            children: [
                              Icon(FluentSystemIcons.ic_fluent_mail_regular,color: Styles.IconColor,),
                              Gap(10.h),
                              Text('${snapshot.data!.records![0].email}',style: Styles.headLineGray2.copyWith(fontSize: 14.sp),)
                            ],
                          ),
                        ),
                        Gap(12),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          height: 33.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(width: .8,color: Colors.black54,)
                          ),
                          child: Row(
                            children: [
                              Icon(FluentSystemIcons.ic_fluent_phone_filled,color: Styles.IconColor,),
                              Gap(10.h),
                              Text('${snapshot.data!.records![0].phone}',style: Styles.headLineGray2.copyWith(fontSize: 14.sp),)
                            ],
                          ),
                        ),
                        Gap(12),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          height: 33.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(width: .8,color: Colors.black54,)
                          ),
                          child: Row(
                            children: [
                              Icon(FluentSystemIcons.ic_fluent_location_regular,color: Styles.IconColor,),
                              Gap(10.h),
                              Text('${snapshot.data!.records![0].address}',style: Styles.headLineGray2.copyWith(fontSize: 14.sp),)
                            ],
                          ),
                        ),
                        Gap(12),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          height: 33.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(width: .8,color: Colors.black54,)
                          ),
                          child: Row(
                            children: [
                              Icon(FluentSystemIcons.ic_fluent_globe_location_regular,color: Styles.IconColor,),
                              Gap(10.h),
                              Text('${snapshot.data!.records![0].websiteLink}',style: Styles.headLineGray2.copyWith(fontSize: 14.sp),)
                            ],
                          ),
                        ),

                      ],

                    ),
                  ),
                  Gap(10.h),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 35.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FluentSystemIcons.ic_fluent_location_regular,color:Colors.grey.shade400,),
                        Gap(10.h),
                        Text('${snapshot.data!.records![0].address}',style: Styles.headLineGray1.copyWith(fontSize: 12.sp),)
                      ],
                    ),
                  ),
                  Gap(20.h),
                  // Padding(
                  //     padding:   EdgeInsets.symmetric(horizontal: 30.h),
                  //     child:Container(
                  //
                  //       height: 115.h,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15),
                  //
                  //       ),
                  //       foregroundDecoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15),
                  //
                  //       ),
                  //       child: FadeInRight(
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(15),
                  //
                  //           ),
                  //           // child: GoogleMap(
                  //           //   initialCameraPosition: _initialCameraPosition,
                  //           //   mapType:  MapType.normal,
                  //           //   onMapCreated: (GoogleMapController controller){
                  //           //     _controller.complete(controller);
                  //           //   },
                  //           // ),
                  //         ),
                  //       ),
                  //     )
                  // ),
                  // Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          _launchUrl('${snapshot.data!.records![0].facebookLink}');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(

                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/fff.png',
                                )),
                            // color: Styles.buttomColor,


                          ),
                          height: 40.h,
                          width: 40.w,
                        ),
                      ),
                      Gap(2.h),
                      InkWell(
                        onTap: (){ _launchUrl('${snapshot.data!.records![0].youtubeLink}');},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(

                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/yyy.png',
                                )),
                            // color: Styles.buttomColor,


                          ),
                          height: 40.h,
                          width: 40.w,
                        ),
                      ),
                      Gap(2.h),
                      InkWell(
                        onTap: (){ _launchUrl('${snapshot.data!.records![0].instaLink}');},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(

                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/ii.png',
                                )),
                            // color: Styles.buttomColor,


                          ),
                          height: 40.h,
                          width: 35.w,
                        ),
                      ),
                      Gap(2.h),
                      InkWell(
                        onTap: (){
                          _launchUrl('${snapshot.data!.records![0].whatsappLink}');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(

                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/ww.png',
                                )),
                            // color: Styles.buttomColor,


                          ),
                          height: 40.h,
                          width: 40.w,
                        ),
                      ),

                    ],
                  ),
                  Gap(5.h),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back".tr(),
                        style: Styles.headLineGray2.copyWith(fontSize: 15.sp),
                      )),

                ],
              );
            }else {
              return Center(
                child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defualtColor),),
              );
            }
           },
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
