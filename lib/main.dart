import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Punto di ingresso dell'applicazione: Flutter chiama main() all'avvio
void main() {
  runApp(const MyApp());
}

// MyApp è il widget radice dell'intera applicazione.
// Estende StatelessWidget perché non ha uno stato interno che cambia.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp è il contenitore principale che configura tema, navigazione e titolo
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Il tema globale dell'app: qui si definisce la palette colori.
        // seedColor è il colore base da cui Flutter genera l'intera palette Material 3.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      // home è la schermata mostrata all'avvio
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      themeMode: ThemeMode.system,
    );
  }
}
