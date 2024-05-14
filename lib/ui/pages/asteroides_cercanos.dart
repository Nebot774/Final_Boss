import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';

import '../../models/NeoWsData.dart';
import '../../models/NeoWsNeoData.dart';
import '../../repositories/NeoWsNeoRepository.dart';
import '../../repositories/NeoWsRepository.dart';
import 'package:flutter/material.dart';
import '../../widgets/InicioWidget.dart';


class AsteroidesCercanos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Text(
            'Asteroides Cercanos a la Tierra',
            style: TextStyle(
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Text(
              'T.C',
              style: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24.0,
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
      body: InicioWidget(),
    );
  }
}
