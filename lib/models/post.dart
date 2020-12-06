// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);
part of 'models.dart';

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    this.id,
    this.name,
    this.email,
    this.alamat,
    this.tanggalLahir,
    this.noTelp,
    this.createdAt,
    this.updatedAt,
    this.hafalan,
  });

  int id;
  String name;
  String email;
  String alamat;
  DateTime tanggalLahir;
  String noTelp;
  DateTime createdAt;
  DateTime updatedAt;
  List<Hafalan> hafalan;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    alamat: json["alamat"],
    tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
    noTelp: json["no_telp"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    hafalan: List<Hafalan>.from(json["hafalan"].map((x) => Hafalan.fromJson(x))),
  );
  //List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));
  //String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "alamat": alamat,
    "tanggal_lahir": "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
    "no_telp": noTelp,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "hafalan": List<dynamic>.from(hafalan.map((x) => x.toJson())),
  };
}

class Hafalan {
  Hafalan({
    this.id,
    this.siswaId,
    this.suratAwal,
    this.ayatAwal,
    this.suratAkhir,
    this.ayatAkhir,
    this.audio,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int siswaId;
  String suratAwal;
  String ayatAwal;
  String suratAkhir;
  String ayatAkhir;
  String audio;
  String keterangan;
  DateTime createdAt;
  DateTime updatedAt;

  factory Hafalan.fromJson(Map<String, dynamic> json) => Hafalan(
    id: json["id"],
    siswaId: json["siswa_id"],
    suratAwal: json["surat_awal"],
    ayatAwal: json["ayat_awal"],
    suratAkhir: json["surat_akhir"],
    ayatAkhir: json["ayat_akhir"],
    audio: json["audio"],
    keterangan: json["keterangan"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "siswa_id": siswaId,
    "surat_awal": suratAwal,
    "ayat_awal": ayatAwal,
    "surat_akhir": suratAkhir,
    "ayat_akhir": ayatAkhir,
    "audio": audio,
    "keterangan": keterangan,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
