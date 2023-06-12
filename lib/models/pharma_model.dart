//pharmName
class PharmaModel {
  Null? photo;
  int? id;
  String? pharmName;
  String? pharmNameImgUrl;
  String? Sale;
  String? pharmAddress;
  String? pharmPhone;
  int? districtId;
  District? district;
  Null? pharmaciesAppointments;

  PharmaModel({
    this.photo,
    this.id,
    this.pharmName,
    this.pharmNameImgUrl,
    this.Sale,
    this.pharmAddress,
    this.pharmPhone,
    this.districtId,
    this.district,
    this.pharmaciesAppointments
  });

  factory PharmaModel.fromJson(Map<String, dynamic> json) {
    return PharmaModel(
      photo : json['Photo'],
      id : json['Id'],
      Sale : json['Sale'],
      pharmName : json['Pharm_Name'],
      pharmNameImgUrl : json['Pharm_NameImgUrl'],
      pharmAddress : json['Pharm_Address'],
      pharmPhone : json['Pharm_Phone'],
      districtId : json['DistrictId'],
      district : json['District'] != null
          ? new District.fromjson(json['District'])
          : null,
      pharmaciesAppointments : json['PharmaciesAppointments'],


    );
  }
}class District{
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