part of 'view_models.dart';

// Future getHafalan() async {
//   try {
//     http.Response hasil = await http.get(
//         Uri.encodeFull("https://flutter-project.herokuapp.com/api/setor"),
//         headers: {"Accept": "application/json"});

//     if (hasil.statusCode == 200) {
//       print("Sukses Menampilkan Data");
//       final data = hafalanModelFromJson(hasil.body);
//       return data;
//     } else {
//       print("Gagal");
//       return null;
//     }
//   } catch (e) {
//     print("Error pada Catch $e");
//   }
// }
Future getAllHafalan() async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://flutter-project.herokuapp.com/api/setor"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan data");
      final data = setorModelsFromJson(hasil.body);
      return data;
    } else {
      print("Gagal menampikan data");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

Future createHafalan(String siswaId, String suratAwal, String ayatAwal,
    String suratAkhir, String ayatAkhir, String keterangan) async {
  try {
    var data = {
      "siswa_id": siswaId,
      "surat_awal": suratAwal,
      "ayat_awal": ayatAwal,
      "surat_akhir": suratAkhir,
      "ayat_akhir": ayatAkhir,
      "keterangan": keterangan,
    };
    var url = "https://flutter-project.herokuapp.com/api/setor";
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

Future getSingleDataHafalan(String id) async {
  try {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://flutter-project.herokuapp.com/api/setor/${id}"),
        headers: {"Accept": "application/json"});

    if (hasil.statusCode == 200) {
      print("Sukses menampilkan 1 data");
      final data = json.decode(hasil.body);
      print(data);
      return data;
    } else {
      print("Gagal menampikan 1 data");
      return null;
    }
  } catch (e) {
    print("Error pada catch $e");
  }
}

Future deleteHafalan(String id) async {
  try {
    var url = "https://flutter-project.herokuapp.com/api/setor/${id}";
    var hasil = await http.delete(url);
    if (hasil.statusCode == 200) {
      print("Sukses Delete Data");
      return true;
    } else {
      print("Gagal Delete Data");
      return false;
    }
  } catch (e) {
    print("Error pada Catch $e");
  }
}
