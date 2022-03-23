import 'package:flutter/material.dart';
import 'package:exemplo46/pagcadastrar.dart';
import 'main.dart';

class inicio extends StatefulWidget {
  const inicio({Key? key}) : super(key: key);

  @override
  _inicioState createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  @override
  Widget build(BuildContext context) {
    //chamando o material app
    return MaterialApp(
      //criando esqueleto do app
      home: Scaffold(
        //tudo q ta no app vai aparecer em area visivel da tela
        body: SafeArea(
          //column... as coisas vao ficar um em baixo do outro
          child: Column(
            children: [
              //campo para detectar toque
              GestureDetector(
                //se for tocado vai para a pagina pagcadastrar
                onTap: () {
                  Navigator.of(context).pushNamed('/pagcadastrar');
                },
                //ao ser clicado no container a baixo, executa o gesture detector acima
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: Text('cadastrar noticias'),
                ),
              ),
              //campo para deteccao de toque
              GestureDetector(
                onTap: () {
                  //ao ser tocado, nos vamos para a pagnoticias
                  Navigator.of(context).pushNamed('/pagnoticias');
                },
                //ao ser clicado no container vamos executar o gesture detector acima
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: Text('visualizar noticias'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
