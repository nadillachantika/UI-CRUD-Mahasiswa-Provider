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
}

final repoMahasiswa = RepoMahasiswa();
