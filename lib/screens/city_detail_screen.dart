import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
 import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/models/city_model.dart';
 import 'package:hayat/shared/component/component.dart';
import 'package:http/http.dart' as http;

class CityDetailScreen extends StatefulWidget {
    CityDetailScreen({Key? key}) : super(key: key);

  @override
  State<CityDetailScreen> createState() => _CityDetailScreenState();
}

class _CityDetailScreenState extends State<CityDetailScreen> {
  Future<CityModel> getData() async {
    final response = await http.get(
        Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetAllCities'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode==200) {

      print(response.body.length);
      return CityModel.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.ScafoldColor2,
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
          "City".tr(),
          style: TextStyle(
            fontSize: 15.sp,
          ),
        ),
      ),
      body:
        SingleChildScrollView(
          child: FutureBuilder(
            future: getData(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Column(
                  children: [
                    Gap(15.h),
                    SizedBox(
                      height: 600.h,
                      child: ListView.builder(
                        itemCount: snapshot.data!.records!.length,
                        itemBuilder: (context,index)=>
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(

                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [

                                      InkWell(
                                        onTap: (){    },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.emoji_flags_rounded,color: Styles.IconColor,
                                                    size: 24,

                                                  ),
                                                  Gap(8),
                                                  Text('${snapshot.data!.records![index].cityName}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600,
                                                      )),


                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15),
                                              child: Divider(
                                                height: 10,

                                                thickness: .2,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      ),
                    ),




                  ],
                );
              }else {
                return Center(
                  child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Styles.defualtColor),),
                );
              }
            },
          ),
        )
    );
  }
}
