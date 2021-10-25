import 'package:crud_provider/model/res_get_mahasiswa.dart';
import 'package:http/http.dart' as http;

class RepoMahasiswa {
  final String BaseUrl = "http://192.168.20.83/servermahasiswa/";

  Future getMahasiswa() async {
    try {
      final response = await http.get(Uri.parse(BaseUrl + 'getMahasiswa.php'));
      if (resDataMahasiswaFromJson(response.body).isSuccess == true) {
        return resDataMahasiswaFromJson(response.body).data;
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }

  Future addMahasiswa(Datum mahasiswa) async {
    try {
      final response =
          await http.post(Uri.parse(BaseUrl + 'addMahasiswa.php'), body: {
        'nama': mahasiswa.nama,
        'nim': mahasiswa.nim,
        'jurusan': mahasiswa.jurusan,
        'alamat': mahasiswa.alamat,
        'hp': mahasiswa.hp
      });
      if (resDataMahasiswaFromJson(response.body).isSuccess == true) {
        return resDataMahasiswaFromJson(response.body);
      }
    } catch (e) {
      return e;
    }
  }

  Future updateMahasiswa(Datum mahasiswa) async {
    try {
      final response =
      await http.post(Uri.parse(BaseUrl + 'editMahasiswa.php'), body: {
        'nama': mahasiswa.nama,
        'nim': mahasiswa.nim,
        'jurusan': mahasiswa.jurusan,
        'alamat': mahasiswa.alamat,
        'hp': mahasiswa.hp,
        'id': mahasiswa.id,
      });

      if (resDataMahasiswaFromJson(response.body).isSuccess == true) {
        return resDataMahasiswaFromJson(response.body);
      }
    }catch(e){
      return e;
    }
  }

  Future deleteMahasiswa(Datum mahasiswa) async{
    try{
      final response = await http.post(Uri.parse(BaseUrl + 'deleteMahasiswa.php'), body: {
        'id' : mahasiswa.id

      });

      if(resDataMahasiswaFromJson(response.body).isSuccess == true){
        return resDataMahasiswaFromJson(response.body);
      }
    }catch(e){
      return e;
    }
  }
}

final repoMahasiswa = RepoMahasiswa();
