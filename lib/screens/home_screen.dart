import 'package:bingojogador/firebase/models/listin.dart';
import 'package:bingojogador/screens/show_senha_confirmacao_dialog.dart';
import 'package:bingojogador/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Listin> listListins = [
    Listin(id: "L001", name: "Feira de Outubro"),
    Listin(id: "L002", name: "Feira de Novembro"),
  ];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://i.ibb.co/xGqDtRR/gato-chorando.jpg'),
                ),
                accountName: Text((widget.user.displayName != null)
                    ? widget.user.displayName!
                    : "Toinho"),
                accountEmail: Text(widget.user.email!)),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              title: Text("Remover conta"),
              onTap: () {
                showSenhaConfirmacao(context: context, email: "");
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              onTap: () {
                AuthService().deslogar();
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Listin - Feira Colaborativa"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormModal();
        },
        child: const Icon(Icons.add),
      ),
      body: (listListins.isEmpty)
          ? const Center(
              child: Text(
                "Nenhuma lista ainda.\nVamos criar a primeira?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                return refresh();
              },
              child: ListView(
                children: List.generate(
                  listListins.length,
                  (index) {
                    Listin model = listListins[index];
                    return Dismissible(
                      key: ValueKey<Listin>(model),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 8),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        removeItem(model);
                      },
                      child: ListTile(
                        onTap: () {
                          print('clicou');
                        },
                        onLongPress: () {
                          print('segurou');
                          showFormModal(model: model);
                        },
                        leading: const Icon(Icons.list_alt_rounded),
                        title: Text(model.name),
                        subtitle: Text(model.id),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }

  showFormModal({Listin? model}) {
    // Labels à serem mostradas no Modal
    String title = "Adicionar Listin";
    String confirmationButton = "Salvar";
    String skipButton = "Cancelar";

    // Controlador do campo que receberá o nome do Listin
    TextEditingController nameController = TextEditingController();

    // caso esteja editando
    if (model != null) {
      title = "Editando Listin";

      nameController.text = model.name;
    }

    // Função do Flutter que mostra o modal na tela
    showModalBottomSheet(
      context: context,

      // Define que as bordas verticais serão arredondadas
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),

          // Formulário com Título, Campo e Botões
          child: ListView(
            children: [
              Text(title),
              TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(label: Text("Nome do Listin")),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(skipButton),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //TODO: Implementar adição
                        // buttonSalvarListin(nameController.text);
                        Listin listin = Listin(
                          id: const Uuid().v1(),
                          name: nameController.text,
                        );

                        //em caso de alteracão
                        if (model != null) {
                          listin.id = model.id;
                        }

                        firestore
                            .collection("listins")
                            .doc(listin.id)
                            .set(listin.toMap());

                        // Atualizar a Lista
                        refresh();

                        Navigator.pop(context);
                      },
                      child: Text(confirmationButton)),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void buttonSalvarListin(String nome) {
    print('clicou em salvar');

    Listin listin = Listin(
      id: const Uuid().v1(),
      name: nome,
    );
    //       firestore.collection("listins").doc(listin.id).set(data);
  }

  refresh() async {
    List<Listin> temp = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("listins").get();

    for (var doc in snapshot.docs) {
      temp.add(Listin.fromMap(doc.data()));
    }

    setState(() {
      listListins = temp;
    });
  }

  void removeItem(Listin model) {
    firestore.collection("listins").doc(model.id).delete();
    refresh();
  }
}
