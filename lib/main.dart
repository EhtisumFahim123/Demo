import 'package:eshogol/home/Sign_up1.dart';
import 'package:eshogol/home/Sign_up2.dart';
import 'package:eshogol/home/gender_selection_page.dart';
import 'package:eshogol/home/home_address.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
debugShowCheckedModeBanner: false,
      home: Sign_up1(),

    );
  }
}
// changes