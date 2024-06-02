import 'package:final_boss/repositories/ApodRepository.dart';
import 'package:final_boss/repositories/GaleriaRepository.dart';
import 'package:final_boss/repositories/ImagenCumpleanosRepository.dart';
import 'package:final_boss/repositories/TierraDesdeEspacioRepository.dart';
import 'package:final_boss/ui/pages/asteroides_cercanos.dart';
import 'package:final_boss/ui/pages/galeria_nasa.dart';
import 'package:final_boss/ui/pages/home_page.dart';
import 'package:final_boss/ui/pages/mars_rovers.dart';
import 'package:flutter/material.dart';
import 'bloc/blocs/GaleriaBloc.dart';
import 'bloc/blocs/TierraDesdeEspacioBloc.dart';
import 'bloc/blocs/apod_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/blocs/imagen_cumpleanos_bloc.dart';
import 'package:http/http.dart' as http;

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
          create: (context) => ApodBloc(apodRepository: ApodRepository(client: http.Client())),
        ),
        BlocProvider<ImagenCumpleanosBloc>(
          create: (context) => ImagenCumpleanosBloc(imagenCumpleanosRepository: ImagenCumpleanosRepository()),
        ),
        BlocProvider<GaleriaBloc>(
          create: (context) => GaleriaBloc(galeriaRepository: GaleriaRepository()),
        ),
        BlocProvider<TierraDesdeEspacioBloc>(
          create: (context) => TierraDesdeEspacioBloc(TierraDesdeEspacioRepository()),
        ),
      ],
      child: MaterialApp(
        title: '', // Cambia esto al título de tu aplicación
        home: HomePage(),
      ),
    );
  }
}
