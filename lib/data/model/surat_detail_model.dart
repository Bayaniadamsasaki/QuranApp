import 'dart:convert';

class SuratDetailModel {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
  bool? status;
  List<Ayat>? ayat;
  SuratSelanjutnya? suratSelanjutnya;
  bool? suratSebelumnya;

  SuratDetailModel({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
    this.status,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory SuratDetailModel.fromJson(dynamic json) {
    if (json is String) {
      return SuratDetailModel.fromMap(jsonDecode(json));
    } else {
      return SuratDetailModel.fromMap(json);
    }
  }

  String toJson() => json.encode(toMap());

  factory SuratDetailModel.fromMap(Map<String, dynamic> json) =>
      SuratDetailModel(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
        status: json["status"],
        ayat: json["ayat"] == null
            ? []
            : List<Ayat>.from(json["ayat"]!.map((x) => Ayat.fromMap(x))),
        suratSelanjutnya: json["surat_selanjutnya"] == null
            ? null
            : SuratSelanjutnya.fromMap(json["surat_selanjutnya"]),
        // suratSebelumnya: json["surat_sebelumnya"],
      );

  Map<String, dynamic> toMap() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "status": status,
        "ayat":
            ayat == null ? [] : List<dynamic>.from(ayat!.map((x) => x.toMap())),
        "surat_selanjutnya": suratSelanjutnya?.toMap(),
        "surat_sebelumnya": suratSebelumnya,
      };
}

class Ayat {
  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  Ayat({
    this.id,
    this.surah,
    this.nomor,
    this.ar,
    this.tr,
    this.idn,
  });

  factory Ayat.fromJson(dynamic json) {
    if (json is String) {
      return Ayat.fromMap(jsonDecode(json));
    } else {
      return Ayat.fromMap(json);
    }
  }

  String toJson() => json.encode(toMap());

  factory Ayat.fromMap(Map<String, dynamic> json) => Ayat(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
      };
}

class SuratSelanjutnya {
  int? id;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  SuratSelanjutnya({
    this.id,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  factory SuratSelanjutnya.fromJson(dynamic json) {
    if (json is String) {
      return SuratSelanjutnya.fromMap(jsonDecode(json));
    } else {
      return SuratSelanjutnya.fromMap(json);
    }
  }

  String toJson() => json.encode(toMap());

  factory SuratSelanjutnya.fromMap(Map<String, dynamic> json) =>
      SuratSelanjutnya(
        id: json["id"],
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
      };
}
