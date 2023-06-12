class centerModel {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  centerModel(
      {this.records, this.record, this.code, this.status, this.message});

  centerModel.fromJson(Map<String, dynamic> json) {
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
  Null? photo;
  int? id;
  String? title;
  String? description;
  String? date;
  String? imgUrl;

  Records(
      {this.photo,
        this.id,
        this.title,
        this.description,
        this.date,
        this.imgUrl});

  Records.fromJson(Map<String, dynamic> json) {
    photo = json['Photo'];
    id = json['Id'];
    title = json['Title'];
    description = json['Description'];
    date = json['Date'];
    imgUrl = json['ImgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Photo'] = this.photo;
    data['Id'] = this.id;
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['Date'] = this.date;
    data['ImgUrl'] = this.imgUrl;
    return data;
  }
}