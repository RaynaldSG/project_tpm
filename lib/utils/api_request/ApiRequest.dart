import 'BaseNetwork.dart';

class ApiRequest {
  static ApiRequest instance = ApiRequest();

  // Req Hotels Data
  Future<Map<String, dynamic>> loadHotels() {
    return BaseNetwork.get("hotels");
  }

  // Req Hotel Detail
  Future<Map<String, dynamic>> loadDetailHotel(int id) {
    return BaseNetwork.get("hotels/$id");
  }

}
