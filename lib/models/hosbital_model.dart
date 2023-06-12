
class HospitalModel {
  Null? photo;
  int? id;
  String? hosptName;
  String? hosptNameImgUrl;
  String? hosptAddress;
  String? hosptPhone;
  String? sale;
  int? districtId;
  District? district;
  Null? hospitalsAppointments;

  HospitalModel({
    this.photo,
    this.id,
    this.hosptName,
    this.hosptNameImgUrl,
    this.hosptAddress,
    this.hosptPhone,
    this.districtId,
    this.sale,
    this.district,
    this.hospitalsAppointments
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
        photo : json['Photo'],
        id : json['Id'],
        hosptName : json['Hospt_Name'],
        sale : json['Sale'],
    hosptNameImgUrl : json['Hospt_NameImgUrl'],
    hosptAddress : json['Hospt_Address'],
    hosptPhone : json['Hospt_Phone'],
    districtId : json['DistrictId'],
    district : json['District'] != null
    ? new District.fromjson(json['District'])
        : null,
    hospitalsAppointments : json['HospitalsAppointments']
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