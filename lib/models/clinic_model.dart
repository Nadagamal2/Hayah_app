class Clinic {
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

  Clinic({
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

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
        photo : json['Photo'],
        id : json['Id'],
        doctorName : json['Doctor_Name'],
        clinNameImgUrl : json['Clin_NameImgUrl'],
        clinAddress : json['Clin_Address'],
        clinPhone : json['Clin_Phone'],
        scientificLevel : json['Scientific_Level'],
        priceBeforeSale : json['Price_Before_Sale'],
        sale : json['Sale'],
        priceAfterSale : json['Price_After_Sale'],
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