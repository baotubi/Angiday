import 'dart:async';
import 'dart:convert';
import 'package:food_management/model/config.dart';
import 'package:http/http.dart' as http;
class Todo {
  int id;
  String name;
  Todo({this.id, this.name});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(id: json["id_mon_an"], name: json["ten_mon_an"]);
  }
}
Future<List<Todo>> fetchTodos(http.Client  client) async{
  final response = await client.get(URL_TODOS); 
  if (response.statusCode == 200){
    Map<String,dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["result"]=="ok"){
      final todos = mapResponse["data"].cast<Map<String, dynamic>>();
      final listOfTodos = await todos.map<Todo>((json){
        return Todo.fromJson(json);
      }).toList();
      return listOfTodos;
    }else{
      return[];
    }
  } else{
    throw Exception('Failed to load Todo from the Internet');
  }
}
