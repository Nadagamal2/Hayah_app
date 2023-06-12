import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/clinic_model.dart';
import 'package:hayat/models/filter_model.dart';
import 'package:hayat/models/major_id)model.dart';
import 'package:hayat/screens/book_doctors_screen.dart';
import 'package:hayat/screens/bottom.dart';

import 'package:hayat/screens/search_screen.dart';
import 'package:hayat/shared/component/search.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class FilterScreen extends StatefulWidget {
  int idcountry;
  int idDistrict;

  // String DoctorImg;
  // String DoctorAddress;

  FilterScreen({Key? key,
    required this.idcountry,
    required this. idDistrict,
    // required this.DoctorImg,
    // required this.DoctorAddress,


  }) : super(key: key);

  @override
  State<FilterScreen> createState() =>
      _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final userData =GetStorage();



  // Future<List<Clinic>> fetchClinics( ) async {
  //   String url = 'http://eibtek2-001-site3.atempurl.com/api/GetAllClincs';
  //   final dio = Dio();
  //   Response response;
  //   response = await dio.get(url);
  //  try{
  //    if (response.statusCode == 200) {
  //        data = (response.data['Records']);
  //        print(data);
  //
  //
  //      result= data.map((clinicData) => Clinic.fromJson(clinicData)).toList();
  //
  //    }else{
  //      print('fail');
  //    }
  //  }on Exception catch(e){
  //    print('e=${e}');
  //  }
  //   return result;
  // }
  // Future<List<MajorsIdModel>> clinicId2() async {
  //   String url = 'http://eibtek2-001-site3.atempurl.com/api/GetclincbyMajorId/${widget.id}';
  //   final dio = Dio();
  //   Response response;
  //   response = await dio.post(url);
  //
  //   try{
  //     if (response.statusCode == 200) {
  //       data = (response.data['Records']);
  //       print(data);
  //
  //
  //       result= data.map((clinicData) => MajorsIdModel.fromJson(clinicData)).toList();
  //
  //     }else{
  //       print('fail');
  //     }
  //   }on Exception catch(e){
  //     print('e=${e}');
  //   }
  //   return result;
  // }
  // // var headers = {
  // //   'Content-Type': 'application/json'
  // // };
  // // var request = http.Request('POST', Uri.parse('http://eibtekone-001-site11.atempurl.com/api/GetclincbyId'));
  // // request.body = json.encode({
  // //   "id":id
  // // });
  // // request.headers.addAll(headers);
  // //
  // //
  // // http.StreamedResponse response = await request.send();
  // //
  // // if (response.statusCode == 200) {
  // //    print(await response.stream.bytesToString());
  // //   Get.to(BookDoctorScreen(id: id, ));
  // //   print('id=${id}');
  // //
  // // }
  // // else {
  // //   print(response.reasonPhrase);
  // // }
  //
  // //
  // // void clinicId({required dynamic id}) async {
  // //   String url = 'http://eibtek2-001-site3.atempurl.com/api/GetclincbyId/${id}';
  // //   final dio = Dio();
  // //   Response response;
  // //   response = await dio.post(url,
  // //       data: {"id": id},
  // //       options: Options(headers: {
  // //         'Content-Type': 'application/json',
  // //         'Cookie':
  // //             '.AspNetCore.Antiforgery.gOa3Bn9zkk4=CfDJ8NpUteykIA5KqXdr8-bJ3BQpmSUHvLAqZNk9LcNtI-cJpOVxNdHrOHQ3wyLZdqnPWK7rSSn4mn-silGygZiCDhI0lRHnPnW5YpZC62UwrGDzAKgt_eZR-QQgUZxsBBPn-450EEV6LM9sD3La7aIq_hI'
  // //       }));
  // //   if (response.statusCode == 200) {
  // //     print('response.data');
  // //   } else {
  // //     print('fail');
  // //   }
  // //
  // //   // var headers = {
  // //   //   'Content-Type': 'application/json'
  // //   // };
  // //   // var request = http.Request('POST', Uri.parse('http://eibtekone-001-site11.atempurl.com/api/GetclincbyId'));
  // //   // request.body = json.encode({
  // //   //   "id":id
  // //   // });
  // //   // request.headers.addAll(headers);
  // //   //
  // //   //
  // //   // http.StreamedResponse response = await request.send();
  // //   //
  // //   // if (response.statusCode == 200) {
  // //   //    print(await response.stream.bytesToString());
  // //   //   Get.to(BookDoctorScreen(id: id, ));
  // //   //   print('id=${id}');
  // //   //
  // //   // }
  // //   // else {
  // //   //   print(response.reasonPhrase);
  // //   // }
  // // }
  //
  //
  //
  // // void clinicsId({required dynamic id}) async {
  // //   var headers = {
  // //     'Content-Type': 'application/json',
  // //     'Cookie':
  // //         '.AspNetCore.Antiforgery.gOa3Bn9zkk4=CfDJ8NpUteykIA5KqXdr8-bJ3BQpmSUHvLAqZNk9LcNtI-cJpOVxNdHrOHQ3wyLZdqnPWK7rSSn4mn-silGygZiCDhI0lRHnPnW5YpZC62UwrGDzAKgt_eZR-QQgUZxsBBPn-450EEV6LM9sD3La7aIq_hI'
  // //   };
  // //   var request = http.Request(
  // //       'POST',
  // //       Uri.parse(
  // //           'http://eibtekone-001-site11.atempurl.com/api/GetclincbyId/2'));
  // //   request.body = json.encode({"id": id});
  // //   request.headers.addAll(headers);
  // //
  // //   http.StreamedResponse response = await request.send();
  // //
  // //   if (response.statusCode == 200) {
  // //     Get.to(BookDoctorScreen());
  // //
  // //     print(await response.stream.bytesToString());
  // //   } else {
  // //     print(response.reasonPhrase);
  // //   }
  // //
  // //   // var headers = {
  // //   //   'Content-Type': 'application/json'
  // //   // };
  // //   // var request = http.Request('POST', Uri.parse('http://eibtekone-001-site11.atempurl.com/api/GetclincbyId'));
  // //   // request.body = json.encode({
  // //   //   "id":id
  // //   // });
  // //   // request.headers.addAll(headers);
  // //   //
  // //   //
  // //   // http.StreamedResponse response = await request.send();
  // //   //
  // //   // if (response.statusCode == 200) {
  // //   //    print(await response.stream.bytesToString());
  // //   //   Get.to(BookDoctorScreen(id: id, ));
  // //   //   print('id=${id}');
  // //   //
  // //   // }
  // //   // else {
  // //   //   print(response.reasonPhrase);
  // //   // }
  // // }
  List<filterModel> result=[];
  List data=[];
  Future<List<filterModel>> clinicId2() async {
    String url = 'http://eibtek2-001-site3.atempurl.com/api/FilterClincs';
    final dio = Dio();
    Response response;
    response = await dio.post(url,options: Options(
      headers: {'Content-Type': 'application/json'},

    ),data: {
      "CityId": userData.read('country'),
      "DistrictId": userData.read('District'),});

    try{
      if (response.statusCode == 200) {
        data = (response.data['Records']);
        print(data);


        result= data.map((clinicData) => filterModel.fromJson(clinicData)).toList();

      }else{
        print('fail');
      }
    }on Exception catch(e){
      print('e=${e}');
    }
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.h,
        elevation: 0,
        backgroundColor: Styles.defualtColor,
        leading: InkWell(
            onTap: () {
              Get.offAll(BottomNav());
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 30.sp,
            )),
        centerTitle: true,
        title: Text(
          LocaleKeys.Filter.tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Gap(10.h),
            FutureBuilder<List<filterModel>?>(
              future: clinicId2(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.error);
                  List<filterModel>? item = snapshot.data;
                  return SizedBox(
                    height: 570.h,
                    child: ListView.separated(
                      itemCount: item!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.h),
                              child: Column(
                                children: [
                                  Container(
                                    height: 180.h,

                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                          color: Colors.black54, width: .8.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
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

                                                                        image:  NetworkImage(
                                                                          'http://eibtek2-001-site3.atempurl.com${item[index].clinNameImgUrl}',
                                                                        ),
                                                                      )
                                                                  ),
                                                                )
                                                            ),
                                                          ),

                                                        ),

                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        opacity: 20,
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          'http://eibtek2-001-site3.atempurl.com${item[index].clinNameImgUrl}',
                                                        )),
                                                    // color: Styles.buttomColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  height: 75.h,
                                                  width: 75.h,
                                                ),
                                              ),
                                              Gap(10.h),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width:180.h,
                                                    child: Text(
                                                      '${item[index].doctorName}',
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: Styles.headLine1
                                                          .copyWith(
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  Gap(3.h),
                                                  Container(
                                                    padding: EdgeInsets.all(5.h),
                                                    height: 80.h,

                                                    width: 180.w,

                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                      border: Border.all(
                                                          color:
                                                          Colors.black38),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 8.w),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .center,
                                                        child: Text(

                                                          '${item[index].clinAddress}',
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.center,
                                                          style: Styles
                                                              .headLineGray1,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),

                                            ],
                                          ),
                                          //  Gap(8.h),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceBetween,
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     Column(
                                          //       children: [
                                          //         Text(
                                          //           '0 Rate',
                                          //           style: Styles.headLineGray1,
                                          //         ),
                                          //         Gap(8.h),
                                          //         Row(
                                          //           children: [
                                          //             Icon(
                                          //               Icons.star,
                                          //               color: Colors
                                          //                   .yellow.shade300,
                                          //               size: 18.sp,
                                          //             ),
                                          //             Icon(
                                          //               Icons.star,
                                          //               color: Colors
                                          //                   .yellow.shade300,
                                          //               size: 18.sp,
                                          //             ),
                                          //             Icon(
                                          //               Icons.star,
                                          //               color: Colors
                                          //                   .yellow.shade300,
                                          //               size: 18.sp,
                                          //             ),
                                          //             Icon(
                                          //               Icons.star,
                                          //               color: Colors
                                          //                   .yellow.shade300,
                                          //               size: 18.sp,
                                          //             ),
                                          //             Icon(
                                          //               Icons.star,
                                          //               color: Colors
                                          //                   .yellow.shade300,
                                          //               size: 18.sp,
                                          //             ),
                                          //           ],
                                          //         )
                                          //       ],
                                          //     ),
                                          //     Text(
                                          //       '0 EPG',
                                          //       style: Styles.headLineGray1
                                          //           .copyWith(
                                          //               color:
                                          //                   Color(0xff22D27F)),
                                          //     )
                                          //   ],
                                          // ),
                                          //   Gap(15.h),
                                          Gap(15.h),
                                          InkWell(
                                            onTap: () {
                                              Get.to(BookDoctorScreen(
                                                googleMapLInk: () {_launchUrl('item[index].clinLocationLink');  },
                                                name: item[index].doctorName!,
                                                description:
                                                item[index].clinAddress,
                                                img:
                                                'http://eibtek2-001-site3.atempurl.com${item[index].clinNameImgUrl}',
                                                phone: item[index].clinPhone!,
                                                facebookLInk: () {
                                                  _launchUrl(
                                                      'item[index].clinFacebookLink');
                                                },
                                                youtubeLInk: () {
                                                  _launchUrl(
                                                      'item[index].clinYoutubeLink}');
                                                },
                                                instaLInk: () {
                                                  _launchUrl(
                                                      'item[index].clinInstaLink}');
                                                },
                                                whatsLInk: () {
                                                  _launchUrl(
                                                      'item[index].clinWhatsappLink}');
                                                },
                                                locLInk: () {
                                                  _launchUrl(
                                                      'item[index].clinLink}');
                                                }, id: item[index].id!,
                                                DistrictName: '${item[index].district!.districtName}',
                                                Majors: '${item[index].majors!.MajorName}',
                                                Price_After_Sale: ' ',
                                                Price_Before_Sale: ' ', Sale: '${item[index].sale}',
                                                Scientific_Level: '${item[index].scientificLevel}' ,
                                              ));
                                              //clinicId2( );
                                              print(item[index].id);
                                              print(
                                                  'snapshot.data!.records![index].id');
                                            },
                                            child: Container(
                                              height: 30.h,
                                              width: 90.h,
                                              decoration: BoxDecoration(
                                                color: Styles.buttomColor,
                                                borderRadius:
                                                BorderRadius.circular(12.r),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  LocaleKeys.Details.tr(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  Gap(10.h)
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Gap(10.h);
                      },
                    ),
                  );
                } else if (snapshot.hasError)

                {
                  return Center(
                    child: Text(LocaleKeys.No_Data.tr()),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Styles.defualtColor),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String link) async {
    if (await launchUrl(Uri.parse(link))) {
      throw Exception('Could not launch  ');
    }
  }
}

