import 'dart:convert';

LoginModel datasMainFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  LoginModel({
    this.datas,
  });

  final datas;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        datas: json["data"] == null
            ? null
            : json["data"].map((x) => Data.fromJson(x)),
      );
}

class Data {
  Data({
    required this.id,
    required this.nama,
    required this.email,
    required this.alamat,
    required this.id_sekolah,
  });

  String id;
  String nama;
  String email;
  String alamat;
  String id_sekolah;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        email: json["email"] == null ? null : json["email"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        id_sekolah: json["alamat"] == null ? null : json["id_sekolah"],
      );
}
