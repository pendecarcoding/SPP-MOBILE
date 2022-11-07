import 'package:flutter/cupertino.dart';
import 'package:spp/models/login/LoginModel.dart';
import 'package:spp/repository/login/LoginRepolpm.dart';

import '../../data/remote/response/ApiResponse.dart';

class LoginVM extends ChangeNotifier {
  final _myRepo = LoginRepolpm();

  ApiResponse<LoginModel> login = ApiResponse.loading();

  void _setMain(ApiResponse<LoginModel> response) {
    print("MARAJ :: $response");
    login = response;
    notifyListeners();
  }

  //Login Data
  Future<void> actlogin(String email, String password) async {
    _setMain(ApiResponse.loading());
    _myRepo.LoginPost(email, password)
        .then((value) => _setMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setMain(ApiResponse.error(error.toString())));
  }
}
