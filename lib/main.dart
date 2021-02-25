import "package:flutter/material.dart";
import 'package:nappies_direct/views/MyStore.dart';
import 'package:nappies_direct/views/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MyStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NappiesApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          "/": (_) => HomePage(),
        },
      ),
    );
  }
}
