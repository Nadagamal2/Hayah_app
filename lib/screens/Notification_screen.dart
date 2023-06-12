// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:hayat/core/utils/app_style.dart';
//
//
// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
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
//               size: 30.sp,
//             )),
//         centerTitle: true,
//         title: Text(
//           "Notifications",
//           style: TextStyle(
//             fontSize: 18.sp,
//           ),
//         ),
//       ),
//       body: FadeInRight(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Container(
//                 height: 160.h,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade300,
//                   borderRadius: BorderRadius.circular(35.r),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//
//                         children: [
//                          Column(
//
//                            children: [
//                              Container(
//                                decoration: BoxDecoration(
//                                  image: DecorationImage(
//
//                                      fit: BoxFit.cover,
//                                      image: AssetImage(
//                                        'assets/xx.png',
//                                      )),
//                                  // color: Styles.buttomColor,
//                                  shape: BoxShape.circle,
//                                ),
//                                height: 50.h,
//                                width: 50.w,
//                              ),
//                              Text('Unknown User',style: Styles.headLineGray2.copyWith(fontSize: 12.sp),)
//                            ],
//                          ),
//                           Gap(15.h),
//                           Expanded(
//                             child: Text(
//
//                               'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,',
//
//                               maxLines: 4,
//
//                               overflow: TextOverflow.ellipsis,
//                             style: Styles.headLineGray2,
//
//
//
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:   EdgeInsets.symmetric(horizontal: 20.h),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text('25/7/2022',style: Styles.headLineGray2.copyWith(fontSize: 12),),
//                           Gap(3.h),
//                           Text('3:33pm',style: Styles.headLineGray2.copyWith(fontSize: 12),),
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               Gap(18.h),
//               Container(
//                 height: 160.h,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade300,
//                   borderRadius: BorderRadius.circular(35.r),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//
//                         children: [
//                          Column(
//
//                            children: [
//                              Container(
//                                decoration: BoxDecoration(
//                                  image: DecorationImage(
//
//                                      fit: BoxFit.cover,
//                                      image: AssetImage(
//                                        'assets/xx.png',
//                                      )),
//                                  // color: Styles.buttomColor,
//                                  shape: BoxShape.circle,
//                                ),
//                                height: 50.h,
//                                width: 50.w,
//                              ),
//                              Text('Unknown User',style: Styles.headLineGray2.copyWith(fontSize: 12.sp),)
//                            ],
//                          ),
//                           Gap(15.h),
//                           Expanded(
//                             child: Text(
//
//                               'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,',
//
//                               maxLines: 4,
//
//                               overflow: TextOverflow.ellipsis,
//                             style: Styles.headLineGray2,
//
//
//
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:   EdgeInsets.symmetric(horizontal: 20.h),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text('25/7/2022',style: Styles.headLineGray2.copyWith(fontSize: 12),),
//                           Gap(3.h),
//                           Text('3:33pm',style: Styles.headLineGray2.copyWith(fontSize: 12),),
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
