class TermsAndConditionsModel {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  TermsAndConditionsModel(
      {this.records, this.record, this.code, this.status, this.message});

  TermsAndConditionsModel.fromJson(Map<String, dynamic> json) {
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
  String? details;

  Records({this.id, this.details});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    details = json['Details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Details'] = this.details;
    return data;
  }
}