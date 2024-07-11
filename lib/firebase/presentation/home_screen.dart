import 'package:bingo_jogador/firebase/models/listin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Listin> listListins = [
    Listin(id: "L001", name: "Feira de Outubro"),
    Listin(id: "L002", name: "Feira de Novembro"),
  ];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          : ListView(
              children: List.generate(
                listListins.length,
                (index) {
                  Listin model = listListins[index];
                  return ListTile(
                    leading: const Icon(Icons.list_alt_rounded),
                    title: Text(model.name),
                    subtitle: Text(model.id),
                  );
                },
              ),
            ),
    );
  }

  showFormModal() {
    // Labels à serem mostradas no Modal
    String title = "Adicionar Listin";
    String confirmationButton = "Salvar";
    String skipButton = "Cancelar";

    // Controlador do campo que receberá o nome do Listin
    TextEditingController nameController = TextEditingController();

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
                            name: nameController.text,);
                    

                        firestore.collection("listins").doc(listin.id).set(listin.toMap());
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
}

void buttonSalvarListin(String nome) {
  print('clicou em salvar');

    Listin listin = Listin(
                        id: const Uuid().v1(), 
                        name: nome,
                        );
               //       firestore.collection("listins").doc(listin.id).set(data);

}
