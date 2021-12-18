import 'package:flutter_study/pages/state_management/getx_pattern/data/provider/api.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({
    required this.apiClient,
  });

  getAll() {
    return apiClient.getAll();
  }
}
