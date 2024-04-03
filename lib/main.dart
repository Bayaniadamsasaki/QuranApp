import 'package:flutter/material.dart';
import 'package:flutter_alquran_app/cubit/ayat/ayat_cubit.dart';
import 'package:flutter_alquran_app/cubit/surat/surat_cubit.dart';
import 'package:flutter_alquran_app/data/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SuratCubit(
                  ApiService(
                    client: http.Client(),
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => AyatCubit(
                  ApiService(
                    client: http.Client(),
                  ),
                ),
              ),
            ],
            child: MaterialApp(
              title: 'Ahlul Quran App',
              theme: ThemeData(
                primarySwatch: Colors.brown,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              home: const HomePage(),
            ),
          );
        });
  }
}
