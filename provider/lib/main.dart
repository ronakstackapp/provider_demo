import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/provider_demo/provider_api.dart';

import 'provider_demo/provider_api_page_demo.dart';

/*void main() {
  runApp(MultiProvider(
    providers: [
     // ChangeNotifierProvider(create: (context) => VimeoDataProvider()),
      ChangeNotifierProvider(create: (context) => ProviderPageApi()),
    ],
    child: MyApp(),
  ));
}*/

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) =>ProviderPageApi(),)
  ],
  child: MyApp()));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("provider"),
      ),
      body: Center(
        child: MaterialButton(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.white),
          ),
          color: Colors.teal,
          minWidth: 20,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProviderApiDemo(),
                ));
          },
          child: Text("provider"),
        ),
      ),
    );
  }
}
