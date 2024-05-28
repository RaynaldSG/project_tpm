import 'BaseNetwork.dart';

class ApiRequest {
  static ApiRequest instance = ApiRequest();

  // Req Hotels Data
  Future<Map<String, dynamic>> loadHotels() {
    return BaseNetwork.get("hotels");
  }

}
