

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

  Future<String?> cadastrarUsuario(String email, String senha, String nome) async {
    try {
      UserCredential userCredential =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
     
      // Atualiza o nome do usuário ! permite poder ser nulo mas aqui nao vai acontecer
      await userCredential.user!.updateDisplayName(nome);
     
      print('criou o usuario com sucesso! $userCredential');
    }  on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return "O e-mail já está em uso.";
      }
       print('ERRO!!! $e');
     
     
    }
        return null;
  }

}