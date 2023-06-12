class contactUsModel {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  contactUsModel(
      {this.records, this.record, this.code, this.status, this.message});

  contactUsModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? phone;
  String? address;
  String? locationLink;
  String? websiteLink;
  String? facebookLink;
  String? youtubeLink;
  String? instaLink;
  String? whatsappLink;

  Records(
      {this.id,
        this.email,
        this.phone,
        this.address,
        this.locationLink,
        this.websiteLink,
        this.facebookLink,
        this.youtubeLink,
        this.instaLink,
        this.whatsappLink});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    email = json['Email'];
    phone = json['Phone'];
    address = json['Address'];
    locationLink = json['Location_Link'];
    websiteLink = json['Website_Link'];
    facebookLink = json['Facebook_Link'];
    youtubeLink = json['Youtube_Link'];
    instaLink = json['Insta_Link'];
    whatsappLink = json['Whatsapp_Link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['Address'] = this.address;
    data['Location_Link'] = this.locationLink;
    data['Website_Link'] = this.websiteLink;
    data['Facebook_Link'] = this.facebookLink;
    data['Youtube_Link'] = this.youtubeLink;
    data['Insta_Link'] = this.instaLink;
    data['Whatsapp_Link'] = this.whatsappLink;
    return data;
  }
}