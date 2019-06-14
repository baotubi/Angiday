import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_management/batdau.dart';
import 'package:food_management/chitietmonan.dart';
import 'package:food_management/danhsachmonan.dart';
import 'package:food_management/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: testt(),
      home: ChiTietMonAn()
      // home: DanhSachMonAn() 
      // home: BatDau()
    );
  }
}
