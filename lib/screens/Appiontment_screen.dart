import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:easy_localization/easy_localization.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  bool isCurrent=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 65.h,
        elevation: 0,
        backgroundColor: Styles.defualtColor,

        title: Text(
          "Appointment".tr(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
          ),
        ),

      ),
      backgroundColor:Styles.ScafoldColor2,

      body: Column(

        children: [

          Gap(20.h),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [

              InkWell(

                child: Container(
                  height: 38.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: isCurrent?Styles.defualtColor:Styles.defualtColor2,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      "Current Appointment".tr(),
                      style: TextStyle(
                        color: isCurrent?Colors.white:Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.5.sp,
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    isCurrent=true;
                  });
                },
              ),
              Gap(5.h),
              InkWell(
                child: Container(
                  height: 38.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: isCurrent? Styles.defualtColor2:Styles.defualtColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      "Previous Appointment".tr(),
                      style: TextStyle(
                        color: isCurrent?Colors.black54:Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    isCurrent=false;
                  });
                },
              ),
            ],),
          ),
          Spacer(),
          Text("No Data".tr(),style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold
            ,
            color: Styles.defualtColor,
          ),),
          Spacer(),
        ],
      ),
    );
  }
}
