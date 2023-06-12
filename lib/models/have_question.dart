// To parse this JSON data, do
//
//     final haveQuestionModel = haveQuestionModelFromJson(jsonString);

import 'dart:convert';

HaveQuestionModel haveQuestionModelFromJson(String str) => HaveQuestionModel.fromJson(json.decode(str));

String haveQuestionModelToJson(HaveQuestionModel data) => json.encode(data.toJson());

class HaveQuestionModel {
  HaveQuestionModel({
    required this.records,
    this.record,
    required this.code,
    required this.status,
    required this.message,
  });

  List<Record> records;
  dynamic record;
  String code;
  String status;
  String message;

  factory HaveQuestionModel.fromJson(Map<String, dynamic> json) => HaveQuestionModel(
    records: List<Record>.from(json["Records"].map((x) => Record.fromJson(x))),
    record: json["Record"],
    code: json["Code"],
    status: json["Status"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Records": List<dynamic>.from(records.map((x) => x.toJson())),
    "Record": record,
    "Code": code,
    "Status": status,
    "Message": message,
  };
}

class Record {
  Record({
    required this.id,
    required this.question,
    this.answer,
    this.userId,
    this.applicationUser,
    required this.questionDate,
  });

  int id;
  String question;
  dynamic answer;
  dynamic userId;
  dynamic applicationUser;
  DateTime questionDate;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["Id"],
    question: json["Question"],
    answer: json["Answer"],
    userId: json["UserId"],
    applicationUser: json["ApplicationUser"],
    questionDate: DateTime.parse(json["QuestionDate"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Question": question,
    "Answer": answer,
    "UserId": userId,
    "ApplicationUser": applicationUser,
    "QuestionDate": questionDate.toIso8601String(),
  };
}
