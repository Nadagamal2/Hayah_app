class CityModel {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  CityModel({this.records, this.record, this.code, this.status, this.message});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['Records'] != null) {
      records = <Records>[];
      json['Records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
    record = json['Record'];
    code = json['Code'];
    status = json['Status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.records != null) {
      data['Records'] = this.records!.map((v) => v.toJson()).toList();
    }
    data['Record'] = this.record;
    data['Code'] = this.code;
    data['Status'] = this.status;
    data['Message'] = this.message;
    return data;
  }
}

class Records {
  int? id;
  String? cityName;
  List<District>? district;

  Records({this.id, this.cityName, this.district});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    cityName = json['CityName'];
    if (json['District'] != null) {
      district = <District>[];
      json['District'].forEach((v) {
        district!.add(new District.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['CityName'] = this.cityName;
    if (this.district != null) {
      data['District'] = this.district!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class District {
  int? id;
  String? districtName;
  int? cityId;
  Null? city;
  Null? clincs;
  Null? analysisLaps;
  Null? clientTb;
  Null? hospitals;
  Null? medicalCentres;
  Null? pharmacies;
  Null? xrays;

  District(
      {this.id,
        this.districtName,
        this.cityId,
        this.city,
        this.clincs,
        this.analysisLaps,
        this.clientTb,
        this.hospitals,
        this.medicalCentres,
        this.pharmacies,
        this.xrays});

  District.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    districtName = json['DistrictName'];
    cityId = json['CityId'];
    city = json['City'];
    clincs = json['Clincs'];
    analysisLaps = json['AnalysisLaps'];
    clientTb = json['ClientTb'];
    hospitals = json['Hospitals'];
    medicalCentres = json['MedicalCentres'];
    pharmacies = json['Pharmacies'];
    xrays = json['Xrays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['DistrictName'] = this.districtName;
    data['CityId'] = this.cityId;
    data['City'] = this.city;
    data['Clincs'] = this.clincs;
    data['AnalysisLaps'] = this.analysisLaps;
    data['ClientTb'] = this.clientTb;
    data['Hospitals'] = this.hospitals;
    data['MedicalCentres'] = this.medicalCentres;
    data['Pharmacies'] = this.pharmacies;
    data['Xrays'] = this.xrays;
    return data;
  }
}