import 'dart:async';
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;

import 'package:hayat/models/slider_model.dart';
import 'package:hayat/screens/compliant_done_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDoctorScreen extends StatefulWidget {
  String name;
  dynamic description;
  String img;
  int id;
  String phone;
  String Scientific_Level;
  String DistrictName;
  String Price_Before_Sale;
  String Sale;
  String Price_After_Sale;
  String Majors;
  Function() facebookLInk;
  Function() youtubeLInk;
  Function() googleMapLInk;
  Function() instaLInk;
  Function() whatsLInk;
  Function() locLInk;
  // Function () locLInk;

  BookDoctorScreen({
    Key? key,
    required this.name,
    required this.id,
    required this.googleMapLInk,
    required this.description,
    required this.img,
    required this.phone,
    required this.facebookLInk,
    required this.youtubeLInk,
    required this.instaLInk,
    required this.whatsLInk,
    required this.locLInk,
    required this.DistrictName,
    required this.Majors,
    required this.Price_After_Sale,
    required this.Price_Before_Sale,
    required this.Sale,
    required this.Scientific_Level,
  }) : super(key: key);

  @override
  State<BookDoctorScreen> createState() => _BookDoctorScreenState();
}

class _BookDoctorScreenState extends State<BookDoctorScreen> {
  // void bookClinic(int id,String name,String phoneNumber ,int age,bool gender,int code, int clinicId)async{
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Cookie': '.AspNetCore.Antiforgery.gOa3Bn9zkk4=CfDJ8I0vIPrEE4BFkqIk6y6rtZUSWAStbFRmkWc658Wqij0K6DwypWdFu2GNag2f4YI-FYBnz6sS8P3rUAR9paOxPPKLmw2b19HWnRKKuDp15oIBLU1JF1vZ4OE0ofG9M4E00Hr-1EhQ5m-s4ytXXlqIRdc'
  //   };
  //   var request = http.Request('POST', Uri.parse('http://eibtekone-001-site11.atempurl.com/api/clincappoint'));
  //   request.body = json.encode({
  //     "Id": id,
  //     "Name":name,
  //     "PhoneNumber": phoneNumber,
  //     "Age": age,
  //     "Gender": gender,
  //     "Code": code,
  //     "Clinc_Id": clinicId
  //   });
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print('id=${id}');
  //     print(await response.stream.bytesToString());
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  // }
  // void clinicId ( int id  )async{
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Cookie': '.AspNetCore.Antiforgery.gOa3Bn9zkk4=CfDJ8NpUteykIA5KqXdr8-bJ3BQpmSUHvLAqZNk9LcNtI-cJpOVxNdHrOHQ3wyLZdqnPWK7rSSn4mn-silGygZiCDhI0lRHnPnW5YpZC62UwrGDzAKgt_eZR-QQgUZxsBBPn-450EEV6LM9sD3La7aIq_hI'
  //   };
  //   var request = http.Request('POST', Uri.parse('http://eibtekone-001-site11.atempurl.com/api/GetclincbyId/2'));
  //   request.body = json.encode({
  //     "id": id
  //   });
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //
  //     print('id=${id}');
  //     print(await response.stream.bytesToString());
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  //   // var headers = {
  //   //   'Content-Type': 'application/json'
  //   // };
  //   // var request = http.Request('POST', Uri.parse('http://eibtekone-001-site11.atempurl.com/api/GetclincbyId'));
  //   // request.body = json.encode({
  //   //   "id":id
  //   // });
  //   // request.headers.addAll(headers);
  //   //
  //   //
  //   // http.StreamedResponse response = await request.send();
  //   //
  //   // if (response.statusCode == 200) {
  //   //    print(await response.stream.bytesToString());
  //   //   Get.to(BookDoctorScreen(id: id, ));
  //   //   print('id=${id}');
  //   //
  //   // }
  //   // else {
  //   //   print(response.reasonPhrase);
  //   // }
  //
  // }
  // Future<List<Clinic>> fetchClinics() async {
  //   const url = 'http://eibtekone-001-site11.atempurl.com/api/GetAllClincs';
  //   final dio = Dio();
  //   Response
  //        response = await dio.get(url);
  //   if (response.statusCode == 200) {
  //     List jsonData = (response.data['records']);
  //     return jsonData.map((clinicData) => Clinic.fromJson(clinicData)).toList();
  //   } else {
  //     throw Exception('Failed to load clinics');
  //   }
  // }
  // Future<ClinicElementModel>clinic()async{
  //   final response=await http.post(Uri.parse('http://eibtekone-001-site11.atempurl.com/api/GetclincbyId/2'),
  //       headers: <String, String> {
  //       'Content-Type': 'application/json'
  //       },
  //       body:  jsonEncode(<String, dynamic>{
  //         'id': 2,
  //       },));
  //           if (response.statusCode == 200) {
  //       // If the server did return a 201 CREATED response,
  //       // then parse the JSON.
  //       return ClinicElementModel.fromJson(jsonDecode(response.body));
  //   } else {
  //   // If the server did not return a 201 CREATED response,
  //   // then throw an exception.
  //   throw Exception('Failed to create album.');
  //
  // }}
  // void clinicId ( )async{
  //   var headers = {
  //     'Content-Type': 'application/json'
  //   };
  //   var request = http.Request('POST', Uri.parse('http://eibtekone-001-site11.atempurl.com/api/GetclincbyId'));
  //   request.body = json.encode({
  //     "id": 1
  //   });
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  // }
  // Future<ClinicModel> getData() async {
  //   final response = await http.get(Uri.parse(
  //       'http://eibtekone-001-site11.atempurl.com/api/GetAllClincs'));
  //   var data = jsonDecode(response.body.toString());
  //
  //   if (response.statusCode == 200) {
  //     print(response.body.length);
  //     return ClinicModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }
  // Future<SliderModel> getData2() async {
  //   final response = await http.get(Uri.parse(
  //       'http://eibtekone-001-site11.atempurl.com/api/GetAllSliders'));
  //   var data = jsonDecode(response.body.toString());
  //
  //   if (response.statusCode == 200) {
  //     print(response.body.length);
  //     return SliderModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  void book({
    required String userName,
    required String phone,
    required String age,
    required String gender,
    required String code,
    required String AppointDate,
  }) async {
    String url =
        'http://eibtek2-001-site3.atempurl.com/api/clincappoint/${widget.id}';
    final dio = Dio();
    Response response;
    response = await dio.post(url,
        data: {
          "Name": userName,
          "PhoneNumber": phone,
          "Age": age,
          "Gender": gender,
          "Code": code,
          "AppointDate": AppointDate
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    if (response.statusCode == 200) {
      print(response.data);
      // print(response.data['Message']);
      // print(widget.id);
      Get.to(ComplaintsDoneScreen());
    } else {
      print('fail');
    }

    // var headers = {
    //   'Content-Type': 'application/json'
    // };
    // var request = http.Request('POST', Uri.parse('http://eibtekone-001-site11.atempurl.com/api/GetclincbyId'));
    // request.body = json.encode({
    //   "id":id
    // });
    // request.headers.addAll(headers);
    //
    //
    // http.StreamedResponse response = await request.send();
    //
    // if (response.statusCode == 200) {
    //    print(await response.stream.bytesToString());
    //   Get.to(BookDoctorScreen(id: id, ));
    //   print('id=${id}');
    //
    // }
    // else {
    //   print(response.reasonPhrase);
    // }
  }

  Future<SliderModel> getDat() async {
    final response = await http.get(
        Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetAllSliders'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      //print(data);
      return SliderModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  final userNameController = new TextEditingController();
  final PhoneNumberController = new TextEditingController();
  final AgeController = new TextEditingController();
  final CodeController = new TextEditingController();
  final _kind = [LocaleKeys.select.tr(),"Male".tr(), "Female".tr()];
  String? _selectvalue = LocaleKeys.select.tr();
  // Completer<GoogleMapController> _controller = Completer();
  // static final CameraPosition _initialCameraPosition = CameraPosition(
  //   target: LatLng(30.7911111, 30.9980556),
  //   zoom: 18.4746,
  // );
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              size: 30.sp,
            )),
        centerTitle: true,
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: getDat(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        //height: 170,
                        width: double.infinity,

                        margin: EdgeInsets.symmetric(
                            vertical: 17.h, horizontal: 15.h),
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
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 900),
                            //  viewportFraction: .8,
                          ),
                          items: snapshot.data!.records!
                              .map((e) => Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.h),
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
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Styles.defualtColor),
                        ),
                      );
                    }
                  },
                ),
                Gap(8.h),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
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
                                          image: NetworkImage(
                                            widget.img,
                                          ),
                                        )),
                                  )),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                widget.img,
                              )),
                          // color: Styles.buttomColor,
                          shape: BoxShape.circle,
                        ),
                        height: 90.h,
                        width: 90.w,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Column(
                        children: [
                          Text(
                            widget.name,
                            style: Styles.headLine1,
                          ),
                          Text(
                            widget.description,
                            style: Styles.headLineGray1,
                            textAlign: TextAlign.center,
                          ),
                          Gap(10.h),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.yellow.shade300,
                          //       size: 18.sp,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.yellow.shade300,
                          //       size: 18.sp,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.yellow.shade300,
                          //       size: 18.sp,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.yellow.shade300,
                          //       size: 18.sp,
                          //     ),
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.yellow.shade300,
                          //       size: 18.sp,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: .5,
                      color: Colors.grey.shade400,
                      height: 20.h,
                    ),

                    Gap(10.h),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 10.h),
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         FluentSystemIcons.ic_fluent_phone_filled,
                    //         color: Styles.IconColor,
                    //       ),
                    //       Gap(5.h),
                    //       Text(
                    //         '${snapshot.data!.records![0].clinPhone}',
                    //         style: Styles.headLineGray1,
                    //       )
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: Row(
                        children: [
                          Icon(
                            FluentSystemIcons.ic_fluent_phone_filled,
                            color: Styles.IconColor,
                          ),
                          Gap(5.h),
                          SizedBox(
                            width: 250.h,
                            child: Text(
                              widget.phone,
                              style: Styles.headLineGray1,
                            ),
                          )
                        ],
                      ),
                    ),

                    Gap(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: Row(
                        children: [
                          Icon(
                            FluentSystemIcons.ic_fluent_location_regular,
                            color: Styles.IconColor,
                          ),
                          Gap(5.h),
                          SizedBox(
                            width: 250.h,
                            child: Text(
                              widget.DistrictName,
                              style: Styles.headLineGray1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: .5,
                      color: Colors.grey.shade400,
                      height: 20.h,
                    ),
                    Gap(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Container(
                        width: double.infinity,
                        // padding: EdgeInsets.all(5.h),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade400, width: .5),
                            borderRadius: BorderRadius.circular(10.h)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 290.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${LocaleKeys.Scientific_Level.tr()}',
                                          textAlign: TextAlign.center,
                                          style: Styles.headLineGray1,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.h),
                                          child: Text(
                                            '${widget.Scientific_Level}',
                                            textAlign: TextAlign.center,
                                            style: Styles.headLineGray1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: .5,
                              color: Colors.grey.shade400,
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.h),
                              child: Row(
                                children: [
                                  Text(
                                    '${LocaleKeys.Major.tr()} ${widget.Majors}',
                                    style: Styles.headLineGray1,
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: .5,
                              color: Colors.grey.shade400,
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 280.h,
                                      child: Text(
                                        '${LocaleKeys.Sale.tr()} ${widget.Sale}',
                                        style: Styles.headLineGray1,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Gap(10.h),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 15.h),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           InkWell(
                    //             onTap:widget.facebookLInk,
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(5.r),
                    //                 image: DecorationImage(
                    //                     fit: BoxFit.cover,
                    //                     image: AssetImage(
                    //                       'assets/fff.png',
                    //                     )),
                    //                 // color: Styles.buttomColor,
                    //               ),
                    //               height: 35.h,
                    //               width: 35.w,
                    //             ),
                    //           ),
                    //           Gap(2.h),
                    //           InkWell(
                    //             onTap:widget.youtubeLInk,
                    //
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(5.r),
                    //                 image: DecorationImage(
                    //                     fit: BoxFit.cover,
                    //                     image: AssetImage(
                    //                       'assets/yyy.png',
                    //                     )),
                    //                 // color: Styles.buttomColor,
                    //               ),
                    //               height: 35.h,
                    //               width: 35.w,
                    //             ),
                    //           ),
                    //           Gap(2.h),
                    //           InkWell(
                    //             onTap:widget.instaLInk,
                    //
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(5.r),
                    //                 image: DecorationImage(
                    //                     fit: BoxFit.cover,
                    //                     image: AssetImage(
                    //                       'assets/ii.png',
                    //                     )),
                    //                 // color: Styles.buttomColor,
                    //               ),
                    //               height: 35.h,
                    //               width: 35.w,
                    //             ),
                    //           ),
                    //           Gap(2.h),
                    //           InkWell(
                    //             onTap:widget.whatsLInk,
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(5.r),
                    //                 image: DecorationImage(
                    //                     fit: BoxFit.cover,
                    //                     image: AssetImage(
                    //                       'assets/ww.png',
                    //                     )),
                    //                 // color: Styles.buttomColor,
                    //               ),
                    //               height: 35.h,
                    //               width: 35.w,
                    //             ),
                    //           ),
                    //           Gap(2.h),
                    //           InkWell(
                    //             onTap:widget.locLInk,
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(5),
                    //                 image: DecorationImage(
                    //                     fit: BoxFit.cover,
                    //                     image: AssetImage(
                    //                       'assets/gg.png',
                    //                     )),
                    //                 // color: Styles.buttomColor,
                    //               ),
                    //               height: 25.5.h,
                    //               width: 28.w,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                // Gap(30.h),
                // InkWell(
                //   onTap: widget.googleMapLInk,
                //   child: Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 30.h),
                //       child: Container(
                //         height: 115.h,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15.r),
                //         ),
                //         foregroundDecoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15.r),
                //         ),
                //         child: FadeInRight(
                //           child: Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(15.r),
                //
                //               ),
                //               child: Image(
                //                 image: AssetImage('assets/00.png'),
                //               )
                //           ),
                //         ),
                //       )),
                // ),
                // Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 30.h),
                //     child: Container(
                //       height: 115.h,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(15.r),
                //       ),
                //       foregroundDecoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(15.r),
                //       ),
                //       child: FadeInRight(
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(15.r),
                //           ),
                //           child: GoogleMap(
                //             initialCameraPosition: _initialCameraPosition,
                //             mapType: MapType.normal,
                //             onMapCreated: (GoogleMapController controller) {
                //               _controller.complete(controller);
                //             },
                //           ),
                //         ),
                //       ),
                //     )),
                Gap(10.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Patient Details".tr(),
                          style: Styles.headLine1.copyWith(fontSize: 16.sp),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.h),
                  child: Column(
                    children: [
                      Gap(25.h),
                      defaultFieldForm(
                        controller: userNameController,
                        padding: EdgeInsets.symmetric(vertical: 3),
                        Type: TextInputType.text,
                        prefix: FluentSystemIcons.ic_fluent_person_regular,
                        lable: "User Name".tr(),
                        hint: "User Name".tr(),
                      ),
                      Gap(18.h),
                      defaultFieldForm(
                          controller: PhoneNumberController,
                          padding: EdgeInsets.symmetric(vertical: 3),
                          Type: TextInputType.number,
                          prefix: FluentSystemIcons.ic_fluent_phone_filled,
                          lable: "phone Number".tr(),
                          hint: "phone Number".tr()),
                      Gap(18.h),
                      TextFormField(
                        controller: AgeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.h, 2.h, 20.h, 2.h),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          labelText: "age".tr(),
                          hintText: "age".tr(),
                          hintStyle: Styles.lable_Hint,
                          labelStyle: Styles.lable_Hint,
                        ),
                      ),
                      Gap(18.h),
                      DropdownButtonFormField(
                        value: _selectvalue,
                        items: _kind
                            .map((e) => DropdownMenuItem(
                                  child: Text(e,style: TextStyle(
                                      fontSize: 13.sp
                                  ),),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectvalue = val as String;
                          });
                        },
                        icon: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Styles.IconColor,
                          ),
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.h, 10.h, 20.h, 10.h),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: .5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Enter the code".tr(),
                          style: Styles.headLine1.copyWith(fontSize: 16.sp),
                        ),
                      ],
                    )),
                Gap(25.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.h),
                  child: Container(
                    height: 79.h,
                    margin: EdgeInsets.symmetric(horizontal: 20.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.h),
                    decoration: BoxDecoration(
                        border: Border.all(color: Styles.buttomColor),
                        borderRadius: BorderRadius.circular(7.r)),
                    child: Form(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        verifyTextField(context, width: 190.h),
                      ],
                    )),
                  ),
                ),
                Gap(18.h),
                SizedBox(
                 width:100.h,
                  height: 34.h,
                  child: ElevatedButton(
                    onPressed: () {
                      book(
                          userName: '${userNameController.text.toString()}',
                          phone: '${PhoneNumberController.text.toString()}',
                          age: AgeController.text.toString(),
                          code: '${CodeController.text.toString()}',
                          gender: '${_selectvalue}',
                          AppointDate:
                          '${DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now())}');
                    },
                    child: Text(
                      LocaleKeys.Book.tr(),
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

                Gap(50.h),
              ],
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     showDialog(
          //       context: context,
          //       builder: (context) => AlertDialog(
          //         title: Text('Take a Rate'),
          //         content: Column(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Text(
          //               'Please leave a star rating',
          //               style: TextStyle(
          //                 fontSize: 18,
          //               ),
          //             ),
          //             const SizedBox(
          //               height: 32,
          //             ),
          //             RatingBar.builder(
          //               minRating: 1,
          //               itemSize: 30,
          //               itemPadding: EdgeInsets.symmetric(horizontal: 2),
          //               itemBuilder: (context, _) => Icon(
          //                 Icons.star,
          //                 color: Colors.yellow.shade300,
          //                 size: 18.sp,
          //               ),
          //               updateOnDrag: true,
          //               onRatingUpdate: (rating) => setState(() {
          //                 this.rating = rating;
          //               }),
          //             )
          //           ],
          //         ),
          //         actions: [
          //           TextButton(
          //               onPressed: () {},
          //               child: Text(
          //                 'Ok',
          //                 style: TextStyle(
          //                   fontSize: 20,
          //                 ),
          //               ))
          //         ],
          //       ),
          //     );
          //   },
          //   child: Container(
          //     height: 50.h,
          //     decoration: BoxDecoration(color: Styles.defualtColor),
          //     child: Center(
          //       child: Text(
          //         'Leave a Rating',
          //         style: Styles.headLineGray1
          //             .copyWith(color: Colors.white, fontSize: 17.sp),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String link) async {
    if (await launchUrl(Uri.parse(link))) {
      throw Exception('Could not launch  ');
    }
  }

  Widget verifyTextField(
    context, {
    required double width,
    List<TextInputFormatter>? inputList,
    void Function(String)? onChanged,
  }) =>
      SizedBox(
        height: 45,
        width: width,
        child: TextFormField(
            controller: CodeController,
            cursorColor: Colors.grey.shade400,
            cursorHeight: 35,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Color(0xff898A8F),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Color(0xff898A8F)),
                borderRadius: BorderRadius.circular(6),
              ),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 3),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: Color(0xff898A8F)),
                borderRadius: BorderRadius.circular(6),
              ),
              hintStyle: Styles.lable_Hint,
              labelStyle: Styles.lable_Hint,
            ),
            onChanged: onChanged,
            //     (value) {
            //   if (value.length == 1) {
            //     FocusScope.of(context).nextFocus();
            //   }
            // },
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.center,
            inputFormatters: inputList),
      );
}

Widget defaultFieldForm({
  required TextInputType Type,
  required IconData prefix,
  required String lable,
  required String hint,
  required EdgeInsets? padding,
  String? Function(String?)? validator,
  String? Function(String?)? onChanged,
  TextEditingController? controller,
}) =>
    TextFormField(
      validator: validator,
      onChanged: onChanged,
      cursorColor: Colors.grey.shade400,
      keyboardType: Type,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: padding,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: .5),
          borderRadius: BorderRadius.circular(6),
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: .5),
          borderRadius: BorderRadius.circular(6),
        ),
        prefixIcon: Icon(
          prefix,
          size: 20,
          color: Styles.IconColor,
        ),
        labelText: lable,
        hintText: hint,
        hintStyle: Styles.lable_Hint,
        labelStyle: Styles.lable_Hint,
      ),
    );
Widget buildBottum({
  required double height,
  required double width,
  required Text text,
  required Function() onTap,
  EdgeInsetsGeometry? margin,
  required BoxDecoration? decoration,
}) =>
    Container(
      height: height,
      margin: margin,
      width: width,
      decoration: decoration,
      child: InkWell(
        child: Center(
          child: text,
        ),
        onTap: onTap,
      ),
    );
