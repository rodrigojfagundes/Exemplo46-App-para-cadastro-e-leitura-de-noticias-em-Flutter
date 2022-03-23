import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class veresportes extends StatelessWidget {
  const veresportes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //criando uma referencia para se conectar a COLLECTION NOTICIAS
    CollectionReference noticias =
        FirebaseFirestore.instance.collection("noticias");
    //retornando um FutureBuilder, um FutureBuilder é uma funcao q controi algo,
    //atraves do DADOS q vierem na funcao FUTURE...neste caso ele o BUILDER, ira
    //construir um ListTile com as noticias
    return FutureBuilder<QuerySnapshot>(
        //o FUTURE esta acessando a nossa COLLECTION REFERENCE NOTICIAS... e dando um GET
        //ou seja pegando os dados dela...
        future: noticias.get(),
        //o builder ta dizendo q neste contexto de forma assincrona, nos vamos tirar
        //uma foto/snapshot (uma copia) dos dados q estao na Collection Reference NOTICIAS
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //se der erro no processo, exibe a mensagem a baixo
          if (snapshot.hasError) {
            print("erro na conexao");
          }
          //se estiver aguardando a conexao... exibe a mensagem a baixo
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("carregando");
          }
          //apos realizar o processo acima...
          return ListView(
            //pegando a foto/snapshot atual dos DOCs em formato de MAP com
            //(CHAVE:VALOR) ou seja no formato de MAP
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              //vamos receber os valores da linha acima, no formato MAP, sendo
              //a CHAVE: no formato STRING e o VALOR no formato DYNAMIC...
              //isso acontece pois, a CHAVE: é um nome(ex: noticia), e o VALOR
              //pd ser um NOME(string), um NUMERO(int), etc... por isso e DYNAMIC
              Map<String, dynamic> data =
                  //a variavel DATA acima, é uma variavel do tipo MAP... e ela vai receber
                  //em formato de MAP (CHAVE:VALOR) os dados q estao dentro dos docs
                  //q tao dentro da COLLECTION
                  document.data()! as Map<String, dynamic>;
              //
              //SE o DOC tiver a CHAVE TIPO_NOTICIA com o VALOR NOTICIAESPORTE
              //significa q e uma noticia de esporte entao...
              if (data['tipo_noticia'] == 'noticiaesporte') {
                return Material(
                  ////child: Container(
                  //vamos chamar um ListTile
                  child: ListTile(
                    //title: Text(data['titulo_noticia']), IGNORAR
                    //subtitle: Text(data['descricao_noticia']), IGNORAR
                    //height: 100, IGNORAR
                    //width: 100, IGNORAR
                    //child: Text(data['titulo_noticia']), IGNORAR
                    //
                    //chamando a variavel(MAP) DATA, e solicitando os valores
                    //das chaves TITULO_NOTICIA e da chave descricao_noticia
                    title: Text(data['titulo_noticia']),
                    subtitle: Text(data['descricao_noticia']),
                  ),
                );
              }
              ////if (data['tipo_noticia'] ==! 'noticiaesportes') IGNORAR
              {
                //SE a TIPO_NOTICIA nao for ESPORTE... vamos exibir um container vazio
                return Material(
                  //child: ListView(),
                  child: Container(),
                );
              }
            }).toList(),
          );
        });
  }
}
