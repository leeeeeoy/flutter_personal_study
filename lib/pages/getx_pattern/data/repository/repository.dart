import 'package:flutter_study/pages/getx_pattern/data/provider/api.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }
}
