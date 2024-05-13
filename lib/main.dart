import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mi app en flutter',),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final n1 = TextEditingController();
  final n2 = TextEditingController();
  double result = 0;
  _sumar() {
    setState(() {
      result = double.parse(n1.text) + double.parse(n2.text);
    // showDialog(context: context, builder: (context){
    //   return AlertDialog(
    //       title: const Text("suma"),
    //       content: Text("Resultado $result "),
    //   );
    // });
    });
  }
  _restar(){
    setState(() {
      result = double.parse(n1.text) - double.parse(n2.text);
    });
  }
  _dividir(){
    setState(() {
      result = double.parse(n1.text) / double.parse(n2.text);
    });
  }
  _multiplicar(){
    setState(() {
    result = double.parse(n1.text) * double.parse(n2.text);
  });
  }
  _limpiar(){
    setState(() {
      result = 0;
      n1.text = '';
      n2.text = '';

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:  Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Resultado: $result',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.2),
                child: TextFormField(
                  controller: n1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Número 1',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.2),
                child: TextFormField(
                  controller: n2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Número 2',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  tooltip: 'Sumar',
                  onPressed: _sumar,
                  child: Text('+'),
                ),
                FloatingActionButton(
                  tooltip: 'Restar',
                  onPressed: _restar,
                  child: Text('-'),
                ),
                FloatingActionButton(
                  tooltip: 'Multiplicar',
                  onPressed: _multiplicar,
                  child: Text('*'),
                ),
                FloatingActionButton(
                  tooltip: 'Dividir',
                  onPressed: _dividir,
                  child: Text('/'),
                ),
                FloatingActionButton(
                  tooltip: 'Limpiar',
                  onPressed: _limpiar,
                  child: Text('C'),
                ),
              ],
            ),

          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _sumar,
      //   tooltip: 'Sumar',
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            tooltip: "Inicio",
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            tooltip: "Buscar",
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            tooltip: "Notificaciones",
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            tooltip: "Perfil",
            label: 'Perfil',
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
