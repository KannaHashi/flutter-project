part of 'view_models.dart';


Future createSiswa(String name, String email, String alamat,
    DateTime tanggalLahir, String noTelp) async {
  try {
    var data = {
      "name": name,
      "email": email,
      "alamat": alamat,
      "tanggal_lahir":
          "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
      "no_telp": noTelp,
    };
    var url = "https://flutter-project.herokuapp.com/api/siswa";
    var hasil = await http.post(url, body: (data));
    if (hasil.statusCode == 200) {
      print("Sukses menyimpan data");
      return true;
    } else {
      print("Gagal menyimpan data");
      print(data);
      return false;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

Future getSiswa() async {
  try { //
    http.Response hasil = await http.get(
        Uri.encodeFull("https://flutter-project.herokuapp.com/api/siswa"),
        headers: {"Accept": "application/json"}
    );

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan data Siswa");
      final data = postModelFromJson(hasil.body);
      return data;
    } else {
      print("Gagal");
      return null;
    }
  }
  catch (e) {
    print ("Error pada catch $e");
  }
}

Future getOneSiswa(String id) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://flutter-project.herokuapp.com/api/siswa/${id}"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan data setoran");
      final data = json.decode(hasil.body);
      print(data);
      return data;
//      return Hafalan.fromJson(data[0]);

    } else {
      print("Gagal menampikan 1 data");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

