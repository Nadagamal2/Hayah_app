// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:fluentui_icons/fluentui_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:hayat/core/utils/app_style.dart';
// import 'package:hayat/models/clinic_model.dart';
// import 'package:hayat/models/search.dart';
// import 'package:http/http.dart' as http;
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   final searchController=TextEditingController();
//   Future<List<Clinic>> fetchClinics() async {
//     const url = 'http://eibtekone-001-site11.atempurl.com/api/GetAllClincs';
//     final dio = Dio();
//     Response response;
//     response = await dio.get(url);
//     if (response.statusCode == 200) {
//       List jsonData = (response.data['records']);
//       return jsonData.map((clinicData) => Clinic.fromJson(clinicData)).toList();
//     } else {
//       throw Exception('Failed to load clinics');
//     }
//   }
//   Future<List<Search>> fetchsearch(String search) async {
//     const url = 'http://eibtekone-001-site11.atempurl.com/api/GetSearchClincs/عياده 1';
//     final dio = Dio();
//     Response response;
//     response = await dio.get(url);
//     if (response.statusCode == 200) {
//       List jsonData = (response.data['records']);
//       if(search!=null){
//
//       }
//       return jsonData.map((clinicData) => Search.fromJson(clinicData)).toList();
//     } else {
//       throw Exception('Failed to load clinics');
//     }
//   }
//   var data=[];
//   List<Search>result=[];
//   String url2 = 'http://eibtekone-001-site11.atempurl.com/api/GetSearchClincs/عياده 1';
//   Future<List<Search>?> fetchsearch2({String? query}) async {
//      var url =  Uri.parse(url2);
//      var response=await http.get(url);
//      try{
//        if(response.statusCode==200){
//          data=json.decode(response.body);
//          result=data.map((e) => Search.fromJson(e)).toList();
//          if(query!=null){
//            result=result.where((element) => element.records[0].clinName.toLowerCase().contains(query.toLowerCase()) ).toList();
//          }
//        }else{
//          print('fail');
//        }
//      }on Exception catch(e){
//        print('e=${e}');
//      }
//
//   }
//
//   // SearchScreen() {
//   //   _selectvalueCity = _itemsCity[0];
//   //   _selectvalueDepartment=_itemsDepartment[0];
//   //   _selectvalueMaster=_itemsMaster[0];
//   //   _selectvalueSort=_itemsSort[0];
//   // }
//   //
//   //
//   //
//   // final _itemsCity = ['طنطا',  'المحله الكبري',  'بسيون', 'كفر الزيات'];
//   // final _itemsDepartment = ['Dental',  'oncology',  'Blood vessels', 'internal diseases'];
//   // final _itemsMaster = ['Advisor',  'PHD',  'Professor', 'Master'];
//   // final _itemsSort = ['Low to High', 'High to Low'];
//   // String? _selectvalueCity = 'طنطا';
//   // String? _selectvalueSort = 'Low to High';
//   // String? _selectvalueDepartment = 'Dental';
//   // String? _selectvalueMaster= 'Advisor';
//
//   @override
//   Widget build(BuildContext context) {
//     String? query;
//     return Scaffold(
//
//       appBar: AppBar(
//         toolbarHeight: 65.h,
//         elevation: 0,
//         backgroundColor: Styles.defualtColor,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios_rounded,
//               color: Colors.white,
//               size: 25.sp,
//             )),
//         centerTitle: true,
//         title: Text(
//           "Search".tr(),
//           style: TextStyle(
//             fontSize: 15.sp,
//           ),
//         ),
//       ),
//       backgroundColor: Color(0xffFfFfFf),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(13.h),
//               child:  Padding(
//                 padding: EdgeInsets.all(10.h),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: searchController,
//                       cursorColor: Colors.grey.shade400,
//                       keyboardType: TextInputType.text,
//                       cursorHeight: 25.h,
//                       onChanged: (String val){
//                         val=query!;
//                       },
//
//                       decoration: InputDecoration(
//                         fillColor: Color(0xffF5F5F5),
//                         filled: true,
//                         floatingLabelBehavior:
//                         FloatingLabelBehavior.never,
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Colors.transparent),
//                           borderRadius: BorderRadius.circular(12.r),
//                         ),
//                         border: OutlineInputBorder(),
//                         isDense: true,
//                         contentPadding:
//                         EdgeInsets.fromLTRB(25.h, 2.h, 25.h, 2.h),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Colors.transparent),
//                           borderRadius: BorderRadius.circular(12.r),
//                         ),
//                         prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,),
//                         labelText:  "Search".tr(),
//                         hintText:  "Search".tr(),
//                         hintStyle: Styles.lable_Hint,
//                         labelStyle: Styles.lable_Hint,
//                       ),
//                     ),
//                     Gap(20.h),
//                     FutureBuilder<List<Search>?>(
//                       future: fetchsearch2(query: query),
//                       builder: (context, snapshot) {
//                         var data =snapshot.data;
//                         if (snapshot.hasData) {
//                         //  List<Search>? item = snapshot.data;
//                           return SizedBox(
//                             height: 500.h,
//                             child: ListView.separated(
//                               itemCount:data!.length,
//                               itemBuilder: (context, index) {
//                                 return Column(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 0.h),
//                                       child: Column(
//                                         children: [
//                                           Container(
//                                             height: 195.h,
//                                             width: double.infinity,
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(10.r),
//                                               border: Border.all(
//                                                   color: Colors.black54, width: .8.r),
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 13.w, vertical: 5.h),
//                                               child: Column(
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Container(
//                                                         decoration: BoxDecoration(
//                                                           image: DecorationImage(
//                                                               opacity: 20,
//                                                               fit: BoxFit.cover,
//                                                               image: NetworkImage(
//                                                                 'http://eibtekone-001-site11.atempurl.com${data[index].records[0].clinNameImgUrl}',
//                                                               )),
//                                                           // color: Styles.buttomColor,
//                                                           shape: BoxShape.circle,
//                                                         ),
//                                                         height: 70.h,
//                                                         width: 70.h,
//                                                       ),
//                                                       Spacer(),
//                                                       Column(
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                         crossAxisAlignment:
//                                                         CrossAxisAlignment.start,
//                                                         children: [
//                                                           Text(
//                                                             '${data[index].records[0].clinName}',
//                                                             style: Styles.headLine1
//                                                                 .copyWith(
//                                                                 fontSize: 15.sp,
//                                                                 fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                           ),
//                                                           Gap(3.h),
//                                                           Container(
//                                                             height: 60.h,
//                                                             width: 180.w,
//                                                             decoration: BoxDecoration(
//                                                               borderRadius:
//                                                               BorderRadius.circular(
//                                                                   8.r),
//                                                               border: Border.all(
//                                                                   color:
//                                                                   Colors.black38),
//                                                             ),
//                                                             child: Padding(
//                                                               padding:
//                                                               EdgeInsets.symmetric(
//                                                                   horizontal: 8.w),
//                                                               child: Align(
//                                                                 alignment: Alignment
//                                                                     .centerLeft,
//                                                                 child: Text(
//                                                                   '${data[index].records[0].clinDescriprion}',
//                                                                   style: Styles
//                                                                       .headLineGray1,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           )
//                                                         ],
//                                                       ),
//                                                       Spacer(
//                                                         flex: 3,
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Gap(8.h),
//                                                   Row(
//                                                     mainAxisAlignment:
//                                                     MainAxisAlignment.spaceBetween,
//                                                     crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                     children: [
//                                                       Column(
//                                                         children: [
//                                                           Text(
//                                                             '0 Rate',
//                                                             style: Styles.headLineGray1,
//                                                           ),
//                                                           Gap(8.h),
//                                                           Row(
//                                                             children: [
//                                                               Icon(
//                                                                 Icons.star,
//                                                                 color: Colors
//                                                                     .yellow.shade300,
//                                                                 size: 18.sp,
//                                                               ),
//                                                               Icon(
//                                                                 Icons.star,
//                                                                 color: Colors
//                                                                     .yellow.shade300,
//                                                                 size: 18.sp,
//                                                               ),
//                                                               Icon(
//                                                                 Icons.star,
//                                                                 color: Colors
//                                                                     .yellow.shade300,
//                                                                 size: 18.sp,
//                                                               ),
//                                                               Icon(
//                                                                 Icons.star,
//                                                                 color: Colors
//                                                                     .yellow.shade300,
//                                                                 size: 18.sp,
//                                                               ),
//                                                               Icon(
//                                                                 Icons.star,
//                                                                 color: Colors
//                                                                     .yellow.shade300,
//                                                                 size: 18.sp,
//                                                               ),
//                                                             ],
//                                                           )
//                                                         ],
//                                                       ),
//                                                       Text(
//                                                         '0 EPG',
//                                                         style: Styles.headLineGray1
//                                                             .copyWith(
//                                                             color:
//                                                             Color(0xff22D27F)),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   Gap(15.h),
//                                                   InkWell(
//                                                     onTap: () {
//                                                       // Get.to(BookDoctorScreen(
//                                                       //   googleMapLInk: () {_launchUrl('${item[index].clinLocationLink}');  },
//                                                       //   name: item[index].clinName!,
//                                                       //   description:
//                                                       //   item[index].clinDescription,
//                                                       //   img:
//                                                       //   'http://eibtekone-001-site11.atempurl.com${item[index].clinNameImgUrl}',
//                                                       //   phone: item[index].clinPhone!,
//                                                       //   facebookLInk: () {
//                                                       //     _launchUrl(
//                                                       //         '${item[index].clinFacebookLink}');
//                                                       //   },
//                                                       //   youtubeLInk: () {
//                                                       //     _launchUrl(
//                                                       //         '${item[index].clinYoutubeLink}');
//                                                       //   },
//                                                       //   instaLInk: () {
//                                                       //     _launchUrl(
//                                                       //         '${item[index].clinInstaLink}');
//                                                       //   },
//                                                       //   whatsLInk: () {
//                                                       //     _launchUrl(
//                                                       //         '${item[index].clinWhatsappLink}');
//                                                       //   },
//                                                       //   locLInk: () {
//                                                       //     _launchUrl(
//                                                       //         '${item[index].clinLink}');
//                                                       //   }, id: item[index].id! ,
//                                                       // ));
//                                                       // clinicId(id: item[index].id);
//                                                       // print(item[index].id);
//                                                       // print(
//                                                       //     'snapshot.data!.records![index].id');
//                                                     },
//                                                     child: Container(
//                                                       height: 25.h,
//                                                       width: 90.w,
//                                                       decoration: BoxDecoration(
//                                                         color: Styles.buttomColor,
//                                                         borderRadius:
//                                                         BorderRadius.circular(12.r),
//                                                       ),
//                                                       child: Align(
//                                                         alignment: Alignment.center,
//                                                         child: Text(
//                                                           'Book',
//                                                           style: TextStyle(
//                                                               color: Colors.white,
//                                                               fontSize: 15.5.sp,
//                                                               fontWeight:
//                                                               FontWeight.w600),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 );
//                               },
//                               separatorBuilder: (BuildContext context, int index) {
//                                 return Gap(10.h);
//                               },
//                             ),
//                           );
//                         } else if (snapshot.hasError) {
//                           return Center(
//                             child: Text('Error'),
//                           );
//                         }
//                         return Center(
//                           child: CircularProgressIndicator(
//                             valueColor:
//                             AlwaysStoppedAnimation<Color>(Styles.defualtColor),
//                           ),
//                         );
//                       },
//                     ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Spacer(
//                     //       flex: 3,
//                     //     ),
//                     //     Container(
//                     //       height: 22.h,
//                     //       width: 39.w,
//                     //       decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.circular(8.r),
//                     //         border: Border.all(color: Colors.black54),
//                     //       ),
//                     //       child: Row(
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Spacer(),
//                     //           Text(
//                     //             '1',
//                     //             style: TextStyle(fontSize: 11.sp),
//                     //           ),
//                     //           Spacer(),
//                     //           Icon(
//                     //             Icons.star_border_outlined,
//                     //             color: Colors.grey.shade300,
//                     //             size: 19.sp,
//                     //           ),
//                     //           Spacer(),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Spacer(),
//                     //     Container(
//                     //       height: 22.h,
//                     //       width: 39.w,
//                     //       decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.circular(8.r),
//                     //         border: Border.all(color: Colors.black54),
//                     //       ),
//                     //       child: Row(
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Spacer(),
//                     //           Text(
//                     //             '2',
//                     //             style: TextStyle(fontSize: 11.sp),
//                     //           ),
//                     //           Spacer(),
//                     //           Icon(
//                     //             Icons.star_border_outlined,
//                     //             color: Colors.grey.shade300,
//                     //             size: 19.sp,
//                     //           ),
//                     //           Spacer(),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Spacer(),
//                     //     Container(
//                     //       height: 22.h,
//                     //       width: 39.w,
//                     //       decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.circular(8.r),
//                     //         border: Border.all(color: Colors.black54),
//                     //       ),
//                     //       child: Row(
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Spacer(),
//                     //           Text(
//                     //             '3',
//                     //             style: TextStyle(fontSize: 11.sp),
//                     //           ),
//                     //           Spacer(),
//                     //           Icon(
//                     //             Icons.star_border_outlined,
//                     //             color: Colors.grey.shade300,
//                     //             size: 19.sp,
//                     //           ),
//                     //           Spacer(),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Spacer(),
//                     //     Container(
//                     //       height: 22.h,
//                     //       width: 39.w,
//                     //       decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.circular(8.r),
//                     //         border: Border.all(color: Colors.black54),
//                     //       ),
//                     //       child: Row(
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Spacer(),
//                     //           Text(
//                     //             '4',
//                     //             style: TextStyle(fontSize: 11.sp),
//                     //           ),
//                     //           Spacer(),
//                     //           Icon(
//                     //             Icons.star_border_outlined,
//                     //             color: Colors.grey.shade300,
//                     //             size: 19.sp,
//                     //           ),
//                     //           Spacer(),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Spacer(),
//                     //     Container(
//                     //       height: 22.h,
//                     //       width: 39.w,
//                     //       decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.circular(8.r),
//                     //         border: Border.all(color: Colors.black54),
//                     //       ),
//                     //       child: Row(
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Spacer(),
//                     //           Text(
//                     //             '5',
//                     //             style: TextStyle(fontSize: 11.sp),
//                     //           ),
//                     //           Spacer(),
//                     //           Icon(
//                     //             Icons.star_border_outlined,
//                     //             color: Colors.grey.shade300,
//                     //             size: 19.sp,
//                     //           ),
//                     //           Spacer(),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Spacer(
//                     //       flex: 3,
//                     //     ),
//                     //   ],
//                     // ),
//                     // Gap(10.h),
//                     // Padding(
//                     //   padding: EdgeInsets.symmetric(horizontal: 10.w),
//                     //   child: Column(
//                     //     children: [
//                     //       Row(
//                     //         children: [
//                     //           Icon(
//                     //             FluentSystemIcons.ic_fluent_location_regular,
//                     //             size: 24.sp,
//                     //             color: Styles.IconColor,
//                     //           ),
//                     //           Gap(15.h),
//                     //           Text(
//                     //             'City',
//                     //             style: TextStyle(
//                     //                 fontWeight: FontWeight.w600,
//                     //                 fontSize: 13.sp),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //       Gap(5.h),
//                     //
//                     //
//                     //       DropdownButtonFormField(
//                     //         value: _selectvalueCity,
//                     //         items: _itemsCity
//                     //             .map((e) => DropdownMenuItem(
//                     //                   child: Text(e),
//                     //                   value: e,
//                     //                 ))
//                     //             .toList(),
//                     //         onChanged: (val) {
//                     //           setState(() {
//                     //             _selectvalueCity = val as String;
//                     //           });
//                     //         },
//                     //         icon: Align(
//                     //           alignment: Alignment.center,
//                     //           child: Icon(
//                     //             Icons.keyboard_arrow_down_rounded,
//                     //             color: Styles.IconColor,
//                     //           ),
//                     //         ),
//                     //         decoration: InputDecoration(
//                     //           fillColor: Color(0xffF5F5F5),
//                     //           filled: true,
//                     //           floatingLabelBehavior:
//                     //           FloatingLabelBehavior.never,
//                     //           focusedBorder: OutlineInputBorder(
//                     //             borderSide:
//                     //             BorderSide(color: Colors.transparent),
//                     //             borderRadius: BorderRadius.circular(12.r),
//                     //           ),
//                     //           border: OutlineInputBorder(),
//                     //           isDense: true,
//                     //           contentPadding:
//                     //               EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                     //           //EdgeInsets.fromLTRB(24.h, 10.h, 20.h, 0.h),
//                     //           enabledBorder: OutlineInputBorder(
//                     //             borderSide:
//                     //             BorderSide(color: Colors.transparent),
//                     //             borderRadius: BorderRadius.circular(12.r),
//                     //           ),
//                     //           labelText: 'Search',
//                     //           hintText: 'Search',
//                     //           hintStyle: Styles.lable_Hint,
//                     //           labelStyle: Styles.lable_Hint,
//                     //         ),
//                     //       ),
//                     //       // Container(
//                     //       //   height: 40,
//                     //       //   width: double.infinity,
//                     //       //   decoration: BoxDecoration(
//                     //       //     borderRadius: BorderRadius.circular(12),
//                     //       //     color: Color(0xffF5F5F5),
//                     //       //   ),
//                     //       //   child: Row(
//                     //       //     mainAxisAlignment:
//                     //       //         MainAxisAlignment.spaceBetween,
//                     //       //     children: [
//                     //       //       Spacer(),
//                     //       //       Text(
//                     //       //         'طنطا',
//                     //       //         style: TextStyle(
//                     //       //             color: Colors.black,
//                     //       //             fontSize: 15,
//                     //       //             fontWeight: FontWeight.w600),
//                     //       //       ),
//                     //       //       Spacer(
//                     //       //         flex: 10,
//                     //       //       ),
//                     //       //       InkWell(
//                     //       //         onTap: (){
//                     //       //
//                     //       //
//                     //       //         },
//                     //       //         child: Icon(
//                     //       //           Icons.keyboard_arrow_down_rounded,
//                     //       //           color: Styles.IconColor,
//                     //       //         ),
//                     //       //       ),
//                     //       //       Spacer(),
//                     //       //     ],
//                     //       //   ),
//                     //       // ),
//                     //       Gap(5),
//                     //       Divider(
//                     //         height: 10,
//                     //         color: Colors.black,
//                     //         thickness: .2,
//                     //       )
//                     //     ],
//                     //   ),
//                     // ),
//                     // Gap(5),
//                     // Padding(
//                     //   padding: const EdgeInsets.symmetric(horizontal: 10),
//                     //   child: Column(
//                     //     children: [
//                     //       Row(
//                     //         children: [
//                     //           Icon(
//                     //             FluentSystemIcons.ic_fluent_shapes_regular,
//                     //             size: 24,
//                     //             color: Styles.IconColor,
//                     //           ),
//                     //           Gap(15),
//                     //           Text(
//                     //             'Department',
//                     //             style: TextStyle(
//                     //                 fontWeight: FontWeight.w600,
//                     //                 fontSize: 13),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //       Gap(5),
//                     //       DropdownButtonFormField(
//                     //         value: _selectvalueDepartment,
//                     //         items: _itemsDepartment
//                     //             .map((e) => DropdownMenuItem(
//                     //           child: Text(e),
//                     //           value: e,
//                     //         ))
//                     //             .toList(),
//                     //         onChanged: (val) {
//                     //           setState(() {
//                     //             _selectvalueDepartment = val as String;
//                     //           });
//                     //         },
//                     //         icon: Align(
//                     //           alignment: Alignment.center,
//                     //           child: Icon(
//                     //             Icons.keyboard_arrow_down_rounded,
//                     //             color: Styles.IconColor,
//                     //           ),
//                     //         ),
//                     //         decoration: InputDecoration(
//                     //           fillColor: Color(0xffF5F5F5),
//                     //           filled: true,
//                     //           floatingLabelBehavior:
//                     //           FloatingLabelBehavior.never,
//                     //           focusedBorder: OutlineInputBorder(
//                     //             borderSide:
//                     //             BorderSide(color: Colors.transparent),
//                     //             borderRadius: BorderRadius.circular(12.r),
//                     //           ),
//                     //           border: OutlineInputBorder(),
//                     //           isDense: true,
//                     //           contentPadding:
//                     //           EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                     //           //EdgeInsets.fromLTRB(24.h, 10.h, 20.h, 0.h),
//                     //           enabledBorder: OutlineInputBorder(
//                     //             borderSide:
//                     //             BorderSide(color: Colors.transparent),
//                     //             borderRadius: BorderRadius.circular(12.r),
//                     //           ),
//                     //           labelText: 'Search',
//                     //           hintText: 'Search',
//                     //           hintStyle: Styles.lable_Hint,
//                     //           labelStyle: Styles.lable_Hint,
//                     //         ),
//                     //       ),
//                     //       Gap(5),
//                     //       Divider(
//                     //         height: 10,
//                     //         color: Colors.black,
//                     //         thickness: .2,
//                     //       )
//                     //     ],
//                     //   ),
//                     // ),
//                     // Gap(5),
//                     // Padding(
//                     //   padding: const EdgeInsets.symmetric(horizontal: 10),
//                     //   child: Column(
//                     //     children: [
//                     //       Row(
//                     //         children: [
//                     //           Icon(
//                     //             FluentSystemIcons
//                     //                 .ic_fluent_re_order_dots_regular,
//                     //             size: 24,
//                     //             color: Styles.IconColor,
//                     //           ),
//                     //           Gap(15),
//                     //           Text(
//                     //             'Master Degree',
//                     //             style: TextStyle(
//                     //                 fontWeight: FontWeight.w600,
//                     //                 fontSize: 13),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //       Gap(5),
//                     //       DropdownButtonFormField(
//                     //         value: _selectvalueMaster,
//                     //         items: _itemsMaster
//                     //             .map((e) => DropdownMenuItem(
//                     //           child: Text(e),
//                     //           value: e,
//                     //         ))
//                     //             .toList(),
//                     //         onChanged: (val) {
//                     //           setState(() {
//                     //             _selectvalueMaster = val as String;
//                     //           });
//                     //         },
//                     //         icon: Align(
//                     //           alignment: Alignment.center,
//                     //           child: Icon(
//                     //             Icons.keyboard_arrow_down_rounded,
//                     //             color: Styles.IconColor,
//                     //           ),
//                     //         ),
//                     //         decoration: InputDecoration(
//                     //           fillColor: Color(0xffF5F5F5),
//                     //           filled: true,
//                     //           floatingLabelBehavior:
//                     //           FloatingLabelBehavior.never,
//                     //           focusedBorder: OutlineInputBorder(
//                     //             borderSide:
//                     //             BorderSide(color: Colors.transparent),
//                     //             borderRadius: BorderRadius.circular(12.r),
//                     //           ),
//                     //           border: OutlineInputBorder(),
//                     //           isDense: true,
//                     //           contentPadding:
//                     //           EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                     //           //EdgeInsets.fromLTRB(24.h, 10.h, 20.h, 0.h),
//                     //           enabledBorder: OutlineInputBorder(
//                     //             borderSide:
//                     //             BorderSide(color: Colors.transparent),
//                     //             borderRadius: BorderRadius.circular(12.r),
//                     //           ),
//                     //           labelText: 'Search',
//                     //           hintText: 'Search',
//                     //           hintStyle: Styles.lable_Hint,
//                     //           labelStyle: Styles.lable_Hint,
//                     //         ),
//                     //       ),
//                     //       Gap(5),
//                     //       Divider(
//                     //         height: 10,
//                     //         color: Colors.black,
//                     //         thickness: .2,
//                     //       )
//                     //     ],
//                     //   ),
//                     // ),
//                     // Gap(5),
//                     // Padding(
//                     //   padding: const EdgeInsets.symmetric(horizontal: 10),
//                     //   child: Column(
//                     //     children: [
//                     //       Row(
//                     //         children: [
//                     //           Icon(
//                     //             Icons.sort,
//                     //             size: 24,
//                     //             color: Styles.IconColor,
//                     //           ),
//                     //           Gap(15),
//                     //           Text(
//                     //             'Sort',
//                     //             style: TextStyle(
//                     //                 fontWeight: FontWeight.w600,
//                     //                 fontSize: 13),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //       Gap(5),
//                     //       DropdownButtonFormField(
//                     //         value: _selectvalueSort,
//                     //         items: _itemsSort
//                     //             .map((e) => DropdownMenuItem(
//                     //           child: Text(e),
//                     //           value: e,
//                     //         ))
//                     //             .toList(),
//                     //         onChanged: (val) {
//                     //           setState(() {
//                     //             _selectvalueSort = val as String;
//                     //           });
//                     //         },
//                     //         icon: Align(
//                     //           alignment: Alignment.center,
//                     //           child: Icon(
//                     //             Icons.keyboard_arrow_down_rounded,
//                     //             color: Styles.IconColor,
//                     //           ),
//                     //         ),
//                     //         decoration: InputDecoration(
//                     //           fillColor: Color(0xffF5F5F5),
//                     //           filled: true,
//                     //           floatingLabelBehavior:
//                     //           FloatingLabelBehavior.never,
//                     //           focusedBorder: OutlineInputBorder(
//                     //             borderSide:
//                     //             BorderSide(color: Colors.transparent),
//                     //             borderRadius: BorderRadius.circular(12.r),
//                     //           ),
//                     //           border: OutlineInputBorder(),
//                     //           isDense: true,
//                     //           contentPadding:
//                     //           EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                     //           //EdgeInsets.fromLTRB(24.h, 10.h, 20.h, 0.h),
//                     //           enabledBorder: OutlineInputBorder(
//                     //             borderSide:
//                     //             BorderSide(color: Colors.transparent),
//                     //             borderRadius: BorderRadius.circular(12.r),
//                     //           ),
//                     //           labelText: 'Search',
//                     //           hintText: 'Search',
//                     //           hintStyle: Styles.lable_Hint,
//                     //           labelStyle: Styles.lable_Hint,
//                     //         ),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// // Stack(
// //
// //                       children: [
// //                         TextFormField(
// //                           controller: searchController,
// //                           cursorColor: Colors.grey.shade400,
// //                           keyboardType: TextInputType.text,
// //                           cursorHeight: 25.h,
// //
// //                           decoration: InputDecoration(
// //                             fillColor: Color(0xffF5F5F5),
// //                             filled: true,
// //                             floatingLabelBehavior:
// //                             FloatingLabelBehavior.never,
// //                             focusedBorder: OutlineInputBorder(
// //                               borderSide:
// //                               BorderSide(color: Colors.transparent),
// //                               borderRadius: BorderRadius.circular(12.r),
// //                             ),
// //                             border: OutlineInputBorder(),
// //                             isDense: true,
// //                             contentPadding:
// //                             EdgeInsets.fromLTRB(20.h, 2.h, 60.h, 2.h),
// //                             enabledBorder: OutlineInputBorder(
// //                               borderSide:
// //                               BorderSide(color: Colors.transparent),
// //                               borderRadius: BorderRadius.circular(12.r),
// //                             ),
// //                             labelText:  "Search".tr(),
// //                             hintText:  "Search".tr(),
// //                             hintStyle: Styles.lable_Hint,
// //                             labelStyle: Styles.lable_Hint,
// //                           ),
// //                         ),
// //                         InkWell(
// //                           onTap: (){
// //                             fetchsearch(searchController.text.toString());
// //
// //                           },
// //                           child: Container(
// //                             height: 31.h,
// //                             width: 58.w,
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(12.r),
// //                               color: Styles.buttomColor,
// //                             ),
// //                             child: Center(
// //                               child: Text(
// //                                 "Search".tr(),
// //                                 style: TextStyle(
// //                                   color: Colors.white,
// //                                   fontSize: 13.sp,
// //                                   fontWeight: FontWeight.w600,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         )
// //                       ],
// //                     ),