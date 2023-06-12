import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/majoirs_model.dart';
import 'package:hayat/models/medical_majoir_screen.dart';
import 'package:hayat/screens/Medical_center_element.dart';
import 'package:hayat/screens/clinic_element_discription.dart';
import 'package:hayat/screens/search_screen.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MedicalElement extends StatefulWidget {
  MedicalElement({Key? key}) : super(key: key);

  @override
  State<MedicalElement> createState() => _MedicalElementState();
}

class _MedicalElementState extends State<MedicalElement> {
  final userData =GetStorage();
  List data=[];
  List<MajorsMedicalModel> result=[];

  Future<List<MajorsMedicalModel>> getData( ) async {
    String url = 'http://eibtek2-001-site3.atempurl.com/api/GetAllCategories';
    final dio = Dio();
    Response response;
    response = await dio.get(url);
    try{
      if (response.statusCode == 200) {
        data = (response.data['Records']);
        print(data);


        result= data.map((clinicData) => MajorsMedicalModel.fromJson(clinicData)).toList();

      }else{
        print('fail');
      }
    }on Exception catch(e){
      print('e=${e}');
    }
    return result;
  }
  void clinicId2() async {
    String url = 'http://eibtek2-001-site3.atempurl.com/api/Getby_CategId/${userData.read('MedicalId')}';
    final dio = Dio();
    Response response;
    response = await dio.post(url,

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
              size: 25.sp,
            )),
        centerTitle: true,
        title: Text(
          LocaleKeys.Medical_Centers.tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.h,left: 15.h),
            child: InkWell(
                onTap: () {

                },
                child: Icon(
                  Icons.search,
                  color: Styles.defualtColor,
                  size: 25.sp,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(15.h),
            FutureBuilder<List<MajorsMedicalModel?>>(
              future: getData(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  List<MajorsMedicalModel?>? item = snapshot.data;
                  print(item);
                  return  Container(
                    height: 600.h,
                    padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 4.h),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: item!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 1.8,
                        crossAxisSpacing: 10.h,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Get.to( MedicalCenterElement(id: item[index]!.Id!, Name: '${item[index]!.MajorName}',));
                            print(item[index]!.Id);
                            userData.write('MedicalId', item[index]!.Id);


                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ClinicElementDescription()));
                          },
                          child: FadeInRight(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Color(0xff22D27F),
                              ),
                              child: Center(
                                child: Text(
                                  '${item[index]!.MajorName}',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.5.sp,

                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Styles.defualtColor),
                    ),
                  );
                }
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
