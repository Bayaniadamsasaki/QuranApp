// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_alquran_app/data/api_service.dart';

import '../../data/model/surat_detail_model.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit(
    this.apiService,
  ) : super(AyatInitial());

  final ApiService apiService;

  void getDetailSurat(int nomorSurat) async {
    emit(AyatLoading());
    final result = await apiService.getDetailSurat(nomorSurat);
    result.fold(
      (errorMessage) => emit(AyatError(message: errorMessage)),
      (data) => emit(AyatLoaded(detail: data)),
    );
  }
}
