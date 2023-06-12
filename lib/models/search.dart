// // To parse this JSON data, do
// //
// //     final search = searchFromJson(jsonString);
//
// import 'dart:convert';
//
// Search searchFromJson(String str) => Search.fromJson(json.decode(str));
// class Search {
//   Search({
//     required this.records,
//     this.record,
//     required this.code,
//     required this.status,
//     required this.message,
//   });
//
//   List<Record> records;
//   dynamic record;
//   String code;
//   String status;
//   String message;
//
//   factory Search.fromJson(Map<String, dynamic> json) => Search(
//     records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
//     record: json["record"],
//     code: json["code"],
//     status: json["status"],
//     message: json["message"],
//   );
//
//  }
//
// class Record {
//   Record({
//     this.photo,
//     required this.id,
//     required this.clinName,
//     required this.clinNameImgUrl,
//     required this.clinDescriprion,
//     required this.clinPhone,
//     this.clinRate,
//     required this.clinLInk,
//     required this.clinFacebookLInk,
//     required this.clinYoutubeLInk,
//     required this.clinInstaLInk,
//     required this.clinWhatsappLInk,
//     required this.clinLocationLInk,
//     required this.cityName,
//     required this.areaName,
//     this.clincsAppointments,
//   });
//
//   dynamic photo;
//   int id;
//   String clinName;
//   String clinNameImgUrl;
//   String clinDescriprion;
//   String clinPhone;
//   dynamic clinRate;
//   String clinLInk;
//   String clinFacebookLInk;
//   String clinYoutubeLInk;
//   String clinInstaLInk;
//   String clinWhatsappLInk;
//   String clinLocationLInk;
//   String cityName;
//   String areaName;
//   dynamic clincsAppointments;
//
//   factory Record.fromJson(Map<String, dynamic> json) => Record(
//     photo: json["photo"],
//     id: json["id"],
//     clinName: json["clin_Name"],
//     clinNameImgUrl: json["clin_NameImgUrl"],
//     clinDescriprion: json["clin_Descriprion"],
//     clinPhone: json["clin_Phone"],
//     clinRate: json["clin_rate"],
//     clinLInk: json["clin_LInk"],
//     clinFacebookLInk: json["clin_FacebookLInk"],
//     clinYoutubeLInk: json["clin_YoutubeLInk"],
//     clinInstaLInk: json["clin_InstaLInk"],
//     clinWhatsappLInk: json["clin_WhatsappLInk"],
//     clinLocationLInk: json["clin_LocationLInk"],
//     cityName: json["cityName"],
//     areaName: json["areaName"],
//     clincsAppointments: json["clincsAppointments"],
//   );
//
//  }
