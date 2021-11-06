import 'package:crud_provider/model/res_get_mahasiswa.dart';
import 'package:crud_provider/repository/repo_mahasiswa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MahasiswaProvider extends ChangeNotifier {

  List<Datum> listMahasiswa = [];
  bool isLoading = true;


  MahasiswaProvider() {
    this.getData();
  }

  //get data mahasiswa
  void getData() async {
    isLoading = true;
    notifyListeners();
    repoMahasiswa.getMahasiswa().then((value) {
      isLoading = false;
      if (value != null) {
        listMahasiswa = value;
        print(listMahasiswa);
      }
      notifyListeners();
    });
  }

  void addData(context, Datum mahasiswa) {
    repoMahasiswa.addMahasiswa(mahasiswa).then((value) {
      if (value != null) {
        Navigator.pop(context, true);
      } else {
        Fluttertoast.showToast(
            msg: 'Data tidak boleh kosong',
            toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black12,
          textColor:  Colors.white,
          fontSize: 16
        );
      }
    });
  }

  void updateData(context, Datum mahasiswa) {
    repoMahasiswa.updateData(mahasiswa).then((value) {
      if (value != null) {
        Navigator.pop(context, true);
      } else {
        Fluttertoast.showToast(
            msg: 'Data tidak boleh kosong',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black12,
            textColor:  Colors.white,
            fontSize: 16
        );
      }
    });
  }

  void deleteData(int index, Datum mahasiswa){
    repoMahasiswa.deleteData(mahasiswa).then((value) {
      if(value != null){
        listMahasiswa.removeAt(index);
      }
      notifyListeners();
    });
  }

  void rebuildData() async {
    listMahasiswa = [];
    notifyListeners();
    getData();
  }


}