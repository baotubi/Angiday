import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_management/model/config.dart';
import 'package:http/http.dart' as http;

class MonAn {
  String id_mon_an;
  String ten_mon_an;
  dynamic hinh_mon_an;
  String mo_ta;

  MonAn({
    this.id_mon_an,
    this.ten_mon_an,
    this.hinh_mon_an,
    this.mo_ta,
  });

  factory MonAn.fromJson(Map<String, dynamic> json) {
    return MonAn(
      id_mon_an: json["id_mon_an"],
      ten_mon_an: json["ten_mon_an"],
      // hinh_mon_an: HinhMonAn.fromJson(json['hinh_mon_an']),
      hinh_mon_an: json["hinh_mon_an"],
      mo_ta: json["mo_ta"],
    );
  }
}


Future<List<MonAn>> fetchMonAns(http.Client client) async {
  final response = await client.get(URL_TODOS);
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"] == "ok") {
      final monans = mapResponse["data"].cast<Map<String, dynamic>>();
      // print(monans[0]['hinh_mon_an']);
      final listOfMonans = await monans.map<MonAn>((json) {
        return (MonAn.fromJson(json));
      }).toList();
      return listOfMonans;
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load MonAn from the Internet');
  }
}
