// To parse this JSON data, do
//
//     final resGetDataMahasiswa = resGetDataMahasiswaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResGetDataMahasiswa resGetDataMahasiswaFromJson(String str) => ResGetDataMahasiswa.fromJson(json.decode(str));

String resGetDataMahasiswaToJson(ResGetDataMahasiswa data) => json.encode(data.toJson());

class ResGetDataMahasiswa {
  ResGetDataMahasiswa({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  bool isSuccess;
  String message;
  List<Datum> data;

  factory ResGetDataMahasiswa.fromJson(Map<String, dynamic> json) => ResGetDataMahasiswa(
    isSuccess: json["is_success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.alamat,
    required this.hp,
  });

  String id;
  String nama;
  String nim;
  String jurusan;
  String alamat;
  String hp;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nama: json["nama"],
    nim: json["nim"],
    jurusan: json["jurusan"],
    alamat: json["alamat"],
    hp: json["hp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "nim": nim,
    "jurusan": jurusan,
    "alamat": alamat,
    "hp": hp,
  };
}
