
import 'dart:convert';


import 'package:http/http.dart';

import '../models/post_model.dart';

class NetworkService{

  // URL
  static String baseUrl = '62b6a84142c6473c4b4619ad.mockapi.io';

  // HEADERS
  static Map<String, String> headers = {
    'Content-type' : 'application/json; charset=UTF-8'
  };


  // APIS

  static String GetPosts = '/post';
  static String GetPost = '/post/';
  static String CreatePost = '/post/';
  static String UpdatePost = '/post/';
  static String DeletePost = '/post/';

  // GET

  static Future<String> GET(String api, Map<String, String> params)async{
    Uri uri = Uri.https(baseUrl, api);
    Response response = await get(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

  // PUT

  static Future<String> PUT(String api, Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await put(uri, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

  // POST

  static Future<String> POST(String api, Map<String, dynamic> body) async{
    Uri uri = Uri.https(baseUrl, api);
    Response response = await post(uri, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

  // PATCH

  static Future<String> PUTCH(String api, Map<String, String> headers, Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await patch(uri, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

  // DELETE

  static Future<String> DELETE(String api, Map<String, String> headers)async{
    Uri uri = Uri.https(baseUrl, api);
    Response response = await delete(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception('Error');
    }
  }

// PARAM

  static Map<String, String> paramsEmpty() {
    Map<String, String> map = {};
    return map;
  }

  static Map<String, dynamic> editPost(Post post){
    Map<String, dynamic> map = {
    'userId' : post.userId,
    'id' : post.id,
    'title' : post.title,
    'body' : post.body,
    };
    return map;
  }

  static Map<String, dynamic> createPost(Post post){
    Map<String, dynamic> map = {
      'userId' : post.userId,
      'id' : post.id,
      'title' : post.title,
      'body' : post.body,
    };
    return map;
  }

}