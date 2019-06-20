import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_management/model/config.dart';
import 'package:http/http.dart' as http;
import 'package:food_management/screen/danhsachmonan.dart';

class MonAnChiTiet {
  String id_mon_an;
  String ten_mon_an;
  dynamic hinh_mon_an;
  String mo_ta;
  dynamic nguyen_lieu;
  dynamic thuc_hien;

  MonAnChiTiet({
    this.id_mon_an,
    this.ten_mon_an,
    this.hinh_mon_an,
    this.mo_ta,
    this.nguyen_lieu,
    this.thuc_hien
  });

  factory MonAnChiTiet.fromJson(Map<String, dynamic> json) {
    MonAnChiTiet ChiTiet = MonAnChiTiet(
      id_mon_an: json["id_mon_an"],
      ten_mon_an: json["ten_mon_an"], 
      hinh_mon_an: json["hinh_mon_an"],
      mo_ta: json["mo_ta"],
      nguyen_lieu: json["nguyen_lieu"],
      thuc_hien: json["thuc_hien"]
    );
    return ChiTiet;
  }

  // factory MonAnChiTiet.fromChiTietMonAn(MonAnChiTiet _ChiTiet) {
  //   return MonAnChiTiet(
  //     id_mon_an: _ChiTiet.id_mon_an,
  //     ten_mon_an: _ChiTiet.ten_mon_an, 
  //     hinh_mon_an: _ChiTiet.hinh_mon_an,
  //     mo_ta: _ChiTiet.mo_ta,
  //     nguyen_lieu: _ChiTiet.nguyen_lieu,
  //     thuc_hien: _ChiTiet.thuc_hien,
  //   );
  // }
}


Future<List<MonAnChiTiet>> fetchChiTietMonAn(http.Client client, String id) async {
  final response = await client.get('$URL_GetChiTietMonAn$id');
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "ok") {
      final monans = mapResponse["data"].cast<Map<String, dynamic>>();
      // print(monans[0]['hinh_mon_an']);
      final listOfMonans = await monans.map<MonAnChiTiet>((json) {
        return (MonAnChiTiet.fromJson(json));
      }).toList();
      return listOfMonans;
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load MonAn from the Internet');
  }
}
