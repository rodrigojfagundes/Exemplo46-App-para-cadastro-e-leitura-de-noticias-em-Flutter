import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class vertodasnoticias extends StatelessWidget {
  const vertodasnoticias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //collection reference noticias
    CollectionReference noticias =
        FirebaseFirestore.instance.collection('noticias');

    //retornando um FutureBuilder, um FutureBuilder é uma funcao q controi algo,
    //atraves do DADOS q vierem na funcao FUTURE...neste caso ele o BUILDER, ira
    //construir um ListTile com as noticias
    return FutureBuilder<QuerySnapshot>(
      //future recebe os valores da collection reference noticias
      future: noticias.get(),
      //o builder ta dizendo q neste contexto de forma assincrona nos vamos pegar/tirar
      //uma foto/snapshot dos dados da collection noticias
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //se houver erro exibe
        if (snapshot.hasError) {
          return Text("opa, teve erro");
        }
        //se tiver carregando os dados exibe
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("opa, dados ok");
        }
        //retornando listview
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
            return Material(
              //apos isso retorna um container com o q ta nas chaves TITULO_NOTICIA e
              //DESCRICAO_NOTICIA
              child: Container(
                child: Text(data['titulo_noticia']),
                //subtitle: Text(data['descricao_noticia']),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
