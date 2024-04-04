import 'package:flutter/material.dart';
import 'package:final_boss/bloc/ui/pages/terms_and_conditions_screen.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 40.0), // Añade esta línea para agregar margen a la izquierda
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Text(
              'T.C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Menu Page'),
      ),
    );
  }
}