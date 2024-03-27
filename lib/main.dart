// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part2/pages/todo_page.dart';

void main() async{
    await Hive.initFlutter();

    var box= await Hive.openBox('myBox');
    runApp( MyApp());
  }

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDOPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,)
      
    );
    
  }
}