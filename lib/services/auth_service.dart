

import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  entrarUsuario(String email, String senha) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
    } catch (e) {
      print(e);
    }
  }

  cadastrarUsuario(String email, String senha, String nome) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
      print('criou');
    } catch (e) {
      print('ERRO!!! $e');
    }
  }

}