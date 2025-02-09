import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // TextEditingController untuk melakukan controlling input text
  final _textEditingController = TextEditingController();

  // Fungsi akan dipanggil ketika tombol 'tambah todo' ditekan
  void handleCreateTodo() async {
    final newTodo = {
      'text': _textEditingController.text,
      'status': false,
      'createdAt': Timestamp.now()
    };
    final db = FirebaseFirestore.instance;
    await db.collection('todos').add(newTodo);
    _textEditingController.text = "";
  }

  // Fungsi akan dipanggil ketika todo di checklist/unchecklist
  void handleToggleTodo(String id, bool status) async {
    final updatedTodo = {
      'status': !status,
    };
    final db = FirebaseFirestore.instance;
    await db.collection('todos').doc(id).update(updatedTodo);
  }

  // Fungsi akan dipanggil ketika menghapus salah satu todo
  void handleDeleteTodo(String id) async {
    final db = FirebaseFirestore.instance;
    await db.collection('todos').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFEEEFF5),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          const Text(
                            'List Of Todos',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('todos')
                                .orderBy('createdAt', descending: false)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return Column(
                                children: [
                                  for (final document in snapshot.data!.docs)
                                    TodoItemWidget(
                                      id: document.id,
                                      name: document.data()['text'],
                                      status: document.data()['status'],
                                      onDelete: (id) {
                                        handleDeleteTodo(id);
                                      },
                                      onToggle: (id, status) {
                                        handleToggleTodo(id, status);
                                      },
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                            hintText: 'Add a new todo item',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                      child: TextButton(
                        onPressed: () {
                          handleCreateTodo();
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoItemWidget extends StatelessWidget {
  final String id;
  final String name;
  final bool status;
  final void Function(String) onDelete;
  final void Function(String, bool) onToggle;

  const TodoItemWidget({
    super.key,
    required this.id,
    required this.name,
    required this.status,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToggle(id, status);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          status ? Icons.check_box : Icons.check_box_outline_blank,
          color: const Color(0xFF5F52EE),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF3A3A3A),
            decoration: status ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: const Color(0xFFDA4040),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDelete(id);
            },
          ),
        ),
      ),
    );
  }
}
