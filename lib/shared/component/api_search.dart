import 'dart:convert';

import 'package:hayat/models/clinic_model.dart';
import 'package:http/http.dart' as http;

class FetchClinic{
  var data=[];
  List<Clinic>result=[];
  String url2 = 'http://eibtekone-001-site11.atempurl.com/api/GetAllClincs';
  Future<List<Clinic>> getSearch2({String? query}) async {
    var url =  Uri.parse(url2);
    var response=await http.get(url);
    try{
      if(response.statusCode==200){
        print(await response.body);
        data=json.decode(response.body);
        result=data.map((e) => Clinic.fromJson(e)).toList();
        if(query!=null){
          result=result.where((element) => element.clinName!.toLowerCase().contains(query.toLowerCase()) ).toList();
        }
      }else{
        print('fail');
      }
    }on Exception catch(e){
      print('e=${e}');
    }
    return result;

  }
}