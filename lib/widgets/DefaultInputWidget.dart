import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultInputWidget extends StatelessWidget {
  final dynamic galeriaData;

  DefaultInputWidget({required this.galeriaData});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
    );

    return ListView.builder(
      itemCount: galeriaData.items.length,
      itemBuilder: (context, index) {
        var item = galeriaData.items[index];
        var smallImageUrl = item.imageLinks?.firstWhere((link) => link.endsWith('small.jpg'), orElse: () => '') ?? '';

        return Card(
          color: Colors.grey[900], // Color de fondo de la tarjeta
          margin: EdgeInsets.all(10), // Margen alrededor de cada tarjeta
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                if (smallImageUrl != null && smallImageUrl.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Image.network(smallImageUrl),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.network(smallImageUrl),
                  )
                else
                  Text('No image available', style: TextStyle(color: Colors.white, fontFamily: 'Exo', fontSize: 14.sp)),
                if (item.description != null && item.description!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.description!, style: TextStyle(color: Colors.white, fontFamily: 'Exo', fontSize: 14.sp)),
                  )
                else
                  Text('No description available', style: TextStyle(color: Colors.white, fontFamily: 'Exo', fontSize: 14.sp)),
              ],
            ),
          ),
        );
      },
    );
  }
}
