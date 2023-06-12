// To parse this JSON data, do
//
//     final clinicElementModel = clinicElementModelFromJson(jsonString);

import 'dart:convert';

ClinicElementModel clinicElementModelFromJson(String str) => ClinicElementModel.fromJson(json.decode(str));

String clinicElementModelToJson(ClinicElementModel data) => json.encode(data.toJson());

class ClinicElementModel {
  ClinicElementModel({
    this.records,
    required this.record,
    required this.code,
    required this.status,
    required this.message,
  });

  dynamic records;
  Record record;
  String code;
  String status;
  String message;

  factory ClinicElementModel.fromJson(Map<String, dynamic> json) => ClinicElementModel(
    records: json["records"],
    record: Record.fromJson(json["record"]),
    code: json["code"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "records": records,
    "record": record.toJson(),
    "code": code,
    "status": status,
    "message": message,
  };
}

class Record {
  Record({
    this.photo,
    required this.id,
    required this.clinName,
    required this.clinNameImgUrl,
    required this.clinDescriprion,
    required this.clinPhone,
    this.clinRate,
    required this.clinLInk,
    required this.clinFacebookLInk,
    required this.clinYoutubeLInk,
    required this.clinInstaLInk,
    required this.clinWhatsappLInk,
    required this.clinLocationLInk,
    required this.cityName,
    required this.areaName,
    this.clincsAppointments,
  });

  dynamic photo;
  int id;
  String clinName;
  String clinNameImgUrl;
  String clinDescriprion;
  String clinPhone;
  dynamic clinRate;
  String clinLInk;
  String clinFacebookLInk;
  String clinYoutubeLInk;
  String clinInstaLInk;
  String clinWhatsappLInk;
  String clinLocationLInk;
  String cityName;
  String areaName;
  dynamic clincsAppointments;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    photo: json["photo"],
    id: json["id"],
    clinName: json["clin_Name"],
    clinNameImgUrl: json["clin_NameImgUrl"],
    clinDescriprion: json["clin_Descriprion"],
    clinPhone: json["clin_Phone"],
    clinRate: json["clin_rate"],
    clinLInk: json["clin_LInk"],
    clinFacebookLInk: json["clin_FacebookLInk"],
    clinYoutubeLInk: json["clin_YoutubeLInk"],
    clinInstaLInk: json["clin_InstaLInk"],
    clinWhatsappLInk: json["clin_WhatsappLInk"],
    clinLocationLInk: json["clin_LocationLInk"],
    cityName: json["cityName"],
    areaName: json["areaName"],
    clincsAppointments: json["clincsAppointments"],
  );

  Map<String, dynamic> toJson() => {
    "photo": photo,
    "id": id,
    "clin_Name": clinName,
    "clin_NameImgUrl": clinNameImgUrl,
    "clin_Descriprion": clinDescriprion,
    "clin_Phone": clinPhone,
    "clin_rate": clinRate,
    "clin_LInk": clinLInk,
    "clin_FacebookLInk": clinFacebookLInk,
    "clin_YoutubeLInk": clinYoutubeLInk,
    "clin_InstaLInk": clinInstaLInk,
    "clin_WhatsappLInk": clinWhatsappLInk,
    "clin_LocationLInk": clinLocationLInk,
    "cityName": cityName,
    "areaName": areaName,
    "clincsAppointments": clincsAppointments,
  };
}
