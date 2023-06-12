import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/shared/component/component.dart';

class ForgetNumberScreen extends StatelessWidget {
  const ForgetNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
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
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    'assets/99.png',
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                        color:  Colors.grey.shade600,
                  )),
                  Gap(10),
                  Text(
                    "Forget Your Password".tr(),
                    style: Styles.headLine1,
                  ),
                  Gap(12),
                  Text(
                    "Provide your account phone for which you want to\\n reset your password".tr(),
                    textAlign: TextAlign.center,
                    style: Styles.headLineGray2.copyWith(fontSize: 13),
                  ),
                  Gap(32),
                  defaultFieldForm(
                      padding:  EdgeInsets.symmetric(vertical: 3),
                      Type: TextInputType.number,
                      prefix: FluentSystemIcons.ic_fluent_mail_regular,
                      lable: "Email".tr(),
                      hint:"Email".tr(),),
                  Gap(60),
                  buildBottum(
                    height: 42,
                    width: 290,
                    decoration: BoxDecoration(
                      color: Styles.buttomColor,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    text: Text(
                      "Next".tr(),
                      style: Styles.buttomStyle.copyWith(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {

                    },
                  ),
                  Gap(8),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back".tr(),
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
