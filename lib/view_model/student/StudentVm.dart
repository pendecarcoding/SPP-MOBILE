import 'package:flutter/material.dart';
import 'package:spp/data/remote/response/ApiResponse.dart';
import 'package:spp/models/students/StudentModel.dart';
import 'package:spp/repository/students/StudentRepolmp.dart';

class StudentVm extends ChangeNotifier {
  final _myRepo = StudentRepolmp();

  ApiResponse<StudentModel> data = ApiResponse.loading();

  void _setData(ApiResponse<StudentModel> response) {
    print("MARAJ :: $response");
    data = response;
    notifyListeners();
  }

  Future<void> fetchData() async {
    _setData(ApiResponse.loading());
    _myRepo
        .getStudents()
        .then((value) => _setData(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setData(ApiResponse.error(error.toString())));
  }
}
