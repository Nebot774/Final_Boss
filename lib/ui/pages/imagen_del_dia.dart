import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../bloc/blocs/apod_bloc.dart';
import '../../bloc/events/apod_event.dart';
import '../../bloc/states/apod_state.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagenDelDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apodBloc = BlocProvider.of<ApodBloc>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      apodBloc.add(FetchApodData());
    });

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Imagen del Día', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Text('T.C', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsAndConditionsScreen())),
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
            return Container(
              color: Colors.black,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Text('${state.apodData.title ?? 'No disponible'}', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
                  Text('Fecha: ${state.apodData.date ?? 'No disponible'}', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Scaffold(
                              backgroundColor: Colors.black,
                              body: Center(
                                child: CachedNetworkImage(
                                  imageUrl: state.apodData.url!,
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Icon(Icons.error), SizedBox(height: 10), Text('Error al cargar la imagen.')],
                                  ),
                                ),
                              ),
                              floatingActionButton: FloatingActionButton(
                                child: Icon(Icons.close, color: Colors.white), // Cambia el ícono a una "X"
                                backgroundColor: Colors.transparent,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              floatingActionButtonLocation: FloatingActionButtonLocation.endTop, // Mueve el botón a la derecha
                            ),
                          ));
                        },
                        child: CachedNetworkImage(
                          imageUrl: state.apodData.url!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.error), SizedBox(height: 15), Text('Error al cargar la imagen.')],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
                      children: [
                        Text('Tipo de medio:', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.0)),
                        Text('${state.apodData.mediaType ?? 'No disponible'}', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', color: Colors.white, fontSize: 14.0)),
                        Text('Versión del servicio:', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.0)),
                        Text('${state.apodData.serviceVersion ?? 'No disponible'}', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', color: Colors.white, fontSize: 14.0)),
                        Text('Explicación:', textAlign: TextAlign.left, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
                        Text(
                          '${state.apodData.explanation ?? 'No disponible'}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 6.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
