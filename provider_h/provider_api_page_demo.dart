import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheet_widget_demo/ApiCallingWithPagination/demo_page_api.dart';
import 'package:sheet_widget_demo/provider/provider_api.dart';
import 'package:sheet_widget_demo/provider/provider_api_view_model.dart';
import 'package:sheet_widget_demo/utils/color.dart';

class ProviderApiDemo extends StatefulWidget {
  const ProviderApiDemo({Key key}) : super(key: key);

  @override
  ProviderApiDemoState createState() => ProviderApiDemoState();
}

class ProviderApiDemoState extends State<ProviderApiDemo> {
  DemoPageApi demoPageApi = DemoPageApi();
  ProviderViewModel model;
  ProviderPageApi providerData;

  @override
  Widget build(BuildContext context) {
    print("currant page-->$runtimeType");
    // ignore: unnecessary_statements
    providerData = Provider.of<ProviderPageApi>(context, listen: false);

    model ?? (model = ProviderViewModel(this));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text("Provider demo"),
      ),
      body: ChangeNotifierProvider<ProviderPageApi>(
        create: (BuildContext context) {
          return ProviderPageApi();
        },
        child: Consumer<ProviderPageApi>(
          builder: (context, provider, _) {
            if (provider.dataList.length == 0) {
              model.providerApi(provider);
            }
            return (provider.dataList != null && provider.dataList.isNotEmpty)
                ? ListView.builder(
                    itemCount: provider.dataList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(13),
                              child: Text(
                                " id : ${provider.dataList[index].id}",
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(13),
                              child: Text(
                                  " author : ${provider.dataList[index].author}"),
                            ),
                          ],
                        ),
                      );
                    })
                : Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}
