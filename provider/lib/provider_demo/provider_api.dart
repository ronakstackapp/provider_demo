import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:providerdemo/provider_demo/provider_response.dart';


class ProviderPageApi extends ChangeNotifier {

  List<ProviderResponse> dataList = [];

 Future<List<ProviderResponse>?> providerApi() async {
   print("ProviderPageApi --> ChangeNotifier ***");
    String url = 'https://picsum.photos/v2/list?page=1&limit=20';
    print('url---> $url');
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('response code: ${response.body}');
        return providerResponseFromJson(response.body);
      } else {
        print('response: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('catch error in DemoPage API --->$e');
      return null;
    }
  }
  notifyListeners();
}
