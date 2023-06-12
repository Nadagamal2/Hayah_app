import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:gap/gap.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/bottom.dart';
   import 'package:hayat/shared/component/component.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60,left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Styles.IconColor,
                        size: 30,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    height: 190,
                    width: 190,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FluentSystemIcons.ic_fluent_mail_unread_filled,
                        size: 30,
                        color: Styles.IconColor,
                      ),
                      Gap(10),
                      Text(
                        'Please Enter the code , the code has\n been sent to your phone',
                        style: Styles.headLineGray2,
                      )
                    ],
                  ),
                  Gap(25),
                  Container(
                    height:79,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),

                    decoration: BoxDecoration(


                       border: Border .all(color: Styles.buttomColor),
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Form(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        verifyTextField(context,
                          onChanged:(value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },

                          width: 48,inputList:
                        [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,

                        ],
                        ),
                        verifyTextField(context,
                          onChanged:(value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },width: 48,inputList:
                        [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],),
                        verifyTextField(context,
                          onChanged:(value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },width: 48,inputList:
                        [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],),
                        verifyTextField(context,
                          onChanged:(value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },width: 48,inputList:
                        [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],),


                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {


                            },
                            child: Text(
                              'Resend the code',
                              style: Styles.headLineGray2 ,
                            )),
                      ],
                    ),
                  ),
                  Gap(75),
                  buildBottum(
                    height: 43,
                    width: 290,
                    decoration: BoxDecoration(
                      color: Styles.buttomColor,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    text: Text(
                      'CONFIRM',
                      style: Styles.buttomStyle.copyWith(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      navigateAndFinish(context, BottomNav());
                    },
                  ),
                  Gap(8),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'BACK',
                        style: Styles.headLineGray2.copyWith(fontSize: 17),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
