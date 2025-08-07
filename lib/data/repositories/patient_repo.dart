
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hms/application/core/network/dio_client.dart';

class PatientRepository {
  final Dio _dio = DioClient.create(); // use the same configured Dio instance

  Future<dynamic> fetchPatientdata() async {
    try {
      final response = await _dio.get(
        'PatientList',
      );

      log('API response: ${response.data}');

      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception('Failed to load game assets');
      }
    } on DioException catch (e) {
      log('Dio error: ${e.response?.statusCode} - ${e.message}');
      throw Exception('Failed to fetch game assets');
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('Something went wrong');
    }
  }
}