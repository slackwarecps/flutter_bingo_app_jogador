import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  entrarUsuario(String email, String senha) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      print('conta logada com sucesso!');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          return "O email não esta cadastrado.";
        case 'wrong-password':
          return 'Senha incorreta.';
      }
      return e.code;
    }
    return null;
  }

  Future<String?> cadastrarUsuario(
      String email, String senha, String nome) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);

      // Atualiza o nome do usuário ! permite poder ser nulo mas aqui nao vai acontecer
      await userCredential.user!.updateDisplayName(nome);

      print('criou o usuario com sucesso! $userCredential');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return "O e-mail já está em uso.";
      }
      print('ERRO!!! $e');
    }
    return null;
  }

  Future<String?> redefinirSenha(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      print('Email de redefinição de senha enviado com sucesso!');
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          return "O email não está cadastrado.";
      }
      return e.code;
    }
  }

  Future<String?> deslogar() async {
    try {
      await _firebaseAuth.signOut();
      print('>> deslogou o usuario');
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<String?> removerConta({required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: _firebaseAuth.currentUser!.email!,
        password: senha,
      );

      await _firebaseAuth.currentUser!.delete();
      print('>> Removido os dados do ususario');
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return null;
  }
}
