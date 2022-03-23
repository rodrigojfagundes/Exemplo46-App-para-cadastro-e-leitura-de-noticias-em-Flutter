import 'package:exemplo46/pagcadastrar.dart';
import 'package:exemplo46/pagcadeconomia.dart';
import 'package:exemplo46/pagcadesportes.dart';
import 'package:exemplo46/pagcadtecnologia.dart';
import 'package:exemplo46/paginicio.dart';
import 'package:exemplo46/pagnoticias.dart';
import 'package:exemplo46/pagvereconomia.dart';
import 'package:exemplo46/pagveresportes.dart';
import 'package:exemplo46/pagvertecnologia.dart';
import 'package:exemplo46/pagvertodasnoticias.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
//iniciando o firebase de forma assincrona
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //dizendo qual vai ser a rota inicial '/'
      initialRoute: '/',
      routes: {
        //criando as rotas das paginas...
        '/': (_) => const inicio(),
        '/pagcadastrar': (_) => const cadastrar(),
        '/pagcadesportes': (_) => const cadesportes(),
        '/pagcadtecnologia': (_) => const cadtecnologia(),
        '/pagcadeconomia': (_) => const cadeconomia(),
        '/pagnoticias': (_) => const noticias(),
        '/pagvereconomia': (_) => const vereconomia(),
        '/pagveresportes': (_) => const veresportes(),
        '/pagvertecnologia': (_) => const vertecnologia(),
        '/pagvertodasnoticias': (_) => const vertodasnoticias(),
      },
    );

    //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //);
  }
}
