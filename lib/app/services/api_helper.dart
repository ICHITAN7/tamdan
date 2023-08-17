import'package:dio/dio.dart';
import'dart:io';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
class APIhelper {
  final dio = Dio();
  String url = 'http://127.0.0.1:8000/api/auth';
  Future<String> register({
    required String name,
    required String email,
    required String password,
    File? profile,
  }) async {
    var formdata = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'profile_image': await MultipartFile.fromFile(profile!.path)
    });
    Response response = await dio.post(
        "$url/register",
        data: formdata,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
          'accept': 'application/json'
        })
    );
    if (response.statusCode == 200) {
      return 'Register Success';
    }
    else {
      return 'Failed to register';
    }
  }

  Future<String> login({
    required String email,
    required String password
  }) async {
    var formdata = FormData.fromMap({
      'email': email,
      'password': password
    });
    Response loginResponse = await dio.post(
      "$url/login",
      data: formdata,
      options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data'
          }
      ),

    );
    if (loginResponse.statusCode == 200) {
      return loginResponse.data['access_token'];
    }
    else {
      return 'Failed to login';
    }
  }

  Future<dynamic> logout({required String accessToken}) async {
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    Response logoutResponse = await dio.post("$url/logout",);
    if (logoutResponse.statusCode == 200) {
      return 'Logout Success';
    }
    else {
      return 'Failed to logout';
    }
  }

  Future<dynamic> getProfile({required String accessToken}) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $accessToken';
      Response profile = await dio.get("$url/one");
      if (profile.statusCode == 200) {
        return profile.data;
      }
      else if (profile.statusCode ==500){
        return 'Expired Token';
      }
      else {
        return 'Failed to get profile';
      }
    } catch (e) {
      Get.snackbar('Error : ',e.toString());
    }
  }

  Future<dynamic> getPost({required String accessToken}) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $accessToken';
      Response post = await dio.get("$url/getPost");
      if (post.statusCode == 200) {
        return post.data;
      }
      else if (post.statusCode ==500){
        return 'Expired Token';
      }
      else {
        return 'Failed to get profile';
      }
    }catch (e){
      Get.snackbar('Error : ',e.toString());
    }
  }
}
/*class APIhelpe {
  final dio = Dio();
  String url = 'http://127.0.0.1:8000/api/auth';

  Future<String> register({
    required String name,
    required String email,
    required String password,
    File? profile,
  }) async {
    try {
      var formdata = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'profile_image': await MultipartFile.fromFile(profile!.path),
      });

      Response response = await dio.post(
        "$url/register", // Removed the '+' after "$url"
        data: formdata,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return 'Success';
      } else {
        return response.data["Failed registration"];
      }
    } catch (e) {
      // Handle any Dio or file-related errors here
      print('Error during registration: $e');
      return "Failed registration";
    }
  }
}*/
