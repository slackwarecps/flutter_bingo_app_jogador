import 'package:bingo_jogador/firebase/models/listin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  adicionarProduto({required String listinId, required Listin listin}) {
    
             firestore.collection("listins").doc(listinId).set(listin.toMap());
  }

     removerProduto({required String listinId, required Listin listin}) {
    print('Produto adicionado');
  }
}

