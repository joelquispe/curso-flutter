import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tutorialflutter/http/buildBaseUrl.util.dart';
import 'package:tutorialflutter/http/models/user.model.dart';

class UserExampleService {
  final endpoint = "users";
  final client = http.Client();
  Future<List<UserModel>?> findAll() async {
    try {
      final response = await client.get(buildBaseUrlUtil(endpoint));
      if (response.statusCode == 200) {
        List<UserModel> data = List.of(json.decode(response.body)).map((e) => UserModel.fromMap(e)).toList();
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log("Error: $e");
      rethrow;
    }
  }

  Future<void> save(UserModel data)async{
    try {
      final response = await client.post(buildBaseUrlUtil(endpoint),body: json.encode(data.toMap()));
      if(response.statusCode == 201){
         throw Exception("Error al guardar usuario");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> delete(String id)async{
    try {
      final response = await client.delete(buildBaseUrlUtil("$endpoint/$id"));
      if(response.statusCode != 200){
        throw Exception("Error al borrar usuario");
      }
    } catch (e) {
       throw Exception(e.toString());
    }
  }

  Future<void> update(String id, UserModel body) async{
     try {
      final response = await client.put(buildBaseUrlUtil("$endpoint/$id"),body: json.encode(body.toMap()) );
      if(response.statusCode != 200){
        throw Exception("Error al editar usuario");
      }
    } catch (e) {
       throw Exception(e.toString());
    }
  }

  Future<UserModel> findById(String id) async{
    try {
      final response = await client.get(buildBaseUrlUtil("$endpoint/$id")); 
      final data = UserModel.fromMap(json.decode(response.body));
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
}
