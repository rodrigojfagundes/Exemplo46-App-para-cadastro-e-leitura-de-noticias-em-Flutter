import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class vertecnologia extends StatelessWidget {
  const vertecnologia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //criando uma Collection Reference... Chamada Noticias... para acessar diretamente
    //a collection Noticias no FB
    CollectionReference noticias =
        FirebaseFirestore.instance.collection("noticias");
//
//retornamos um FUTUREBUILDER... Um future Builder é uma funcao, que irá construir
//algo (listview, containers, etc...) com base nos dados q vierem na funcao FUTURE,
//ele/builder ira construir um ListTile/ListView
    return FutureBuilder(
        //a funcao FUTURE recebe o valor da collection reference noticias...
        //o comando .GET significa (pegar)... ou seja pegar os dados da collection noticias
        future: noticias.get(),
        //o builder ta dizendo q neste contexto de forma assincrona... vai receber
        //um snapshot/foto do q ta na collection
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //se der erro exibe a mensagem
          if (snapshot.hasError) {
            print("ops erro na conexao");
          }
          //se estiver carregando exibe a mensagem a baixo
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("carregando");
          }
          //retornando um listview
          return ListView(
            //pegando a foto/snapshot em formato de MAP/CHAVE e VALOR dos DOCs da collection
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  //a variavel DATA acima, vai receber os valores dos DOC da COLLECTION no tipo
                  //CHAVE e VALOR, chave no formato STRING (pois e uma palavra) e o VALOR
                  //em DYNAMIC, pois pd ser uma PALVRA, NUMERO, BOOLEANO, ETC...
                  document.data()! as Map<String, dynamic>;
              //se no DOC a tiver a CHAVE TIPO_NOTICIA, e se o valor dela for
              //NOTICIATECNOLOGIA... entao vamos exibir o LISTTILE a baixo
              if (data['tipo_noticia'] == 'noticiatecnologia') {
                return Material(
                  ////child: ListTile(
                  ////title: Text(data['titulo_noticia']),
                  ////subtitle: Text(data['descricao_noticia']),
                  child: ListTile(
                    ////height: 100,
                    ////width: 100,
                    //chamando a variavel/map DATA e pedindo os VALORES q estao presente
                    //nas chaves TITULO_NOTICIA e DESCRICAO_NOTICIA
                    title: Text(data['titulo_noticia']),
                    subtitle: Text(data['descricao_noticia']),
                  ),
                );
              } else {
                //SE nao for noticia do tipo TECNOLOGIA, daii exibe um container vazio...
                return Material(
                  child: Container(),
                );
              }
            }).toList(),
          );
        });
  }
}
