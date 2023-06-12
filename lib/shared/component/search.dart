  import 'package:dio/dio.dart';
  import 'package:easy_localization/easy_localization.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:gap/gap.dart';
  import 'package:hayat/core/utils/app_style.dart';
  import 'package:hayat/models/clinic_model.dart';
  import 'package:get/get_core/src/get_main.dart';
  import 'package:get/get_navigation/get_navigation.dart';
import 'package:hayat/models/search.dart';
import 'package:hayat/models/search_clinic.dart';
  import 'package:hayat/screens/book_doctors_screen.dart';
  import 'package:hayat/translations/locale_keys.g.dart';
  import 'package:url_launcher/url_launcher.dart';

  class ClinicSearch extends SearchDelegate {
    @override
    List<Widget>? buildActions(BuildContext context) {
      return [
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: Icon(Icons.close))
      ];
    }
    @override
    String get searchFieldLabel => "Search".tr();

    @override
    ThemeData appBarTheme(BuildContext context) {
      assert(context != null);
      final ThemeData theme = Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          toolbarHeight: 65.h,
          color: Styles.defualtColor,
          elevation: 0

        ),
        textSelectionTheme: TextSelectionThemeData(

            cursorColor: Colors.white,
            selectionColor: Colors.white,
            selectionHandleColor: Colors.white),

        inputDecorationTheme: InputDecorationTheme(


          hintStyle: TextStyle(
            color: Colors.white,
          ),
          isDense: true,
          contentPadding:
          EdgeInsets.fromLTRB(10.h, 5.h, 10.h, 7.h),
            enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: .5,
            color: Colors.white,
          ),
        ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: .5,
                color: Colors.white,
              ),
            ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
      );
      assert(theme != null);
      return theme;
    }

    @override
    Widget? buildLeading(BuildContext context) {
      return IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios));
    }

    Future<void> _launchUrl(String link) async {
      if (await launchUrl(Uri.parse(link))) {
        throw Exception('Could not launch  ');
      }
    }

    List data = [];
    List<SearchClinc> result = [];
    Future<List<SearchClinc>> fetchClinics({String? query}) async {
      String url = 'http://eibtek2-001-site3.atempurl.com/api/GetSearchClincs/${query}';
      final dio = Dio();
      Response response;
      response = await dio.get(url);
      try {
        if (response.statusCode == 200) {

          data = (response.data['Records']);

          result = data.map((clinicData) => SearchClinc.fromJson(clinicData)).toList();

          if (query != null) {
            result = result
                .where((element) =>
                query.toLowerCase().contains(query.toLowerCase()))
                .toList();          }
        } else {
          print('fail');
        }
      } on Exception catch (e) {
        print('e=${e}');
      }
      return result;
    }

    void clinicId({required dynamic id}) async {
      String url = 'http://eibtek2-001-site3.atempurl.com/api/GetclincbyId/${id}';
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
        print('response.data');
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

    @override
    Widget buildResults(BuildContext context) {
      return FutureBuilder<List<SearchClinc>?>(
        future: fetchClinics(query: query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SearchClinc>? item = snapshot.data;
            return SizedBox(
              height: 560.h,
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
                              height: 160.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: Colors.black54, width: .8.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13.w, vertical: 5.h),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
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
                                          height: 70.h,
                                          width: 70.h,
                                        ),
                                        Spacer(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${item[index].doctorName}',
                                              style: Styles.headLine1.copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Gap(3.h),
                                            Container(
                                              height: 60.h,
                                              width: 180.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                border: Border.all(
                                                    color: Colors.black38),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.w),
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    '${item[index].clinAddress}',
                                                    style: Styles.headLineGray1,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Spacer(
                                          flex: 3,
                                        ),
                                      ],
                                    ),
                                    Gap(8.h),
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
                                    //               color: Colors.yellow.shade300,
                                    //               size: 18.sp,
                                    //             ),
                                    //             Icon(
                                    //               Icons.star,
                                    //               color: Colors.yellow.shade300,
                                    //               size: 18.sp,
                                    //             ),
                                    //             Icon(
                                    //               Icons.star,
                                    //               color: Colors.yellow.shade300,
                                    //               size: 18.sp,
                                    //             ),
                                    //             Icon(
                                    //               Icons.star,
                                    //               color: Colors.yellow.shade300,
                                    //               size: 18.sp,
                                    //             ),
                                    //             Icon(
                                    //               Icons.star,
                                    //               color: Colors.yellow.shade300,
                                    //               size: 18.sp,
                                    //             ),
                                    //           ],
                                    //         )
                                    //       ],
                                    //     ),
                                    //     Text(
                                    //       '0 EPG',
                                    //       style: Styles.headLineGray1
                                    //           .copyWith(color: Color(0xff22D27F)),
                                    //     )
                                    //   ],
                                    // ),
                                    Gap(15.h),
                                    InkWell(
                                      onTap: () {
                                        Get.to(BookDoctorScreen(
                                          DistrictName: '${item[index].district!.districtName}',
                                          Majors: '${item[index].majors!.MajorName}',
                                          Price_After_Sale: '${item[index].priceAfterSale}',
                                          Price_Before_Sale: '${item[index].priceBeforeSale}', Sale: '${item[index].sale}',
                                          Scientific_Level: '${item[index].scientificLevel}' ,
                                          googleMapLInk: () {
                                            _launchUrl(
                                                'item[index].clinLocationLink}');
                                          },
                                          name: item[index].doctorName!,
                                          description:
                                              item[index].clinAddress,
                                          img:
                                              'http://eibtek2-001-site3.atempurl.com${item[index].clinNameImgUrl}',
                                          phone: item[index].clinPhone!,
                                          facebookLInk: () {
                                            _launchUrl(
                                                'item[index].clinFacebookLink}');
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
                                            _launchUrl('item[index].clinLink}');
                                          },
                                          id: item[index].id!,
                                        ));
                                        clinicId(id: item[index].id);
                                        print(item[index].id);
                                        print(
                                            'snapshot.data!.records![index].id');
                                      },
                                      child: Container(
                                        height: 25.h,
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                          color: Styles.buttomColor,
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Book".tr(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.5.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )
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
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Styles.defualtColor),
            ),
          );
        },
      );
    }

    @override
    Widget buildSuggestions(BuildContext context) {
      return Center(
        child: Text(
            LocaleKeys.Search_The_Name_Of_Clinic.tr(),
          style: TextStyle(
            color: Styles.defualtColor,
            fontWeight: FontWeight.w600
          ),
        ),
      );
    }
  }
