import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_management/screen/batdau.dart';
import 'package:food_management/screen/chitietmonan.dart';
import 'package:food_management/screen/danhsachmonan.dart';
import 'package:food_management/screen/test_silverbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: testt(),
      // home: ChiTietMonAn()
      home: DanhSachMonAn() 
      // home: BatDau()
    );
  }
}
