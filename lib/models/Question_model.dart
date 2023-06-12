class QuestionsModel {
  List<Records>? records;
  Null? record;
  String? code;
  String? status;
  String? message;

  QuestionsModel(
      {this.records, this.record, this.code, this.status, this.message});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
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
  String? question;
  String? answer;

  Records({this.id, this.question, this.answer});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    question = json['Question'];
    answer = json['Answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Question'] = this.question;
    data['Answer'] = this.answer;
    return data;
  }
}