// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_alquran_app/data/api_service.dart';

import '../../data/model/surat_model.dart';

part 'surat_state.dart';

class SuratCubit extends Cubit<SuratState> {
  SuratCubit(
    this.apiService,
  ) : super(SuratInitial());

  final ApiService apiService;

  void getAllSurat() async {
    emit(SuratLoading());
    final result = await apiService.getAllSurat();
    result.fold(
      (errorMessage) => emit(SuratError(message: errorMessage)),
      (data) => emit(SuratLoaded(listSurat: data)),
    );
  }
}
