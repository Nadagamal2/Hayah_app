 import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
 import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/x_raye_model.dart';
import 'package:hayat/screens/book_x_ray_screen.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class XRayElement extends StatefulWidget {
    XRayElement({Key? key}) : super(key: key);

  @override
  State<XRayElement> createState() => _XRayElementState();
}

class _XRayElementState extends State<XRayElement> {
  Future<List<XraysModel>> fetchXrays() async {
    const url = 'http://eibtek2-001-site3.atempurl.com/api/GetAllXrays';
    final dio = Dio();
    Response response;
    response = await dio.get(url);
    if (response.statusCode == 200) {
      List jsonData = (response.data['Records']);
      return jsonData.map((xraysData) => XraysModel.fromJson(xraysData)).toList();
    } else {
      throw Exception('Failed to load clinics');
    }
  }

  void xraysId({required dynamic id}) async   {
     String url = 'http://eibtek2-001-site3.atempurl.com/api/GetXraysbyId/${id}';
    final dio = Dio();
    Response response;
    response = await dio.post(url,
        data: {"id": id},
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Cookie':
          '.AspNetCore.Antiforgery.gOa3Bn9zkk4=CfDJ8NpUteykIA5KqXdr8-bJ3BQpmSUHvLAqZNk9LcNtI-cJpOVxNdHrOHQ3wyLZdqnPWK7rSSn4mn-silGygZiCDhI0lRHnPnW5YpZC62UwrGDzAKgt_eZR-QQgUZxsBBPn-450EEV6LM9sD3La7aIq_hI'
        }));
    if (response.statusCode == 200) {
      print(response.data);
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

  List<String> centers = [
    'smart life centers',
    'Dr/ whaleed Beauty center',
  ];

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
              size: 30,
            )),
        centerTitle: true,
        title: Text(
          "complexes".tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(11),
            FutureBuilder<List<XraysModel>?>(
              future: fetchXrays(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<XraysModel>? item = snapshot.data;
                  return SizedBox(
                    height: 580.h,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: item!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  Container(
                                    height: 180.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.black54, width: .8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13, vertical: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                                          'http://eibtek2-001-site3.atempurl.com${item[index].xrayNameImgUrl}',
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
                                                          'http://eibtek2-001-site3.atempurl.com${item[index].xrayNameImgUrl}',
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
                                                      '${item[index].xrayName}',
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: Styles.headLine1
                                                          .copyWith(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  Gap(3),
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

                                                          '${item[index].xrayAddress}',
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
                                          Gap(15.h),
                                          InkWell(
                                            onTap: () {


                                              Get.to(BookXRayCenters(

                                                name: item[index].xrayName!,
                                                description:
                                                item[index].xrayAddress,
                                                img:
                                                'http://eibtek2-001-site3.atempurl.com${item[index].xrayNameImgUrl}',
                                                phone: item[index].xrayPhone!,



                                                id: item[index].id!,
                                                DistrictName: '${item[index].district!.districtName}', Sale: '${item[index].sale}',


                                                // Sale: '${item[index].sale}',

                                              ));
                                              // clinicId2( );
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
                                                  LocaleKeys.Details.tr(), textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  )
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
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(LocaleKeys.No_Data.tr()),
                  );
                }
                return Center(
                  child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defualtColor),),
                );
              },
            ),
            // FutureBuilder(
            //   future: getData(),
            //    builder: (context,snapshot){
            //     if(snapshot.hasData){
            //       return SizedBox(
            //         height: 600.h,
            //         child: ListView.separated(
            //           itemCount: snapshot.data!.records!.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 15),
            //               child: Column(
            //                 children: [
            //                   Container(
            //                     height: 160,
            //                     width: double.infinity,
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10),
            //                       border: Border.all(color: Colors.black54, width: .8),
            //                     ),
            //                     child: Padding(
            //                       padding: const EdgeInsets.symmetric(
            //                           horizontal: 13, vertical: 10),
            //                       child: Column(
            //                         children: [
            //                           Row(
            //                             mainAxisAlignment: MainAxisAlignment.start,
            //                             crossAxisAlignment: CrossAxisAlignment.start,
            //                             children: [
            //                               Container(
            //                                 decoration: BoxDecoration(
            //                                   image: DecorationImage(
            //                                       opacity: 20,
            //                                       fit: BoxFit.cover,
            //                                       image: NetworkImage(
            //                                         'http://eibtekone-001-site11.atempurl.com${snapshot.data!.records![index].xrayNameImgUrl}',
            //
            //                                       )),
            //                                   // color: Styles.buttomColor,
            //                                   shape: BoxShape.circle,
            //                                 ),
            //                                 height: 70,
            //                                 width: 70,
            //                               ),
            //                               Spacer(
            //                                 flex: 2,
            //                               ),
            //                               Column(
            //                                 mainAxisAlignment: MainAxisAlignment.start,
            //                                 crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                                 children: [
            //                                   Text(
            //                                    '${snapshot.data!.records![index].xrayName}',
            //                                     style: Styles.headLine1.copyWith(
            //                                         fontSize: 15,
            //                                         fontWeight: FontWeight.w600),
            //                                   ),
            //                                   Gap(3),
            //                                   Container(
            //                                     height: 35,
            //                                     width: 180,
            //                                     decoration: BoxDecoration(
            //                                       borderRadius:
            //                                       BorderRadius.circular(8),
            //                                       border:
            //                                       Border.all(color: Colors.black38),
            //                                     ),
            //                                     child: Padding(
            //                                       padding: const EdgeInsets.symmetric(
            //                                           horizontal: 8),
            //                                       child: Align(
            //                                         alignment: Alignment.centerLeft,
            //                                         child: Text(
            //                                           '${snapshot.data!.records![index].xrayDescriprion}',
            //                                           style: Styles.headLineGray1,
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   )
            //                                 ],
            //                               ),
            //                               Spacer(
            //                                 flex: 1,
            //                               ),
            //                             ],
            //                           ),
            //                           Spacer(
            //                             flex: 20,
            //                           ),
            //                           InkWell(
            //                             onTap: (){
            //                               Get.to(()=>BookXRayCenters());
            //
            //                             },
            //                             child: Container(
            //                               height: 28,
            //                               width: 90,
            //                               decoration: BoxDecoration(
            //                                 color: Styles.buttomColor,
            //                                 borderRadius: BorderRadius.circular(12),
            //                               ),
            //                               child: Center(
            //                                 child: Text(
            //                                   'Book',
            //                                   style: TextStyle(
            //                                       color: Colors.white,
            //                                       fontSize: 15.5,
            //                                       fontWeight: FontWeight.w600),
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                           Spacer(),
            //                         ],
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             );
            //           },
            //           separatorBuilder: (BuildContext context, int index) {
            //             return Gap(20.h);
            //           },
            //         ),
            //       );
            //     }else {
            //       return Center(
            //         child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defualtColor),),
            //       );
            //     }
            //    },
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
