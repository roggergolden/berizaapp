import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      initialRoute: '/',
      routes: {
        '/': (context) => Inicio(),
        '/inicio-sesion': (context) => InicioSesion(),
        '/registro': (context) => Registro(),
        '/tienda': (context) => Tienda(),
        '/buscar-producto': (context) => BuscarProducto(),
        '/tarjeta-pago': (context) => TarjetaPago(),
        '/gifs': (context) => GifsPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tienda de Ferretería"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "¡Bienvenido a nuestra tienda!",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Ahora podrás encontrar de todo para tu construcción en la comodidad de tu celular",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Image.asset(
                              'assets/logo1.png',
                              width: 200,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/inicio-sesion'),
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Color.fromARGB(255, 230, 189, 56),
                                onPrimary:
                                    Colors.blue,
                              ),
                              child: Text('Iniciar Sesión'),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/registro'),
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Color.fromARGB(255, 230, 189, 56),
                                onPrimary:
                                    Colors.blue,
                              ),
                              child: Text('Registrarse'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.transparent,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/inicio-sesion');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/registro');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/tienda');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/gifs');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Iniciar Sesión',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Registro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Tienda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gif),
            label: 'GIFs',
          ),
        ],
      ),
    );
  }
}

class InicioSesion extends StatelessWidget {
  const InicioSesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar Sesión"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingrese su usuario y contraseña:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/tienda'),
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingrese sus datos:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Apellido',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/tienda'),
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}

class Tienda extends StatelessWidget {
  const Tienda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tienda"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/buscar-producto'),
              child: Text('Buscar Producto'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/tarjeta-pago'),
              child: Text('Tarjeta de Pago'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/gifs'),
              child: Text('Ver GIFs'),
            ),
          ],
        ),
      ),
    );
  }
}

class BuscarProducto extends StatelessWidget {
  const BuscarProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Producto"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingrese el nombre del producto:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Producto',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}

class TarjetaPago extends StatelessWidget {
  const TarjetaPago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarjeta de Pago"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingrese los datos de su tarjeta:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Número de tarjeta',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Fecha de vencimiento',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Pagar'),
            ),
          ],
        ),
      ),
    );
  }
}

//Pagina de los Gifs

class GifsPage extends StatefulWidget {
  const GifsPage({Key? key}) : super(key: key);

  @override
  _GifsPageState createState() => _GifsPageState();
}

class _GifsPageState extends State<GifsPage> {
  List<Map<String, dynamic>> gifs = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchGifs('Batman');
  }

  Future<void> fetchGifs(String query) async {
    final apiKey = 'wMRurucf6CaT1ZQfuMOzWYQ4TdBXWtqZ';
    final url = 'https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query&limit=20';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    final fetchedGifs = List<Map<String, dynamic>>.from(data['data']).map((img) {
      return {
        'id': img['id'],
        'title': img['title'],
        'url': img['images']['downsized_medium']['url'],
      };
    }).toList();

    setState(() {
      gifs.clear(); // Limpiar la lista de GIFs antes de agregar los nuevos
      gifs.addAll(fetchedGifs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GIFs"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Buscar GIFs',
              ),
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              String query = searchController.text.trim();
              if (query.isNotEmpty) {
                fetchGifs(query);
              }
            },
            child: Text('Buscar'),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: gifs.isNotEmpty
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: gifs.length,
                    itemBuilder: (context, index) {
                      final gif = gifs[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                gif['url'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                gif['title'],
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('No se encontraron GIFs'),
                  ),
          ),
        ],
      ),
    );
  }
}

