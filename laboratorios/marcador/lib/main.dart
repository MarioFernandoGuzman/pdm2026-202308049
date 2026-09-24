import 'package:flutter/material.dart';

void main() {
  runApp(const MarcadorApp());
}

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bantrab Liga',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MarcadorHomePage(title: 'Bantrab Liga'),
    );
  }
}

class MarcadorHomePage extends StatefulWidget {
  const MarcadorHomePage({super.key, required this.title});

  final String title;

  @override
  State<MarcadorHomePage> createState() => _MarcadorHomePageState();
}

class _MarcadorHomePageState extends State<MarcadorHomePage> {
  int _puntosXela = 0;
  int _puntosMadrid = 0;

  final String _nombreXela = 'Xelajú MC';
  final String _nombreMadrid = 'Real Madrid';

  final String _logoXela = 'https://clubxelajumc.com/wp-content/uploads/2025/11/Logo-Xelaju-MC-7-Lunas-R-Blanca-scaled.png';
 
  final String _logoMadrid = 'https://static.wikia.nocookie.net/spanishclassic/images/9/98/Real_Madrid.png/revision/latest?cb=20170317160316&path-prefix=es';

  void _incrementarXela() {
    setState(() {
      _puntosXela++;
    });
  }

  void _decrementarXela() {
    setState(() {
      if (_puntosXela > 0) {
        _puntosXela--;
      }
    });
  }

  void _incrementarMadrid() {
    setState(() {
      _puntosMadrid++;
    });
  }

  void _decrementarMadrid() {
    setState(() {
      if (_puntosMadrid > 0) {
        _puntosMadrid--;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _puntosXela = 0;
      _puntosMadrid = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    String mensaje = 'Empate';
    Color colorXela = Colors.grey.shade200;
    Color colorMadrid = Colors.grey.shade200;

    if (_puntosXela > _puntosMadrid) {
      mensaje = 'Va ganando $_nombreXela';
      colorXela = Colors.green.shade300;
    } else if (_puntosMadrid > _puntosXela) {
      mensaje = 'Va ganando $_nombreMadrid';
      colorMadrid = Colors.green.shade300;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              mensaje,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Xela
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorXela,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.network(_logoXela, height: 80, fit: BoxFit.contain),
                          const SizedBox(height: 10),
                          Text(
                            _nombreXela,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$_puntosXela',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: _decrementarXela,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(40, 40),
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text('-1'),
                              ),
                              const SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: _incrementarXela,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(40, 40),
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text('+1'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Madrid
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorMadrid,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.network(_logoMadrid, height: 80, fit: BoxFit.contain),
                          const SizedBox(height: 10),
                          Text(
                            _nombreMadrid,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$_puntosMadrid',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: _decrementarMadrid,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(40, 40),
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text('-1'),
                              ),
                              const SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: _incrementarMadrid,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(40, 40),
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text('+1'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _reiniciar,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
    );
  }
}
