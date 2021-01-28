import "package:flutter/material.dart";
import 'package:nappies_direct/views/home.dart';

void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NappiesApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,),
      routes: {
        "/":(_) => HomePage(),
      },
    );
  }
}