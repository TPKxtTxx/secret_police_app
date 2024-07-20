import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Acerca de')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/officer_photo.png'),
          Text('Nombre: Otto'),
          Text('Apellido: Gonzalez'),
          Text('Matrícula: 2022-0121'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '“La vigilancia es el precio de la libertad.”',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
