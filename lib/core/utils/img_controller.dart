// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ImageController extends GetxController {
//   static ImageController get to => Get.find<ImageController>();
//
//   File? image;
//   String? imagePath;
//   final userData = GetStorage();
//   final _picker = ImagePicker();
//   SharedPreferences? prefs;
//   @override
//
//   Future<void> getImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       imagePath = pickedFile.path;
//       print(imagePath);
//       update();
//     } else {
//       print('No image selected.');
//     }
//   }
//   void updateAndStoreRating(String imagePath) {
//
//     prefs!.setString('imagePic', imagePath); //SharedPreferences way
//     update(); // triggers a rebuild of the GetBuilder Widget
//   }
// }