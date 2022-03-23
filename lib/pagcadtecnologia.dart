import 'package:exemplo46/firebase.dart';
import 'package:flutter/material.dart';

class cadtecnologia extends StatefulWidget {
  const cadtecnologia({Key? key}) : super(key: key);

  @override
  _cadtecnologiaState createState() => _cadtecnologiaState();
}

class _cadtecnologiaState extends State<cadtecnologia> {
//variavel cadtitulotecnologia vai receber o valor q sera digitado pelo usuario a baixo
  TextEditingController cadtitulotecnologia = TextEditingController();
  //variavel caddescricaotecnologia vai receber o valor q sera digitado pelo usuario a baixo
  TextEditingController caddescricaotecnologia = TextEditingController();
  //variavel tiponoticia vai receber o valor noticiatecnologia
  String tiponoticia = "noticiatecnologia";

  @override
  Widget build(BuildContext context) {
    //chamando materialapp
    return MaterialApp(
      //criando esqueleto do app
      home: Scaffold(
        //scroll para caso tenha mta coisa na tela... poder rolar ela...
        body: SingleChildScrollView(
          //criando um formulario para cadastrar os dados
          child: Form(
              //em formato de coluna... ou seja um em baixo do outro
              child: Column(
            children: [
              //campo para digitar texto
              TextFormField(
                //teclado do tipo texto
                keyboardType: TextInputType.text,
                //texto q vai ficar em cima do campo
                decoration:
                    InputDecoration(labelText: "insira o titulo da noticia"),
                //texto digitado pelo usuario vai ficar centralizado no campo
                textAlign: TextAlign.center,
                //valor digitado vai ficar armazenado na variavel a baixo
                controller: cadtitulotecnologia,
              ),
              //campo para digitar texto
              TextFormField(
                //teclado sera do tipo texto
                keyboardType: TextInputType.text,
                //texto q vai aparecer em cima do campo
                decoration:
                    InputDecoration(labelText: "insira descricao da noticia"),
                //texto q iremos digitar vao ficar centralizado no campo
                textAlign: TextAlign.center,
                //o valor digitado vai ficar armazenado na variavel a baixo
                controller: caddescricaotecnologia,
              ),
              //campo para detectar toque
              GestureDetector(
                onTap: () {
                  //chamando a classe Fb(firebase/banco de dados)
                  //e passando os valores q foram preenchidos nas variaveis acima
                  //para serem add no firebase
                  Fb(cadtitulotecnologia.text, caddescricaotecnologia.text,
                          tiponoticia)
                      .addNoticias(caddescricaotecnologia.text,
                          caddescricaotecnologia.text, tiponoticia)
                      .toString();
                },
                //ao ser clicado no container a baixo vamos executar o gesture
                //detector acima
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: Text('cadastrar noticia tecnologia'),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
