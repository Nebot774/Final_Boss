import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../bloc/blocs/apod_bloc.dart';
import '../../bloc/events/apod_event.dart';
import '../../bloc/states/apod_state.dart';

class ImagenDelDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtén la instancia del BLoC
    final apodBloc = BlocProvider.of<ApodBloc>(context);

    // Imprime el valor de apodBloc
    print('Valor de apodBloc: $apodBloc');

    // Dispara el evento para obtener los datos después de que el widget se haya construido completamente
    WidgetsBinding.instance.addPostFrameCallback((_) {
      apodBloc.add(FetchApodData());
    });

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), // Cambia el color del icono a blanco
        title: Padding(
          padding: EdgeInsets.only(left: 0.0), // Añade margen a la izquierda del título
          child: Text(
            'Imagen del Día',
            style: TextStyle(
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
        backgroundColor: Colors.blue[900], // Cambia el color de fondo de la AppBar a azul
        actions: <Widget>[
          IconButton(
            icon: Text(
              'T.C',
              style: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color blanco para el texto
                fontSize: 24.0, // Aumenta el tamaño del texto
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TermsAndConditionsScreen(),
              ));
            },
          ),
        ],
      ),
      body: BlocBuilder<ApodBloc, ApodState>(
        builder: (context, state) {
          if (state is ApodInitial) {
            return Center(child: Text('Inicializando...'));
          } else if (state is ApodLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ApodLoaded) {
            return ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Text('Fecha: ${state.apodData.date ?? 'No disponible'}'),
                Text('Explicación: ${state.apodData.explanation ?? 'No disponible'}'),
                Text('Tipo de medio: ${state.apodData.mediaType ?? 'No disponible'}'),
                Text('Versión del servicio: ${state.apodData.serviceVersion ?? 'No disponible'}'),
                Text('Título: ${state.apodData.title ?? 'No disponible'}'),
                (state.apodData.url != null)
                    ? CachedNetworkImage(
                  imageUrl: state.apodData.url!,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) {
                    print('Error al cargar la imagen: $error');
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.error),
                        SizedBox(height: 10),
                        Text('Error al cargar la imagen.'),
                      ],
                    );
                  },
                )
                    : Text('URL de la imagen no disponible'),
                Text('Derechos de autor: ${state.apodData.copyright ?? 'No disponible'}'),
              ],
            );
          } else if (state is ApodError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('Estado desconocido'));
          }
        },
      ),
    );
  }
}