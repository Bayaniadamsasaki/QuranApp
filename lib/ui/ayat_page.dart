// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_alquran_app/cubit/ayat/ayat_cubit.dart';

import 'package:flutter_alquran_app/data/model/surat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/contants.dart';

class AyatPage extends StatefulWidget {
  const AyatPage({
    super.key,
    required this.surat,
  });
  final SuratModel surat;

  @override
  State<AyatPage> createState() => _AyatPageState();
}

class _AyatPageState extends State<AyatPage> {
  @override
  void initState() {
    context.read<AyatCubit>().getDetailSurat(widget.surat.nomor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.surat.namaLatin,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.primary,
          actions: const [],
        ),
        body: BlocBuilder<AyatCubit, AyatState>(
          builder: (context, state) {
            if (state is AyatLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AyatLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final ayat = state.detail.ayat![index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          '${ayat.nomor}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        '${ayat.ar}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${ayat.idn}'),
                    ),
                  );
                },
                itemCount: state.detail.ayat!.length,
              );
            }
            if (state is AyatError) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center(
              child: Text('Error'),
            );
          },
        ));
  }
}
