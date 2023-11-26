import 'package:tugas_akhir/API/BaseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadgame() {
return BaseNetwork.get("api/amiibo/?name=mario");
}

  loadDetaiUser(int idUser) {}

}