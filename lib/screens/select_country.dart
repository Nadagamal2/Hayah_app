import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/city_model.dart';
import 'package:hayat/models/district_model.dart';
import 'package:hayat/screens/filter_screen.dart';
import 'package:hayat/screens/select_destrict.dart';
import 'package:http/http.dart' as http;
import 'package:hayat/translations/locale_keys.g.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {

  List  _country=[];
var country;


  Future  getData1()async{
    var response=await http.get(Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetAllCities'));
    if(response.statusCode==200){
      var jsonResponse= jsonDecode(response.body.toString());

      setState(() {
        _country=jsonResponse['Records'];

      });

      print('date222===   ${_country}');
      print('datewwww      ${jsonResponse['Records'][0]}');
    }


  }
  @override
  void initState() {
    super.initState();
    getData1();
  }
  // Future<DistrictModel?> getData2()async{
  //   var response=await http.post(Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetDistrict_ByCityId/${userData.read('country')}'));
  //   if(response.statusCode==200){
  //     var jsonResponse= jsonDecode(response.body.toString());
  //
  //     setState(() {
  //       _country2=jsonResponse['Records'];
  //     });
  //
  //     print('date           ${_country2}');
  //     print('datewwww               ${jsonResponse['Records'][0]}');
  //   }
  //   else {
  //     print('object');
  //   }
  //
  // }
  final userData =GetStorage();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.h,
        elevation: 0,
        backgroundColor: Styles.defualtColor,
        leading: InkWell(
            onTap: () {
              Get.back() ;
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
      body:Center(
        child:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text( LocaleKeys.Select_Country.tr(),),
              Gap(20.h),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 20.h),
                child: ElevatedButton(
                  child: DropdownButtonFormField(
                    hint: Text(LocaleKeys.Choose_Country.tr(),  style: TextStyle(
                      fontSize: 11.sp,
                    ), ),
                    value: country,
                    items:_country.map((e) {
                      return DropdownMenuItem<String>(
                          onTap: (){

                            print(e['Id']);
                            userData.write('country', e['Id']);
                            print(userData.read('country'));

                          },
                          value:e['CityName'].toString() ,
                          child: Text(e['CityName'].toString(),
                            style: TextStyle(
                              fontSize: 11.sp,
                            ), )

                      );
                    }).toList(),
                    onChanged:(val){
                      setState(() {
                        country=val;
                        print(country);
                        userData.write('nameCountry', country);
                        print(userData.read('nameCountry'));


                      });
                    },


                    icon: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ),
                    ),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF5F5F5),
                      filled: true,
                      floatingLabelBehavior:
                      FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.h,vertical: 12.h),
                      //EdgeInsets.fromLTRB(24.h, 10.h, 20.h, 0.h),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8.r),
                      ),

                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 43.h),
                    maximumSize:Size(double.infinity, 43.h) ,
                    minimumSize: Size(double.infinity, 43.h),

                    backgroundColor:Color(0xffF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ), onPressed: () {  },
                )
              ),
              Gap(20.h),
              Padding(
                padding:   EdgeInsets.symmetric(horizontal: 20.h),
                child: ElevatedButton(

                  onPressed: () {
                    Get.to( SelectDistrict());

                    print(userData.read('country'));
                  },
                  child: Text('next', style: TextStyle(
                    color: Styles.ScafoldColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),),
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
        )
      ) ,
    );
  }
}
