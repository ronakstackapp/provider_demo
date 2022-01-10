import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:providerdemo/provider_api_map/vimeo_main_model.dart';


class VimeoDataProvider  extends ChangeNotifier{
  List<Datum>? tempDataList = [];


  Future<List<Datum>?> callAPI()async{

    Uri url = Uri.parse("https://api.vimeo.com/me/live_events");

    http.Response res = await http.get(url,headers: {
      'Authorization': 'Bearer 010c60afbaf0309051b10fcfda970850'
    });

    if(res.statusCode==200){
      Map<String,dynamic> response   =  jsonDecode(utf8.decode(res.bodyBytes));
      VimeoModel vimeoModel = VimeoModel.fromJson(response);

      return vimeoModel.data;
    }
    else{
      return null;
    }
  }
  notifyListeners();
}