
class XraysModel {

  Null? photo;
  int? id;
  String? xrayName;
  String? xrayNameImgUrl;
  String? xrayAddress;
  String? xrayPhone;
  int? districtId;
 District? district;
  String? sale;
  Null? xRaysAppointments;

  XraysModel({
    this.photo,
    this.id,
    this.xrayName,
    this.xrayNameImgUrl,
    this.xrayAddress,
    this.xrayPhone,
    this.sale,
    this.districtId,
    this.district,
    this.xRaysAppointments
  });

  factory XraysModel.fromJson(Map<String, dynamic> json) {
    return XraysModel(
        photo : json['Photo'],
        id : json['Id'],
        xrayName : json['Xray_Name'],
    xrayNameImgUrl : json['Xray_NameImgUrl'],
    xrayAddress : json['Xray_Address'],
    xrayPhone : json['Xray_Phone'],
    districtId : json['DistrictId'],
      sale : json['Sale'],
    district : json['District'] != null
    ? new District.fromjson(json['District'])
        : null,
    xRaysAppointments : json['XRaysAppointments'],
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