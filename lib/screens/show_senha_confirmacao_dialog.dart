import 'package:bingojogador/services/auth_service.dart';
import 'package:flutter/material.dart';

showSenhaConfirmacao({
  required BuildContext context,
  required String email,
}) {
  print('confirmacao ');

  showDialog(
    context: context,
    builder: (context) {
      TextEditingController senhaConfirmacaoController =
          TextEditingController();
      return AlertDialog(
        title: Text("Deseja remover a conta com o email $email?"),
        content: SizedBox(
          height: 175,
          child: Column(
            children: [
              Text("Para confirmar a remoção da conta, insira sua senha: "),
              TextFormField(
                  controller: senhaConfirmacaoController,
                  obscureText: true,
                  decoration: InputDecoration(label: Text("Senha")))
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              AuthService()
                  .removerConta(senha: senhaConfirmacaoController.text)
                  .then((String? retorno) {
                if (retorno == null) {
                  Navigator.pop(context);
                }
              });
            },
            child: Text("EXCLUIR A CONTA"),
          )
        ],
      );
    },
  );
}
