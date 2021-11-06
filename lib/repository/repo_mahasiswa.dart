import 'package:crud_provider/model/res_get_mahasiswa.dart';
import 'package:http/http.dart' as http;

class RepoMahasiswa {
  final String BaseUrl = "http://192.168.20.22/servermahasiswa/";


  Future getMahasiswa() async{

    try {
      final response = await http.get(Uri.parse(BaseUrl + 'getMahasiswa.php'));
      if (resGetDataMahasiswaFromJson(response.body).isSuccess == true) {
        return resGetDataMahasiswaFromJson(response.body).data;
      } else {
        return null;
      }
    }catch(e){
      return e;
    }
  }
  
  Future addMahasiswa(Datum mahasiswa) async{
    try{
      final response = await http.post(Uri.parse(BaseUrl + 'addMahasiswa.php'), body: {
        'nama': mahasiswa.nama,
        'nim': mahasiswa.nim,
        'jurusan' : mahasiswa.jurusan,
        'alamat' : mahasiswa.alamat,
        'hp': mahasiswa.hp
      });

      if(resGetDataMahasiswaFromJson(response.body).isSuccess == true){
        return resGetDataMahasiswaFromJson(response.body);
      }

    }catch(e){
      return e;
    }
    
  }

  Future updateData(Datum mahasiswa) async{
    try{
      final response = await http.post(Uri.parse(BaseUrl + 'editMahasiswa.php'), body: {
        'nama': mahasiswa.nama,
        'nim': mahasiswa.nim,
        'jurusan' : mahasiswa.jurusan,
        'alamat' : mahasiswa.alamat,
        'hp': mahasiswa.hp,
        'id':mahasiswa.id
      });

      if(resGetDataMahasiswaFromJson(response.body).isSuccess == true){
        return resGetDataMahasiswaFromJson(response.body);
      }

    }catch(e){
      return e;
    }
  }

  Future deleteData(Datum mahasiswa) async{
    try{
      final response = await http.post(Uri.parse(BaseUrl+'deleteMahasiswa.php'),
      body: {
        'id' :mahasiswa.id
      });

      if( resGetDataMahasiswaFromJson(response.body).isSuccess == true){
        return resGetDataMahasiswaFromJson(response.body);
      }
    }catch(e){
      return e;
    }
  }




  
}

final repoMahasiswa = RepoMahasiswa();
