import 'package:spp/models/login/LoginModel.dart';
import 'package:spp/repository/login/LoginRepo.dart';

import '../../data/remote/network/ApiEndPoints.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';

class LoginRepolpm implements LoginRepo {
  get http => null;
  BaseApiService _apiService = NetworkApiService();
  @override
  Future<LoginModel?> DetailAccount() {
    // TODO: implement DetailAccount
    throw UnimplementedError();
  }

  @override
  Future<LoginModel?> LoginPost(email, password) async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().Loginpost);
      print("MARAJ $response");
      final jsonData = LoginModel.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
      print("MARAJ-E $e}");
    }
  }

  @override
  Future<LoginModel?> Logout() {
    // TODO: implement Logout
    throw UnimplementedError();
  }
}
