
class LabModel {
  Null? photo;
  int? id;
  String? lapName;
  String? lapImgUrl;
  String? lapAddress;
  String? lapPhone;
  Null? lapRate;
  int? districtId;
  District? district;
  String? Sale;
  Null? analysisLapsAppointments;

  LabModel({
    this.photo,
    this.id,
    this.lapName,
    this.lapImgUrl,
    this.lapAddress,
    this.lapPhone,
    this.lapRate,
    this.districtId,
    this.Sale,
    this.district,
    this.analysisLapsAppointments
  });

  factory LabModel.fromJson(Map<String, dynamic> json) {
    return LabModel(
        photo : json['Photo'],
        id : json['Id'],
      Sale : json['Sale'],
        lapName : json['Lap_Name'],
    lapImgUrl : json['Lap_ImgUrl'],
    lapAddress : json['Lap_Address'],
    lapPhone : json['Lap_Phone'],
    lapRate : json['Lap_rate'],
    districtId : json['DistrictId'],
    district : json['District'] != null
    ? new District.fromjson(json['District'])
        : null,
    analysisLapsAppointments : json['AnalysisLapsAppointments'],
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