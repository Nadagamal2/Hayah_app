class SliderModel {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  SliderModel(
      {this.records, this.record, this.code, this.status, this.message});

  SliderModel.fromJson(Map<String, dynamic> json) {
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
  String? sliderImgUrl;

  Records({this.photo, this.id, this.sliderImgUrl});

  Records.fromJson(Map<String, dynamic> json) {
    photo = json['Photo'];
    id = json['Id'];
    sliderImgUrl = json['SliderImgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Photo'] = this.photo;
    data['Id'] = this.id;
    data['SliderImgUrl'] = this.sliderImgUrl;
    return data;
  }
}