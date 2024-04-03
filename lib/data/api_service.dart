// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_alquran_app/data/model/surat_detail_model.dart';
import 'package:flutter_alquran_app/data/model/surat_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;
  ApiService({
    required this.client,
  });
  
  Future<Either<String, List<SuratModel>>> getAllSurat() async {
    try {
      final response =
          await client.get(Uri.parse('https://equran.id/api/surat'));
      return Right(List<SuratModel>.from(
        jsonDecode(response.body).map(
          (x) => SuratModel.fromJson(x),
        ),
      ).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, SuratDetailModel>> getDetailSurat(
      int nomorSurat) async {
    try {
      final response =
          await client.get(Uri.parse('https://equran.id/api/surat/$nomorSurat'));
      return Right(SuratDetailModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
