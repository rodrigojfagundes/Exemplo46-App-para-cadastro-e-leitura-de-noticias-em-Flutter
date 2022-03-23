import 'package:cloud_firestore/cloud_firestore.dart';

class Fb {
  final String titulonoticia;
  final String descricaonoticia;
  final String tiponoticia;

  Fb(this.titulonoticia, this.descricaonoticia, this.tiponoticia);

  CollectionReference noticias =
      FirebaseFirestore.instance.collection('noticias');

  Future<void> addNoticias(
      String titulonoticia, String descricaonoticia, String tiponoticia) async {
    return await noticias
        .add({
          'titulo_noticia': titulonoticia,
          'descricao_noticia': descricaonoticia,
          'tipo_noticia': tiponoticia,
        })
        .then((value) => print("noticia adicionada"))
        .catchError((error) => print("falha ao cadastar noticia"));
  }
}
