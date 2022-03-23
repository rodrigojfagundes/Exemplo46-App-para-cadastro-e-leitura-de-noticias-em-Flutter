import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class vereconomia extends StatelessWidget {
  const vereconomia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fazendo uma referencia ao FB
    CollectionReference noticias =
        FirebaseFirestore.instance.collection('noticias');

//retornando um FutureBuilder... Um FutureBuilder é uma funcao que ira CONSTRUIR
//algo com base nos dados q vierem no no "future:"... Ele/builder ira construir um
//ListTile
    return FutureBuilder<QuerySnapshot>(
        //a fonte dos dados é a nossa collection reference NOTICIAS, com o comando
        //.get significa q estmaos PEGANDO todos os dados da COLLECTION NOTICIAS do firebase
        future: noticias.get(),
        //o builder ta dizendo q neste contexto de forma assincrona, nos vamos
        //"tirar uma foto / uma copia" um snapshot dos dados q estao na collection NOTICIAS
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //se houver erro na conexao, exibe a mensagem a baixo
          if (snapshot.hasError) {
            print("erro na conexao");
          }
          //se a conexao estiver ok, e estiver aguarando... exibe a mensagem
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("carregando");
          }
          //apos realizar a conexao... Nos vamos chamar um ListView
          return ListView(
            //pegando a foto/snapshot/estado atual... E nela pegando
            // em forma de MAP os valores(chave:valores) dos docs da collection
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              //vamos receber os valores acima no formato MAP, sendo eles
              //String sera a {CHAVE:} do documento e o DYNAMIC sera o {VALOR}
              //da chave do documento...{pq assim pd ser String, num, int, etc...}
              Map<String, dynamic> data =
                  //a variavel data q estana linha acima, vai receber os DADOS dos
                  //DOCUMENTOS q estao dentro da COLLECTION NOTICIAS...
                  //dados esse no formato MAP {CHAVE: VALOR}
                  document.data()! as Map<String, dynamic>;
              //SE dentro do DOC da noticia a CHAVE TIPO_NOTICIA, tiver o VALOR
              //NOTICIAECONOMIA... Entao essa noticia sera exibida no LISTTILE
              //a baixo
              if (data['tipo_noticia'] == 'noticiaeconomia') {
                return Material(
                  ////child: Container( IGNORAR
                  //criando um LISTTILE q vai exibir o q ta nos DOC q a NOTICIA e do
                  //tipo NOTICIAECONOMIA
                  child: ListTile(
                    ////height: 100, IGNORAR
                    ////width: 100, IGNORAR
                    ////child: Text(data['titulo_noticia']), IGNORAR
                    //acessando a variavel DATA e nela solicitando os dados q estao
                    //na chave TITULO_NOTICIA, e os dados q estao na chave DESCRICAO_NOTICIA
                    //e imprimindo na tela
                    title: Text(data['titulo_noticia']),
                    subtitle: Text(data['descricao_noticia']),
                  ),
                );
                //SE o tipo da nao noticia nao for TIPOECONOMIA, sera exibido um container
                //vazio
              } else {
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
