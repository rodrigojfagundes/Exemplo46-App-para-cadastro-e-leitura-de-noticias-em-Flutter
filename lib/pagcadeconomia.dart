import 'package:exemplo46/firebase.dart';
import 'package:flutter/material.dart';

class cadeconomia extends StatefulWidget {
  const cadeconomia({Key? key}) : super(key: key);

  @override
  _cadeconomiaState createState() => _cadeconomiaState();
}

class _cadeconomiaState extends State<cadeconomia> {
//criando variavel q vai receber valores digitadospelo usuario
  TextEditingController cadtituloeconomia = TextEditingController();
  //criando variavel q vai receber valores digitadospelo usuario
  TextEditingController caddescricaoeconomia = TextEditingController();
  //criando variavel tiponoticia q por padrao vai receber o valor noticiaeconomia
  String tiponoticia = "noticiaeconomia";

  @override
  Widget build(BuildContext context) {
    //chamando o materialapp
    return MaterialApp(
      //criando o esqueleto do app
      home: Scaffold(
        //single child scroll view serve para q caso tenha varios campos na tela
        //podemos rolar a tela para baixo para ver os outros campos
        body: SingleChildScrollView(
          //formulario para add os dados
          child: Form(
            //criando uma coluna
            child: Column(
              children: [
                //campo para digitar texto
                TextFormField(
                  //o tipo do teclado vai ser textual
                  keyboardType: TextInputType.text,
                  //texto em cima do cmapo de digitar texto
                  decoration:
                      InputDecoration(labelText: "cadastrar noticia economia"),
                  //o q digitarmos ficara no centro
                  textAlign: TextAlign.center,
                  //o q sera digitado vai ficar armazenado na variavel a baixo
                  controller: cadtituloeconomia,
                ),
                //campo para digitar texto
                TextFormField(
                  //tipo do teclado é textual
                  keyboardType: TextInputType.text,
                  //frase em cima do campo q digitar texto
                  decoration: InputDecoration(
                      labelText: "insira a descricao da noticia"),
                  //texto q digitarmos no campo ficara centralizado no campo
                  textAlign: TextAlign.center,
                  //o q for digitado vai ficar armazenado na variavel a baixo
                  controller: caddescricaoeconomia,
                ),
                //campo para detectar toque
                GestureDetector(
                  onTap: () {
                    //ao ser tocado, vamos chamar a classe Fb(firebase)
                    //e vamos passar par ao firebase/Fb o valor q ta nas variaveis
                    //q preenchemos acima para cadastrarmos no Firebase/banco de dados
                    Fb(cadtituloeconomia.text, caddescricaoeconomia.text,
                            tiponoticia)
                        .addNoticias(cadtituloeconomia.text,
                            caddescricaoeconomia.text, tiponoticia)
                        .toString();
                  },
                  //ao clicarmos no container a baixo vamos executar o gesture
                  //detector acima... e cad o q ta nas variaveis no Firebase
                  child: Container(
                    //especificacoes do containe
                    height: 100,
                    width: 100,
                    color: Colors.purple,
                    child: Text("cadastrar noticia de economia"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
