
class medicalModel {
  int? id;
  String? centersName;
  String? centersNameImgUrl;
  String? centersAddress;
  String? centersPhone;
  int? districtId;
  District? district;
  String? sale;

  medicalModel({
     this.id,
    this.centersName,
    this.centersNameImgUrl,
    this.centersAddress,
    this.centersPhone,
    this.districtId,
    this.district,
    this.sale,



  });

  factory medicalModel.fromJson(Map<String, dynamic> json) {
    return medicalModel(
        id : json['Id'],
      sale:json['Sale'],
        centersName : json['Centers_Name'],
        centersNameImgUrl : json['Centers_NameImgUrl'],
    centersAddress : json['Centers_Address'],
    centersPhone : json['Centers_Phone'],
    districtId : json['DistrictId'],
    district : json['District'] != null
    ? new District.fromjson(json['District'])
        : null,
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