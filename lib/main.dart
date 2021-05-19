import "package:flutter/material.dart";
import 'package:nappies_direct/views/MyStore.dart';
// import 'package:nappies_direct/views/MyStore.dart';
import 'package:nappies_direct/views/fakeStore.dart';
import 'package:nappies_direct/views/home.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NappiesApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (_) => HomePage(),
      },
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<FakeStore>(create: (_) => FakeStore()),
  ChangeNotifierProvider<MyStore>(create: (_) => MyStore()),
];
