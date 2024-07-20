import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:secret_police_app/models/incident.dart';
import 'dart:io';

class IncidentDetailScreen extends StatelessWidget {
  final Incident incident;

  IncidentDetailScreen({required this.incident});

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playAudio() async {
    if (incident.audioPath != null) {
      await _audioPlayer.setFilePath(incident.audioPath!);
      _audioPlayer.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(incident.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              incident.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              incident.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Fecha: ${incident.date.toLocal().toString().split(' ')[0]}', // Formato YYYY-MM-DD
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            if (incident.photoPath != null)
              Image.file(File(incident.photoPath!)),
            SizedBox(height: 10),
            if (incident.audioPath != null)
              ElevatedButton(
                onPressed: _playAudio,
                child: Text('Reproducir Audio'),
              ),
          ],
        ),
      ),
    );
  }
}
