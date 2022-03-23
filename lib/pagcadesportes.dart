import 'package:exemplo46/firebase.dart';
import 'package:flutter/material.dart';

class cadesportes extends StatefulWidget {
  const cadesportes({Key? key}) : super(key: key);

  @override
  _cadesportesState createState() => _cadesportesState();
}

class _cadesportesState extends State<cadesportes> {
//criando variavel cadtituloesporte q sera preenchida pelo usuario a baixo
  TextEditingController cadtituloesporte = TextEditingController();
  //criando variavel caddescricaoesporte q sera preenchida pelo usuario a baixo
  TextEditingController caddescricaoesporte = TextEditingController();
  //variavel tiponoticia recebe o valor noticiaesporte
  var tiponoticia = "noticiaesporte";

  @override
  Widget build(BuildContext context) {
    //chamando o materialapp
    return MaterialApp(
      //criando o esqueleto do app
      home: Scaffold(
        //o app vai ter SCROLL para poder rolar a pag caso tenha mtas coisas
        body: SingleChildScrollView(
          //criando formulario
          child: Form(
              //criando coluna... para add varios (conteiner, gesture detector, campos, etc)
              //em baixo do outro
              child: Column(
            children: [
              //campo para digitar texto
              TextFormField(
                //teclado sera do tipo texto
                keyboardType: TextInputType.text,
                //texto/frase q aparece em cima do campo de digitacao de texto
                decoration:
                    InputDecoration(labelText: "insira o titulo da noticia"),
                //o texto q iremos digitar vai ficar centralizado no campo
                textAlign: TextAlign.center,
                //o valor q sera digitado no campo acima ficara armazenado na variavel
                //a baixo
                controller: cadtituloesporte,
              ),
              //campo para digitar texto
              TextFormField(
                //teclado do tipo textual
                keyboardType: TextInputType.text,
                //texto q aparece em cima do campo
                decoration:
                    InputDecoration(labelText: "insira a descricao da noticia"),
                //o q digitarmos vai ficar centralizado no campo
                textAlign: TextAlign.center,
                //os valores digitados vao ser armazenados na variavel a baixo
                controller: caddescricaoesporte,
              ),
              //campo para detectar toque
              GestureDetector(
                onTap: () {
                  //chamando a classe Fb(firebase/banco de dados)
                  //e passando os valores q digitamos nas variaveis acima
                  //para serem cad no banco de dados
                  Fb(cadtituloesporte.text, caddescricaoesporte.text,
                          tiponoticia)
                      .addNoticias(cadtituloesporte.text,
                          caddescricaoesporte.text, tiponoticia)
                      .toString();
                },
                //ao clicarmos no container a baixo... vamos executar o
                //gesture detector acima... e cad os dados no firebase
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: Text('cadastrar noticia de esporte'),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
