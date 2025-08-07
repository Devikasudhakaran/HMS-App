

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

import 'package:dio/dio.dart';

import '../../application/core/network/dio_client.dart';
import '../../application/core/storage.dart';

class AuthRepository {
  final Dio _dio = DioClient.create();

  Future<Response> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'Login',
        data: FormData.fromMap({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Login failed with status code: ${response.statusCode}');
      }
      final token = response.data['data']?['accessToken'];
      if (token == null) {
        // await SecureStorage.writeToken(token);
        throw Exception('Token not found in response');
      }

      await SecureStorage.writeToken(token);
      return token;
    } on DioException catch (e) {
     // throw Exception('Login failed: ${e.response?.data ?? e.message}');
      throw Exception('Login failed: ${e.response?.data?['message'] ?? e.message}');
    }
  }
}