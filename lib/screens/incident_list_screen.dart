import 'package:flutter/material.dart';
import 'incident_detail_screen.dart';
import 'package:secret_police_app/models/incident.dart';
import 'package:secret_police_app/globals.dart'; // Asegúrate de importar globals.dart

class IncidentListScreen extends StatefulWidget {
  @override
  _IncidentListScreenState createState() => _IncidentListScreenState();
}

class _IncidentListScreenState extends State<IncidentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incidencias'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              setState(() {
                incidents.clear();
              });
            },
          ),
        ],
      ),
      
      body: ListView.builder(
        itemCount: incidents.length,
        itemBuilder: (context, index) {
          final incident = incidents[index];
          return ListTile(
            title: Text(incident.title),
            subtitle: Text(incident.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IncidentDetailScreen(incident: incident),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
