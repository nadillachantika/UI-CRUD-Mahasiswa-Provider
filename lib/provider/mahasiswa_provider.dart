import 'package:crud_provider/model/res_get_mahasiswa.dart';
import 'package:crud_provider/repository/repo_mahasiswa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MahasiswaProvider extends ChangeNotifier{

  List<Datum> listMahasiswa = [];
  bool isLoading = true;
}