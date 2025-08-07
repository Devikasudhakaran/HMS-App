import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://flutter-amr.noviindus.in/api/'));

  Future<Response> login(String username, String password) {
    return _dio.post('Login', data: FormData.fromMap({
      'username': username,
      'password': password,
    }));
  }

  Future<Response> getPatientList(String token) {
    return _dio.get('PatientList', options: Options(
      headers: {'Authorization': 'Bearer $token'},
    ));
  }

  Future<Response> getBranchList(String token) {
    return _dio.get('BranchList', options: Options(
      headers: {'Authorization': 'Bearer $token'},
    ));
  }

  Future<Response> getTreatmentList(String token) {
    return _dio.get('TreatmentList', options: Options(
      headers: {'Authorization': 'Bearer $token'},
    ));
  }

  Future<Response> registerPatient(String token, Map<String, dynamic> patientData) {
    return _dio.post('PatientUpdate',
      data: FormData.fromMap(patientData),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
