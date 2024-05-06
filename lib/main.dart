import 'package:final_boss/repositories/ApodRepository.dart';
import 'package:final_boss/repositories/GaleriaRepository.dart';
import 'package:final_boss/repositories/ImagenCumpleanosRepository.dart';
import 'package:final_boss/ui/pages/galeria_nasa.dart';
import 'package:flutter/material.dart';
import 'bloc/blocs/GaleriaBloc.dart';
import 'bloc/blocs/apod_bloc.dart';
import 'ui/pages/home_page.dart'; // Asegúrate de que esta ruta de importación sea correcta
import 'package:final_boss/ui/pages/menu_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/blocs/imagen_cumpleanos_bloc.dart';

import 'package:final_boss/bloc/blocs/GaleriaBloc.dart';
import 'package:final_boss/repositories/GaleriaRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApodBloc>(
          create: (context) => ApodBloc(apodRepository: ApodRepository()),
        ),
        BlocProvider<ImagenCumpleanosBloc>(
          create: (context) => ImagenCumpleanosBloc(imagenCumpleanosRepository: ImagenCumpleanosRepository()),
        ),
        BlocProvider<GaleriaBloc>(
          create: (context) => GaleriaBloc(galeriaRepository: GaleriaRepository()),
        ),
      ],
      child: MaterialApp(
        title: '', // Cambia esto al título de tu aplicación
        home: GaleriaNasa(),
      ),
    );
  }
}
