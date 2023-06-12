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
import 'package:hayat/core/utils/evaluated_Buttom.dart';
import 'package:hayat/models/city_model.dart';
import 'package:hayat/models/district_model.dart';
import 'package:hayat/models/majoirs_model.dart';
import 'package:hayat/screens/clinic_element_discription.dart';
import 'package:hayat/screens/filter_screen.dart';
import 'package:hayat/screens/search_screen.dart';
import 'package:hayat/screens/select_country.dart';
import 'package:hayat/shared/component/search.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ClinicElement extends StatefulWidget {
  ClinicElement({Key? key}) : super(key: key);

  @override
  State<ClinicElement> createState() => _ClinicElementState();
}

class _ClinicElementState extends State<ClinicElement> {
  final userData =GetStorage();
  final _kind = ['Filter', "2","3", "4","5","6","7","8","9","10","11","12"];
  String? _selectvalue = 'Filter';
  BookDoctorScreen() {
    _selectvalue = _kind[0];
  }

  List data=[];
  List<MajorsModel> result=[];
  // Future<List<MajorsModel>> getData() async {
  //   final response = await http.get(Uri.parse(
  //       'http://eibtek2-001-site3.atempurl.com/api/GetAllMajors'));
  //   var data = jsonDecode(response.body.toString());
  //   // for(var element in data){
  //   //   termsAndConditions.add(TermsAndConditions.fromJson(element));
  //   //   print(element);
  //   // }
  //   if (response.statusCode == 200) {
  //
  //  //   print(response.body);
  //    // print(data);
  //     List jsonData = (data);
  //     return jsonData
  //         .map((categoryData) => MajorsModel.fromJson(categoryData))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }
  Future<List<MajorsModel>> getData( ) async {
    String url = 'http://eibtek2-001-site3.atempurl.com/api/GetAllMajors';
    final dio = Dio();
    Response response;
    response = await dio.get(url);
    try{
      if (response.statusCode == 200) {
        data = (response.data['Records']);
        print(data);


        result= data.map((clinicData) => MajorsModel.fromJson(clinicData)).toList();

      }else{
        print('fail');
      }
    }on Exception catch(e){
      print('e=${e}');
    }
    return result;
  }
  void clinicId2() async {
    String url = 'http://eibtek2-001-site3.atempurl.com/api/GetclincbyMajorId/${userData.read('clinicId')}';
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
  String url ='http://eibtek2-001-site3.atempurl.com/api/GetAllCities';
  var _country=[];
  String? country;
   var _country2=[];
  String? country2;

  Future<CityModel?> getData1()async{
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var jsonResponse= jsonDecode(response.body.toString());

      setState(() {
        _country=jsonResponse['Records'];
      });

      print('date222===   ${_country}');
      print('datewwww      ${jsonResponse['Records'][0]}');
    }

  }
  Future<DistrictModel?> getData2()async{
    var response=await http.post(Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetDistrict_ByCityId/${userData.read('country')}'));
    if(response.statusCode==200){
      var jsonResponse= jsonDecode(response.body.toString());

      setState(() {
        _country2=jsonResponse['Records'];
      });

      print('date           ${_country2}');
      print('datewwww               ${jsonResponse['Records'][0]}');
    }
    else {
      print('object');
    }

  }
  // Future<CountryModel?> getData2()async{
  //   var request = http.Request('GET', Uri.parse('http://saudi07-001-site2.itempurl.com/api/GetAll_Countries'));
  //
  //
  //   var streamedResponse  = await request.send();
  //   var response   = await http.Response.fromStream(streamedResponse);
  //   final result = jsonDecode(response .body) as Map<String, dynamic>;
  //
  //   if (response.statusCode == 200) {
  //     print(result['records']);
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  // }
  @override
  void initState() {
    super.initState();
    getData1();
    getData2();
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
          "Clinics".tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.h,left: 15.h),
            child: InkWell(
                onTap: () {
                   showSearch(context: context, delegate: ClinicSearch());


                },
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25.sp,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(15.h),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 90.h,
                    child: ElevatedButton(

                      onPressed: () {
                        // showModalBottomSheet(
                        //     context: context,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.vertical(
                        //         top: Radius.circular(20),
                        //       ),
                        //     ),
                        //     builder: (builder){
                        //       return new Container(
                        //         height: 200.h,
                        //         color: Colors.transparent,
                        //         padding: EdgeInsets.all(10.h),
                        //         //could change this to Color(0xFF737373),
                        //         //so you don't have to change MaterialApp canvasColor
                        //         child: new Container(
                        //             decoration: new BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius:   BorderRadius.only(
                        //                     topLeft:   Radius.circular(10.0),
                        //                     topRight:   Radius.circular(10.0))),
                        //             child: Column(
                        //               children: [
                        //                 Row(
                        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                   crossAxisAlignment: CrossAxisAlignment.center,
                        //                   children: [
                        //
                        //                     Column(
                        //                       children: [
                        //                         Text( LocaleKeys.Select_Country.tr(),),
                        //                         Gap(20.h),
                        //                         Row(
                        //                           children: [
                        //                             SizedBox(
                        //                               width: 130.h,
                        //                               child:DropdownButtonFormField(
                        //                                 hint: Text(LocaleKeys.Choose_Country.tr(),  style: TextStyle(
                        //                                   fontSize: 11.sp,
                        //                                 ), ),
                        //                                 value: country,
                        //                                 items:_country.map((e) {
                        //                                   return DropdownMenuItem<String>(
                        //                                       onTap: (){
                        //                                         print(e['Id']);
                        //                                         userData.write('country', e['Id']);
                        //                                         print(userData.read('country'));
                        //
                        //                                       },
                        //                                       value:e['CityName'] ,
                        //                                       child: Text(e['CityName'],
                        //                                         style: TextStyle(
                        //                                           fontSize: 11.sp,
                        //                                         ),)
                        //
                        //                                   );
                        //                                 }).toList(),
                        //                                 onChanged:(val){
                        //                                   setState(() {
                        //                                     country=val!;
                        //                                     print(country);
                        //                                     userData.write('nameCountry', country);
                        //                                     print(userData.read('nameCountry'));
                        //
                        //
                        //                                   });
                        //                                 },
                        //
                        //
                        //                                 icon: Align(
                        //                                   alignment: Alignment.center,
                        //                                   child: Icon(
                        //                                     Icons.keyboard_arrow_down_rounded,
                        //                                     color: Colors.transparent,
                        //                                   ),
                        //                                 ),
                        //                                 decoration: InputDecoration(
                        //                                   fillColor: Color(0xffF5F5F5),
                        //                                   filled: true,
                        //                                   floatingLabelBehavior:
                        //                                   FloatingLabelBehavior.never,
                        //                                   focusedBorder: OutlineInputBorder(
                        //                                     borderSide:
                        //                                     BorderSide(color: Colors.transparent),
                        //                                     borderRadius: BorderRadius.circular(8.r),
                        //                                   ),
                        //                                   border: OutlineInputBorder(),
                        //                                   isDense: true,
                        //                                   contentPadding:
                        //                                   EdgeInsets.symmetric(horizontal: 15.h,vertical: 8.h),
                        //                                   //EdgeInsets.fromLTRB(24.h, 10.h, 20.h, 0.h),
                        //                                   enabledBorder: OutlineInputBorder(
                        //                                     borderSide:
                        //                                     BorderSide(color: Colors.transparent),
                        //                                     borderRadius: BorderRadius.circular(8.r),
                        //                                   ),
                        //
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ],
                        //                     ),
                        //                     Column(
                        //                       children: [
                        //                         Text(LocaleKeys.Select_District.tr(),),
                        //                         Gap(20.h),
                        //                         Row(
                        //                           children: [
                        //                             SizedBox(
                        //                               width: 130.h,
                        //                               child:DropdownButtonFormField(
                        //                                 hint: Text(LocaleKeys.Choose_District.tr(),  style: TextStyle(
                        //                                   fontSize: 11.sp,
                        //                                 ), ),
                        //                                 value: country2,
                        //                                 items:_country2.map((e) {
                        //                                   return DropdownMenuItem<String>(
                        //                                       onTap: (){
                        //                                         print(e['Id']);
                        //                                         userData.write('District', e['Id']);
                        //                                         print(userData.read('District'));
                        //
                        //                                       },
                        //                                       value:e['DistrictName'] ,
                        //                                       child: Text(e['DistrictName'],
                        //                                         style: TextStyle(
                        //                                           fontSize: 11.sp,
                        //                                         ),)
                        //
                        //                                   );
                        //                                 }).toList(),
                        //                                 onChanged:(val){
                        //                                   setState(() {
                        //                                     country2=val!;
                        //                                     print(country2);
                        //                                     userData.write('nameCountry', country2);
                        //                                     print(userData.read('nameCountry'));
                        //
                        //
                        //                                   });
                        //                                 },
                        //
                        //
                        //                                 icon: Align(
                        //                                   alignment: Alignment.center,
                        //                                   child: Icon(
                        //                                     Icons.keyboard_arrow_down_rounded,
                        //                                     color: Colors.transparent,
                        //                                   ),
                        //                                 ),
                        //                                 decoration: InputDecoration(
                        //                                   fillColor: Color(0xffF5F5F5),
                        //                                   filled: true,
                        //                                   floatingLabelBehavior:
                        //                                   FloatingLabelBehavior.never,
                        //                                   focusedBorder: OutlineInputBorder(
                        //                                     borderSide:
                        //                                     BorderSide(color: Colors.transparent),
                        //                                     borderRadius: BorderRadius.circular(8.r),
                        //                                   ),
                        //                                   border: OutlineInputBorder(),
                        //                                   isDense: true,
                        //                                   contentPadding:
                        //                                   EdgeInsets.symmetric(horizontal: 15.h,vertical: 8.h),
                        //                                   //EdgeInsets.fromLTRB(24.h, 10.h, 20.h, 0.h),
                        //                                   enabledBorder: OutlineInputBorder(
                        //                                     borderSide:
                        //                                     BorderSide(color: Colors.transparent),
                        //                                     borderRadius: BorderRadius.circular(8.r),
                        //                                   ),
                        //
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ],
                        //                     ),
                        //
                        //
                        //
                        //
                        //                   ],
                        //                 ),
                        //                 Gap(20.h),
                        //                 Padding(
                        //                   padding:   EdgeInsets.symmetric(horizontal: 20.h),
                        //                   child: ElevatedButton(
                        //
                        //                     onPressed: () {
                        //                       Get.to(FilterScreen(idcountry: userData.read('country'), idDistrict: userData.read('District'),));
                        //                     },
                        //                     child: Text('next', style: TextStyle(
                        //                       color: Styles.ScafoldColor,
                        //                       fontSize: 16.sp,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),),
                        //                     style: ElevatedButton.styleFrom(
                        //                       fixedSize: Size(double.infinity, 43.h),
                        //                       maximumSize:Size(double.infinity, 43.h) ,
                        //                       minimumSize: Size(double.infinity, 43.h),
                        //
                        //                       backgroundColor: Styles.defualtColor,
                        //                       shape: RoundedRectangleBorder(
                        //                         borderRadius: BorderRadius.circular(6.r),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             )),
                        //       );
                        //     }
                        // );
                        Get.to(SelectCountry());
                        getData1();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(LocaleKeys.Filter.tr(), style: TextStyle(
                            color: Styles.ScafoldColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),

                          ),
                          Icon(Icons.arrow_drop_down_sharp,color: Styles.ScafoldColor,)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.infinity, 43.h),
                        maximumSize:Size(double.infinity, 43.h) ,
                        minimumSize: Size(double.infinity, 43.h),

                        backgroundColor: Styles.defualtColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(15.h),
            FutureBuilder<List<MajorsModel?>>(
              future: getData(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  List<MajorsModel?>? item = snapshot.data;
                  print(item);
                  return  Container(
                    height: 510.h,
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
                            Get.to( ClinicElementDescription(id: item[index]!.Id!, Name: '${item[index]!.MajorName}',));
                            print(item[index]!.Id);
                            userData.write('clinicId', item[index]!.Id);


                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ClinicElementDescription()));
                          },
                          child: FadeInRight(
                            child: Container(
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
            Gap(20.h),
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
