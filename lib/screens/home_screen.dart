import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'busqueda_screen.dart';

import '../services/auth_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cocktails'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Expanded(
            //   child: Image(
            //     image: AssetImage('assets/cocktail.png'),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/cocktail.png'),
                radius: 70,
              ),
            ),
            Text(
              "Ingrese nombre",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Ingrese Nombre',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                "Puede ingresar nombre completo o parcial del cocktail que desea buscar",
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: ElevatedButton(
                  child: Text('Buscar'),
                  onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Busqueda()))
                      }),
            ),
            //   Center(
            //     child: ElevatedButton(
            //         child: Text('Logout'),
            //         onPressed: () async {
            //           await authservice.singOut();
            //         }),
            //   )
          ],
        ));
  }
}
