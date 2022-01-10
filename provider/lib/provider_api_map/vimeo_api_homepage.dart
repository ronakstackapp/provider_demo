import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/provider_api_map/provider_class.dart';

import 'provider_view_model.dart';

class VimeoApiProviderHomePage extends StatefulWidget {
  const VimeoApiProviderHomePage({Key? key}) : super(key: key);

  @override
  VimeoApiProviderHomePageState createState() =>
      VimeoApiProviderHomePageState();
}

class VimeoApiProviderHomePageState extends State<VimeoApiProviderHomePage> {
  VimeoViewModel? model;
  VimeoDataProvider? providerData;
  bool isRefresh = false;

  @override
  Widget build(BuildContext context) {
    providerData = Provider.of<VimeoDataProvider>(context, listen: false);

    model ?? (model = VimeoViewModel(this));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("List of user"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            isRefresh = true;
            providerData!.tempDataList = [];
            setState(() {});
            return Future.delayed(Duration(milliseconds: 1500));
          },
          backgroundColor: Colors.teal,
          color: Colors.white,
          child: ChangeNotifierProvider<VimeoDataProvider>(
              create: (context) => VimeoDataProvider(),
              child: Consumer<VimeoDataProvider>(
                builder: (context, provider, _) {
                  if (provider.tempDataList!.length == 0 || isRefresh) {
                    model!.getData(provider);
                  }

                  return (provider.tempDataList != null &&
                          provider.tempDataList!.isNotEmpty)
                      ? ListView.builder(
                          itemCount: provider.tempDataList!.length,
                          itemExtent: 130,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            String url =
                                '${provider.tempDataList![i].pictures!.baseLink}';
                            return Card(
                              color: Colors.teal.shade50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CachedNetworkImage(
                                      imageUrl: url,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.teal,
                                      )),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GetRow(
                                            title: 'Status',
                                            value:
                                                '${provider.tempDataList![i].clipToPlay!.live!.status![0].toUpperCase()}${provider.tempDataList![i].clipToPlay!.live!.status!.substring(1)}',
                                            clr: Colors.teal.shade700,
                                            weight: FontWeight.bold),
                                        GetRow(
                                            title: 'Date',
                                            value: (provider
                                                        .tempDataList![i]
                                                        .clipToPlay!
                                                        .live!
                                                        .scheduledStartTime
                                                        .toString()
                                                        .split(' ')[0] ==
                                                    "null")
                                                ? ' -'
                                                : provider
                                                    .tempDataList![i]
                                                    .clipToPlay!
                                                    .live!
                                                    .scheduledStartTime
                                                    .toString()
                                                    .split(' ')[0]),
                                        GetRow(
                                            title: 'Title',
                                            value:
                                                provider.tempDataList![i].title)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
                      : (isRefresh)
                          ? SizedBox()
                          : Center(
                              child: CircularProgressIndicator(
                              color: Colors.teal,
                            ));
                },
              )),
        ));
  }
}

class GetRow extends StatelessWidget {
  final String? title,value;
  final Color? clr;
  final FontWeight? weight;

  GetRow({Key? key,this.title,this.value,this.weight,this.clr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$title :",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal),),
        Expanded(flex: 2,child: Text(' $value',style: TextStyle(color: clr,fontWeight: weight),maxLines: 2,)),
      ],
    );
  }
}

