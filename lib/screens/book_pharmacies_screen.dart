import 'dart:async';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hayat/models/slider_model.dart';
import 'package:hayat/screens/compliant_done_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/translations/locale_keys.g.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class BookPharmaciesCenters extends StatefulWidget {
  String name;
  dynamic description;
  String img;
  String phone;
  String DistrictName;
  String Sale;

  int id;

  BookPharmaciesCenters({
    Key? key,
    required this.name,
    required this.id,
    required this.description,
    required this.img,
    required this.Sale,
    required this.DistrictName,
    required this.phone,
  }) : super(key: key);

  @override
  State<BookPharmaciesCenters> createState() => _BookPharmaciesCenters();
}

class _BookPharmaciesCenters extends State<BookPharmaciesCenters> {
  final userData = GetStorage();
  BookDoctorScreen() {
    _selectvalue = _kind[0];
  }

  void book({
    required String userName,
    required String phone,
    required String age,
    required String gender,
    required String code,
    required String img,
    required String AppointDate,
  }) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://eibtek2-001-site3.atempurl.com/api/Pharmacyappoint/${widget.id}'));
    request.fields.addAll({
      "Name": userName,
      "PhoneNumber": phone,
      "Age": age,
      "Gender": gender,
      "Code": code,
      "AppointDate": AppointDate
    });
    request.files.add(await http.MultipartFile.fromPath('Photo', img));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.offAll(ComplaintsDoneScreen());
    } else {
      print(response.reasonPhrase);
    }
  }

  static File? file;
  String? imag;
  ImagePicker image = ImagePicker();
  getGallery() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
      print(img.path);

      imag = img.path;
      userData.write('path', file);
    });
  }

  // void book(
  //     {
  //       required String userName,
  //       required String phone,
  //       required String age,
  //       required String gender,
  //       required String code,}) async {
  //
  //   String url = 'http://eibtek2-001-site3.atempurl.com/api/Pharmacyappoint/${widget.id}';
  //   final dio = Dio();
  //   Response response;
  //   response = await dio.post(url,
  //       data: {
  //
  //         "Name": userName,
  //         "PhoneNumber": phone,
  //         "Age": age,
  //         "Gender": gender,
  //         "Code": code
  //       },
  //       options: Options(headers: {
  //         'Content-Type': 'application/json',
  //       }));
  //   if (response.statusCode == 200) {
  //
  //     print(response.data);
  //     print(response.data['Message']);
  //     print(widget.id);
  //     Get.to(ComplaintsDoneScreen());
  //   } else {
  //     print('fail');
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
  // }
  Future<SliderModel> getDat() async {
    final response = await http.get(
        Uri.parse('http://eibtek2-001-site3.atempurl.com/api/GetAllSliders'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(data);
      return SliderModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  final userNameController = new TextEditingController();
  final PhoneNumberController = new TextEditingController();
  final AgeController = new TextEditingController();
  final CodeController = new TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    PhoneNumberController.dispose();
    AgeController.dispose();
    CodeController.dispose();
    super.dispose();
  }

  final _kind = [LocaleKeys.select.tr(),"Male".tr(), "Female".tr()];
  String? _selectvalue = LocaleKeys.select.tr();

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
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Text(
                            widget.name,
                            style: Styles.headLine1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Text(
                            widget.description,
                            textAlign: TextAlign.center,
                            style: Styles.headLineGray1,
                          ),
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

                    Divider(
                      thickness: .5,
                      color: Colors.grey.shade400,
                      height: 20.h,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: Row(
                        children: [
                          Icon(
                            FluentSystemIcons.ic_fluent_phone_filled,
                            color: Styles.IconColor,
                          ),
                          Gap(5.h),
                          // _launchUrl('tel://${widget.phone}');
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
                        height: 30.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade400, width: .5),
                            borderRadius: BorderRadius.circular(5.h)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 250.h,
                                  child: Text(
                                    '${LocaleKeys.Sale.tr()} ${widget.Sale}',
                                    style: Styles.headLineGray1,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Gap(30.h),
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
                Gap(30.h),
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
                Gap(20),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Raise the prescription".tr(),
                          style: Styles.headLine1.copyWith(fontSize: 16.sp),
                        ),
                      ],
                    )),
                Gap(25.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.h),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      file == null
                          ? CircleAvatar(
                              backgroundImage: AssetImage('assets/2345.png'),
                              radius: 45.r,
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(file!),
                              radius: 45.r,
                            ),
                      InkWell(
                        onTap: () {
                          getGallery();
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xff898A8F),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Styles.defualtColor2,
                            size: 14.sp,
                          ),
                          radius: 13.r,
                        ),
                      )
                    ],
                  ),
                ),
                Gap(25.h),
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
                          img: '${imag!}',
                          AppointDate:
                          '${DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now())}');
                    },
                    child: Text(
                      LocaleKeys.Send.tr(),
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
                // buildBottum(
                //     height: 43,
                //     width: 130,
                //     text: Text(
                //       LocaleKeys.Send.tr(),
                //       style: TextStyle(
                //           color: Styles.ScafoldColor2,
                //           fontSize: 17.sp,
                //           fontWeight: FontWeight.w600),
                //     ),
                //     onTap: () {
                //
                //       book(
                //         userName: '${userNameController.text.toString()}',
                //         phone: '${PhoneNumberController.text.toString()}',
                //         age: AgeController.text.toString(),
                //         code: '${CodeController.text.toString()}',
                //         gender: '${_selectvalue}',
                //         img: '${imag!}',
                //           AppointDate:
                //           '${DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now())}');
                //     },
                //     decoration: BoxDecoration(
                //       color: Styles.buttomColor,
                //       borderRadius: BorderRadius.circular(14),
                //     )),
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
