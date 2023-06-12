import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/sign_screen.dart';
 import 'package:hayat/shared/component/component.dart';
import 'package:easy_localization/easy_localization.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/nn.png',
      title: "Search Doctor".tr(),
      body: "Get List of the best doctor nearby you".tr(),
    ),
    BoardingModel(
      image: 'assets/rr.png',
      title: "Book Appointment ".tr(),
      body: "Book an appointment with a\\n right doctor".tr(),
    ),
    BoardingModel(
      image: 'assets/mm.png',
      title: "Book Diagnostic".tr(),
      body: "Search and book diagnostic test".tr(),
    ),
  ];
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              physics: BouncingScrollPhysics(),
              itemCount: boarding.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:   EdgeInsets.all(20.h),
                        child: Image(
                          image: AssetImage(boarding[index].image),
                        ),
                      ),
                      Text(
                        boarding[index].title,
                        style: Styles.headLine2,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        boarding[index].body,
                        style: Styles.headLine3,
                        textAlign: TextAlign.center,
                      ),
                       Gap(20.h),
                    ],
                  ),
                );
              }),
        ),
        if (currentIndex == boarding.length - 3)
          buildBottum(
            //EdgeInsets.symmetric(vertical: 55)
            margin: EdgeInsets.symmetric(vertical: 55.h),
            height: 43.h,
            decoration: BoxDecoration(
              color: Styles.buttomColor,
              borderRadius: BorderRadius.circular(14.r),
            ),
            width: 190.w,

            text: Text(
              currentIndex == boarding.length - 1 ?  "Lets go".tr() : "Next".tr(),
              style: Styles.buttomStyle,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              if (currentIndex == boarding.length - 1) {
                Get.offAll(SignScreen());
              }
              _controller?.nextPage(
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            },
          ),
        if (currentIndex == boarding.length - 2)
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBottum(
                  height: 43.h,
                  decoration: BoxDecoration(
                    color: Styles.buttomColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  width: 100.h,
                  margin: EdgeInsets.symmetric(vertical: 55.h),
                  text: Text(
                    "previous".tr(),
                    style: Styles.buttomStyle,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    if (currentIndex == boarding.length - 1) {
                      Get.offAll(SignScreen());
                    }
                    _controller?.previousPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                ),
                buildBottum(
                  height: 43.h,
                  decoration: BoxDecoration(
                    color: Styles.buttomColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  width: 100.h,
                  margin: EdgeInsets.symmetric(vertical: 55.h),
                  text: Text(
                    currentIndex == boarding.length - 1 ? "Lets go".tr() : "Next".tr(),
                    style: Styles.buttomStyle,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    if (currentIndex == boarding.length - 1) {
                    Get.offAll(SignScreen());
                    }
                    _controller?.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                ),
              ],
            ),
          ),
        if (currentIndex == boarding.length - 1)
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                buildBottum(
                  decoration: BoxDecoration(
                    color: Styles.buttomColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 55.h),
                  height: 43.h,
                  width: 100.h,
                  text: Text(
                    "previous".tr(),
                    style: Styles.buttomStyle,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    _controller?.previousPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                ),
                buildBottum(
                  height: 43.h,
                  decoration: BoxDecoration(
                    color: Styles.buttomColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  width: 100.h,
                  margin: EdgeInsets.symmetric(vertical: 55.h),
                  text: Text(
                    currentIndex == boarding.length - 1 ? "Lets go".tr() : "Next".tr(),
                    style: Styles.buttomStyle,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    if (currentIndex == boarding.length - 1) {
                      Get.offAll(SignScreen());
                    }
                    _controller?.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    ));
  }
}
