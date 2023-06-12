class MajorsMedicalModel{
  int? Id;
  String? MajorName;


  MajorsMedicalModel({this.Id, this.MajorName,  });


  factory MajorsMedicalModel.fromJson(Map<String, dynamic> json) {
    return MajorsMedicalModel(
      Id: json['Id'],
      MajorName: json['CatgName'],


    );
  }



}