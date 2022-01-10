

import 'package:providerdemo/provider_demo/provider_api.dart';
import 'package:providerdemo/provider_demo/provider_api_page_demo.dart';

class ProviderViewModel {
  ProviderApiDemoState state;

  ProviderViewModel(this.state) {
    this.state = state;
  }

  providerApi(ProviderPageApi provider) async {
    print("ProviderViewModel --> providerApi- method --> 0 -aaa-->${state.providerData!.dataList}");
    provider.dataList = state.providerData!.dataList;
    print("ProviderViewModel --> providerApi- method --> 1 --> ${provider.dataList}");
    print("ProviderViewModel --> providerApi- method --> 0 --bbb->${state.providerData!.dataList}");
    if(provider.dataList == null || provider.dataList.isEmpty )
      {
        print("provider.dataList == null -->0");
        provider.dataList = (await ProviderPageApi().providerApi())!;

        if(provider.dataList != null && provider.dataList.isNotEmpty){
          print("provider.dataList != null -->1");
          state.providerData!.dataList = provider.dataList;
        }
        provider.notifyListeners();
      }
  }
}
