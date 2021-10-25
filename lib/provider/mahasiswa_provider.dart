import 'package:crud_provider/model/res_get_mahasiswa.dart';
import 'package:crud_provider/repository/repo_mahasiswa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MahasiswaProvider extends ChangeNotifier{

  List<Datum> listMahasiswa = [];
  bool isLoading = true;

  MahasiswaProvider(){
    this.getData();
  }

  void getData(){
    isLoading = true;
    notifyListeners();
    repoMahasiswa.getMahasiswa().then((value){
      isLoading = false;
      if(value != null){
        listMahasiswa = value;
      }
      notifyListeners();


    });
  }

  void addMahasiswa(context, Datum mahasiswa){
    repoMahasiswa.addMahasiswa(mahasiswa).then((value) {
      if (value != null) {
        Navigator.pop(context, true);
        // repoMahasiswa.
      } else {

        Navigator.pop(context);
      }
    });
  }

  void updateMahasiswa(context, Datum mahasiswa){
    repoMahasiswa.updateMahasiswa(mahasiswa).then((value){
      if(value != null){
        Navigator.pop(context, true);
      }else{
        // mahasiswa.nama.er
        Fluttertoast.showToast(
            msg: "Semua Data Harus di isi",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );      }
    });
  }

  void deleteMahasiswa(int index, Datum mahasiswa){
    repoMahasiswa.deleteMahasiswa(mahasiswa).then((value) {
      if(value != null){
        listMahasiswa.removeAt(index);
      }
      notifyListeners();
    });
  }

  void rebuildData() async{
    listMahasiswa = [];
    notifyListeners();
    getData();
  }
}