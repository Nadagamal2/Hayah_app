import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hayat/core/utils/app_style.dart';
import 'package:hayat/screens/bottom.dart';
import 'package:hayat/screens/onBoardingScreen.dart';
import 'package:hayat/shared/component/ratingController.dart';
import 'package:hayat/translations/codegen_loader.g.dart';

void main() async {
  final controller = Get.put(RatingController());
  await controller.initSp();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  runApp(EasyLocalization(
      child: const  MyApp(),
      supportedLocales: [
        Locale('ar'),
        Locale('en'),
      ],
assetLoader: CodegenLoader(),
      saveLocale: true,
      path: "assets/translations"));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  final userData =GetStorage();



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          title: 'Hayat',
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            fontFamily: "Cairo",
            scaffoldBackgroundColor: Styles.ScafoldColor,
          ),
          debugShowCheckedModeBanner: false,
          home: child,

        );
      },
      child:   HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userData = GetStorage();

  @override
  void initState() {
    super.initState();
    userData.writeIfNull('isLogged', false);
    userData.writeIfNull('isLoggedByGoogle', false);
    Future.delayed(Duration.zero, () async {
      checkIfLoged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.defualtColor),
        ),
      ),
    ));
  }

  void checkIfLoged() {
    userData.read('isLogged')||userData.read('isLoggedByGoogle')
        ? Get.offAll(BottomNav())
        : Get.offAll(OnBoardingScreen());
  }
}
