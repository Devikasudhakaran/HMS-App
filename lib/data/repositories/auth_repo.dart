

// import 'package:hms/application/core/resources/repository_resource.dart';
//
// import '../../application/core/services/api_service.dart';
// import '../../application/features/data/data_resorce/response/user.response.dart';
// import '../../application/features/data/data_resorce/userloginreqmodel.dart';

// class UserRepo {
//   final ApiService userApi;
//   UserRepo({required this.userApi,});
//
//
//   Future<RepoResource<UserResponse>> login(UserLoginReq userLoginReq) async {
//     UserResponse response = await userApi.login(userLoginReq);
//     return RepoResource(RepoResourceType.NETWORK, response);
//   }
//
//
// }

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../application/core/network/dio_client.dart';
import '../../application/core/storage.dart';

class AuthRepository {
  final Dio _dio = DioClient.create();

  Future<Response> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://flutter-amr.noviindus.in/api/Login',
        data: FormData.fromMap({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode != 200|| response.data['status'] != true) {
        throw Exception('${response.data['message']}');
      }
      final token = response.data['token'];
      if (token != null) {
        log('Login token: $token');
        await SecureStorage.writeToken(token);
      }

      return response;
    } on DioException catch (e) {
      throw Exception('Login failed: ${e.response?.data ?? e.message}');
    }
  }
}