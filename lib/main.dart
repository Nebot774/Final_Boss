import 'package:final_boss/repositories/ApodRepository.dart';
import 'package:flutter/material.dart';
import 'bloc/blocs/apod_bloc.dart';
import 'ui/pages/home_page.dart'; // Asegúrate de que esta ruta de importación sea correcta
import 'package:final_boss/ui/pages/menu_page.dart';
import 'package:final_boss/ui/pages/mars_rovers.dart';
import 'package:final_boss/ui/pages/galeria_nasa.dart';
import 'package:flutter/material.dart';
import 'ui/pages/home_page.dart'; // Asegúrate de que esta ruta de importación sea correcta
import 'package:final_boss/ui/pages/menu_page.dart';
import 'package:final_boss/ui/pages/mars_rovers.dart';
import 'package:final_boss/ui/pages/galeria_nasa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApodBloc(apodRepository: ApodRepository()),
      child: MaterialApp(
        title: '', // Cambia esto al título de tu aplicación
        home: MenuPage(),
      ),
    );
  }
}
