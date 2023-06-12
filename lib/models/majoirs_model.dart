class MajorsModel{
  int? Id;
  String? MajorName;


  MajorsModel({this.Id, this.MajorName,  });


  factory MajorsModel.fromJson(Map<String, dynamic> json) {
    return MajorsModel(
      Id: json['Id'],
      MajorName: json['MajorName'],


    );
  }



}