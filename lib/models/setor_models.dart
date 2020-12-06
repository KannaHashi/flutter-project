part of 'models.dart';

List<SetorModels> setorModelsFromJson(String str) => List<SetorModels>.from(json.decode(str).map((x) => SetorModels.fromJson(x)));

String setorModelsToJson(List<SetorModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SetorModels {
  SetorModels({
    this.id,
    this.siswaId,
    this.suratAwal,
    this.ayatAwal,
    this.suratAkhir,
    this.ayatAkhir,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
    this.siswa,
  });

  int id;
  int siswaId;
  String suratAwal;
  String ayatAwal;
  String suratAkhir;
  String ayatAkhir;
  String keterangan;
  DateTime createdAt;
  DateTime updatedAt;
  Siswa siswa;

  factory SetorModels.fromJson(Map<String, dynamic> json) => SetorModels(
    id: json["id"],
    siswaId: json["siswa_id"] == null ? null : json["siswa_id"],
    suratAwal: json["surat_awal"],
    ayatAwal: json["ayat_awal"],
    suratAkhir: json["surat_akhir"],
    ayatAkhir: json["ayat_akhir"],
    keterangan: json["keterangan"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "siswa_id": siswaId == null ? null : siswaId,
    "surat_awal": suratAwal,
    "ayat_awal": ayatAwal,
    "surat_akhir": suratAkhir,
    "ayat_akhir": ayatAkhir,
    "keterangan": keterangan,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "siswa": siswa == null ? null : siswa.toJson(),
  };
}

class Siswa {
  Siswa({
    this.id,
    this.name,
    this.email,
    this.alamat,
    this.tanggalLahir,
    this.noTelp,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String email;
  String alamat;
  DateTime tanggalLahir;
  String noTelp;
  DateTime createdAt;
  DateTime updatedAt;

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    alamat: json["alamat"],
    tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
    noTelp: json["no_telp"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "alamat": alamat,
    "tanggal_lahir": "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
    "no_telp": noTelp,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
