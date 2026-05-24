import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home è la schermata mostrata all'avvio
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePage è la schermata principale dell'app.
// Estende StatefulWidget perché il suo contenuto cambia in risposta alle interazioni.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Il titolo viene passato dall'esterno (da MyApp) ed è immutabile (final).
  // Nei widget, i campi sono sempre final: i dati mutabili vanno nello State.
  final String title;

  // Crea l'oggetto State associato a questo widget
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// _MyHomePageState contiene lo stato mutabile di MyHomePage.
// Il prefisso _ lo rende privato al file corrente.
class _MyHomePageState extends State<MyHomePage> {
  // Variabile di stato: tiene il conteggio dei click sul pulsante
  int _counter = 0;

  // Metodo che incrementa il contatore.
  // setState() notifica Flutter che lo stato è cambiato e che deve ricostruire l'UI.
  void _incrementCounter() {
    setState(() {
      // Senza setState(), _counter cambierebbe in memoria ma l'UI non si aggiornerebbe
      _counter++;
    });
  }

  // build() viene chiamato ogni volta che setState() è invocato.
  // Restituisce l'albero di widget che descrive l'interfaccia corrente.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold fornisce la struttura base di una schermata Material: appBar, body, FAB, ecc.
      appBar: AppBar(
        // Il colore della barra viene preso dal tema globale (inversePrimary = variante chiara del primario)
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // widget.title accede alla proprietà title del widget StatefulWidget padre
        title: Text(widget.title),
      ),
      body: Center(
        // Center posiziona il suo figlio al centro dello spazio disponibile
        child: Column(
          // Column dispone i figli in verticale.
          // mainAxisAlignment.center li centra lungo l'asse principale (verticale)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hai premuto il pulsante questo numero di volte:'),
            Text(
              '$_counter', // interpolazione: mostra il valore corrente del contatore
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // FloatingActionButton: il pulsante rotondo in basso a destra
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // callback richiamata al click
        tooltip: 'Incrementa',
        child: const Icon(Icons.add),
      ),
    );
  }
}
