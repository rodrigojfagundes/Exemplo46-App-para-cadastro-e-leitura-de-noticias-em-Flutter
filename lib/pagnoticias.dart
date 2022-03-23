import 'package:flutter/material.dart';

class noticias extends StatefulWidget {
  const noticias({Key? key}) : super(key: key);

  @override
  _noticiasState createState() => _noticiasState();
}

class _noticiasState extends State<noticias> {
  @override
  Widget build(BuildContext context) {
    //chamando o material app
    return MaterialApp(
      //esuqleto do app
      home: Scaffold(
        //tudo ira aparecer em uma area visivel da tela
        body: SafeArea(
          //os campos vao aparecer um em baixo do outro (column)
          child: Column(
            children: [
              //campo para detectar toque
              GestureDetector(
                onTap: () {
                  //se for executado/tocado, vamos ir para a pagvertodasnoticiass
                  Navigator.of(context).pushNamed('/pagvertodasnoticias');
                },
                //ao clicar no container vamos exec o q ta no gesture detector acima
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.deepOrange,
                  child: Text("ver todas noticias"),
                ),
              ),
              //campo para detectar toque
              GestureDetector(
                onTap: () {
                  //ao ser clicado/chamado, vamos ir para a pagveresportes
                  Navigator.of(context).pushNamed('/pagveresportes');
                },
                //ao clicarmos no container vamos exec o gesture detector acima
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.lime,
                  child: Text("ver noticias de esporte"),
                ),
              ),
              //campo para detectar toque
              GestureDetector(
                onTap: () {
                  //ao ser clicado/executado vamos ir para a pagvertecnologia
                  Navigator.of(context).pushNamed('/pagvertecnologia');
                },
                //ao clicarmos no container vamos exec o gesture detector acima
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.teal,
                  child: Text("ver noticias de tecnologia"),
                ),
              ),
              //campo para detectar toque
              GestureDetector(
                onTap: () {
                  //ao ser executado/tocado... vamos chamar a pagvereconomia
                  Navigator.of(context).pushNamed('/pagvereconomia');
                },
                //ao clicarmos no container abaixo, vamos executar o gesture detector
                //ali de cima...
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: Text("ver noticias de economia"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
