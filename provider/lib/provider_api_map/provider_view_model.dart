

import 'package:providerdemo/provider_api_map/provider_class.dart';
import 'package:providerdemo/provider_api_map/vimeo_api_homepage.dart';

class VimeoViewModel {
  VimeoApiProviderHomePageState? state;

  VimeoViewModel(this.state) {
    this.state = state;
  }

  getData(VimeoDataProvider provider) async {
    // Future.delayed(Duration(milliseconds: 300));

    provider.tempDataList = state!.providerData?.tempDataList;

    if (provider.tempDataList == null ||
        provider.tempDataList!.isEmpty ||
        state!.isRefresh) {
      provider.tempDataList = await provider.callAPI();

      state!.isRefresh = false;

      if (provider.tempDataList != null && provider.tempDataList!.isNotEmpty) {
        state!.providerData?.tempDataList = provider.tempDataList;
      }
      provider.notifyListeners();
    }
  }
}
