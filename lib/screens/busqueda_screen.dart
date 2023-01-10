import 'package:flutter/material.dart';

class Busqueda extends StatelessWidget {
  Busqueda({Key? key}) : super(key: key);

  List<String> names = [
    "Tequila Slammer",
    "Tequila sunrise",
    "Tequila gumption",
    "Tequila sage smash",
    "Tequila sidecar",
    "Shot tequila",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busqueda"),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              color: Color.fromARGB(255, 124, 211, 185),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(names[index],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Ingredientes',
                            style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Ingredientes de ' + names[index]),
                              content: Text('----------------'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Atrás'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      TextButton(
                        child: const Text('Preparación',
                            style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Preparación de ' + names[index]),
                              content: Text('---------------'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Atrás'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
