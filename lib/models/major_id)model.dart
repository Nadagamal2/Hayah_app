class MajorsIdModel {
  Null? photo;
  int? id;
  String? doctorName;
  String? clinNameImgUrl;
  String? clinAddress;
  String? clinPhone;
  String? scientificLevel;
  String? priceBeforeSale;
  String? sale;
  String? priceAfterSale;
  int? districtId;
  District? district;
  int? majorId;
  Majors? majors;
  Null? clincsAppointments;

  MajorsIdModel({
    this.photo,
    this.id,
    this.doctorName,
    this.clinNameImgUrl,
    this.clinAddress,
    this.clinPhone,
    this.scientificLevel,
    this.priceBeforeSale,
    this.sale,
    this.priceAfterSale,
    this.districtId,
    this.district,
    this.majorId,
    this.majors,
    this.clincsAppointments
  });

  factory MajorsIdModel.fromJson(Map<String, dynamic> json) {
    return MajorsIdModel(
      photo : json['Photo'],
      id : json['Id'],
      doctorName : json['Doctor_Name'],
      clinNameImgUrl : json['Clin_NameImgUrl'],
      clinAddress : json['Clin_Address'],
      clinPhone : json['Clin_Phone'],
      scientificLevel : json['Scientific_Level'],
       sale : json['Sale'],
      districtId : json['DistrictId'],
      district : json['District'] != null
          ? new District.fromjson(json['District'])
          : null,
      majorId : json['MajorId'],
      majors :
      json['Majors'] != null ? new Majors.fromjson(json['Majors']) : null,
      clincsAppointments : json['ClincsAppointments'],
    );
  }

}
class District{
  int? id;
  String? districtName;
  int? cityId;
  District({
    this.id,
    this.districtName,
    this.cityId
  });
  factory District.fromjson(Map<String, dynamic> json){
    return District(
      id : json['Id'],
      districtName : json['DistrictName'],
      cityId : json['CityId'],
    );

  }
}
class Majors{
  int? id;
  String? MajorName;
  Majors({
    this.id,
    this.MajorName,
  });
  factory Majors.fromjson(Map<String, dynamic> json){
    return Majors(
      id : json['Id'],
      MajorName : json['MajorName'],

    );

  }
}

// class MajorsIdModel {
//   MajorsIdModel({
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
//   factory MajorsIdModel.fromJson(Map<String, dynamic> json) => MajorsIdModel(
//     records: List<Record>.from(json["Records"].map((x) => Record.fromJson(x))),
//     record: json["Record"],
//     code: json["Code"],
//     status: json["Status"],
//     message: json["Message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Records": List<dynamic>.from(records.map((x) => x.toJson())),
//     "Record": record,
//     "Code": code,
//     "Status": status,
//     "Message": message,
//   };
// }
//
// class Record {
//   Record({
//     this.photo,
//     required this.id,
//     required this.doctorName,
//     required this.clinNameImgUrl,
//     required this.clinAddress,
//     required this.clinPhone,
//     required this.scientificLevel,
//     required this.sale,
//     required this.districtId,
//     required this.district,
//     required this.majorId,
//     required this.majors,
//     this.clincsAppointments,
//   });
//
//   dynamic photo;
//   int id;
//   String doctorName;
//   String clinNameImgUrl;
//   String clinAddress;
//   String clinPhone;
//   String scientificLevel;
//   String sale;
//   int districtId;
//   District district;
//   int majorId;
//   Majors majors;
//   dynamic clincsAppointments;
//
//   factory Record.fromJson(Map<String, dynamic> json) => Record(
//     photo: json["Photo"],
//     id: json["Id"],
//     doctorName: json["Doctor_Name"],
//     clinNameImgUrl: json["Clin_NameImgUrl"],
//     clinAddress: json["Clin_Address"],
//     clinPhone: json["Clin_Phone"],
//     scientificLevel: json["Scientific_Level"],
//     sale: json["Sale"],
//     districtId: json["DistrictId"],
//     district: District.fromJson(json["District"]),
//     majorId: json["MajorId"],
//     majors: Majors.fromJson(json["Majors"]),
//     clincsAppointments: json["ClincsAppointments"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Photo": photo,
//     "Id": id,
//     "Doctor_Name": doctorName,
//     "Clin_NameImgUrl": clinNameImgUrl,
//     "Clin_Address": clinAddress,
//     "Clin_Phone": clinPhone,
//     "Scientific_Level": scientificLevel,
//     "Sale": sale,
//     "DistrictId": districtId,
//     "District": district.toJson(),
//     "MajorId": majorId,
//     "Majors": majors.toJson(),
//     "ClincsAppointments": clincsAppointments,
//   };
// }
//
// class District {
//   District({
//     required this.id,
//     required this.districtName,
//     required this.cityId,
//     this.city,
//     this.clincs,
//     this.analysisLaps,
//     this.clientTb,
//     this.hospitals,
//     this.medicalCentres,
//     this.pharmacies,
//     this.xrays,
//   });
//
//   int id;
//   String districtName;
//   int cityId;
//   dynamic city;
//   dynamic clincs;
//   dynamic analysisLaps;
//   dynamic clientTb;
//   dynamic hospitals;
//   dynamic medicalCentres;
//   dynamic pharmacies;
//   dynamic xrays;
//
//   factory District.fromJson(Map<String, dynamic> json) => District(
//     id: json["Id"],
//     districtName: json["DistrictName"],
//     cityId: json["CityId"],
//     city: json["City"],
//     clincs: json["Clincs"],
//     analysisLaps: json["AnalysisLaps"],
//     clientTb: json["ClientTb"],
//     hospitals: json["Hospitals"],
//     medicalCentres: json["MedicalCentres"],
//     pharmacies: json["Pharmacies"],
//     xrays: json["Xrays"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "DistrictName": districtName,
//     "CityId": cityId,
//     "City": city,
//     "Clincs": clincs,
//     "AnalysisLaps": analysisLaps,
//     "ClientTb": clientTb,
//     "Hospitals": hospitals,
//     "MedicalCentres": medicalCentres,
//     "Pharmacies": pharmacies,
//     "Xrays": xrays,
//   };
// }
//
// class Majors {
//   Majors({
//     required this.id,
//     required this.majorName,
//     this.clincs,
//   });
//
//   int id;
//   String majorName;
//   dynamic clincs;
//
//   factory Majors.fromJson(Map<String, dynamic> json) => Majors(
//     id: json["Id"],
//     majorName: json["MajorName"],
//     clincs: json["Clincs"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "MajorName": majorName,
//     "Clincs": clincs,
//   };
// }
