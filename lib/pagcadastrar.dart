import 'package:flutter/material.dart';
import 'main.dart';

class cadastrar extends StatefulWidget {
  const cadastrar({Key? key}) : super(key: key);

  @override
  _cadastrarState createState() => _cadastrarState();
}

class _cadastrarState extends State<cadastrar> {
  @override
  Widget build(BuildContext context) {
    //chamando o MaterialApp
    return MaterialApp(
      //montando o esqueleto do app
      home: Scaffold(
        //dizendo q vai ficar tudo em uma area visivel da tela
        body: SafeArea(
            //criando uma coluna
            child: Column(
          children: [
            //campo para detectar toques
            GestureDetector(
              onTap: () {
                //se for tocado vai chamar a pagina (pagcadesportes)
                Navigator.of(context).pushNamed('/pagcadesportes');
              },
              //se clicarno container a baixo executa o onTap acima...
              child: Container(
                //especificacoes do container
                height: 100,
                width: 100,
                color: Colors.blue,
                child: Text('cad esportes'),
              ),
            ),
            //campo para deteccao de toques
            GestureDetector(
              onTap: () {
                //se for tocado ele nos leva para a pagcadtecnologia
                Navigator.of(context).pushNamed('/pagcadtecnologia');
              },
              //se for clicado no container a baixo ele executa a funcao acima
              child: Container(
                //especificacoes do container
                height: 100,
                width: 100,
                color: Colors.green,
                child: Text('cad tecnologia'),
              ),
            ),
            //campo para detectar toque
            GestureDetector(
              onTap: () {
                //se for tocado chama a pagcadeconomia
                Navigator.of(context).pushNamed('/pagcadeconomia');
              },
              //se clicar no container a baixo ele executaa funcao acima
              child: Container(
                //especificacoes do container
                height: 100,
                width: 100,
                color: Colors.yellow,
                child: Text('cad economia'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
