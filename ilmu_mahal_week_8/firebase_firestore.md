# Firebase Firestore Guide for General Usage and Flutter/Dart Implementation

IMPORTANT: from my experience
- When setting up we use CLI so u didnt need to set the environment by urself.
- When downloading for the first time choose the npm version so u can utilize the services in many platform (command promt etc.).
- Look at Stack Overflow or Firebase documentation if you encounter versioning issues.
- When u get to issues such as the data didn't showed up, check the firebase console at rules and make sure it can be readed and written.


## Introduction

Firebase Firestore is a cloud-hosted NoSQL database that allows real-time data synchronization and offline support. Unlike Hive, Firestore requires internet connectivity for updates but can work offline using cached data. This guide explains how Firestore works and how you can use it in your Flutter applications.

---

## Table of Contents

1. [What is Firestore?](#1-what-is-firestore?)
2. [Advantages of Using Firestore](#2-advantages-of-using-firestore)
3. [Setting Up Firestore in Flutter](#3-setting-up-firestore-in-flutter)
4. [CRUD Operations with Firestore](#4-crud-operations-with-firestore)
5. [Example of Using Firestore in Flutter](#5-example-of-using-firestore)

---

## 1. What is Firestore?

Firestore is a flexible, scalable NoSQL cloud database for mobile, web, and server development from Firebase. It supports real-time syncing across clients and provides powerful querying capabilities. Unlike Hive, Firestore is a cloud database that allows multi-device data access.

Firestore stores data in **collections**, which contain **documents**. Each document holds fields in key-value format.

---

## 2. Advantages of Using Firestore

- **Real-time synchronization**: Changes to data are immediately updated across all clients.
- **Cloud-hosted**: Data is stored remotely and accessible from multiple devices.
- **Powerful querying**: Firestore allows structured queries and indexing for performance.
- **Offline support**: Firestore caches data locally when offline.
- **Security**: Firestore provides security rules for data access control.

---

## 3. Setting Up Firestore in Flutter

### 1. Add Dependencies: Add Firebase and Firestore to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cloud_firestore: ^4.8.0
  firebase_core: ^2.15.0
```

### 2. Initialize Firebase: In your `main.dart`, initialize Firebase before running the app:

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Example',
      home: HomePage(),
    );
  }
}
```

### 3. Create a Collection: Firestore organizes data in collections. To create a collection:

```dart
final db = FirebaseFirestore.instance;
final todosCollection = db.collection('todos');
```

---

## 4. CRUD Operations with Firestore

### 1. Create / Add Data:
```dart
void handleCreateTodo() async {
  final newTodo = {
    'text': _textEditingController.text,
    'status': false,
    'createdAt': FieldValue.serverTimestamp(),
  };
  await FirebaseFirestore.instance.collection('todos').add(newTodo);
}
```

### 2. Read Data:
```dart
Stream<QuerySnapshot> getTodos() {
  return FirebaseFirestore.instance.collection('todos')
      .orderBy('createdAt', descending: true)
      .snapshots();
}
```

### 3. Update Data:
```dart
void handleToggleTodo(String id, bool status) async {
  await FirebaseFirestore.instance.collection('todos').doc(id).update({'status': !status});
}
```

### 4. Delete Data:
```dart
void handleDeleteTodo(String id) async {
  await FirebaseFirestore.instance.collection('todos').doc(id).delete();
}
```

### 5. Clear All Data:
```dart
void clearTodos() async {
  var todos = await FirebaseFirestore.instance.collection('todos').get();
  for (var doc in todos.docs) {
    await doc.reference.delete();
  }
}
```

---

## 5. Example of Using Firestore in Flutter

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Todo List',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  void handleCreateTodo() async {
    final newTodo = {
      'text': _textEditingController.text,
      'status': false,
      'createdAt': FieldValue.serverTimestamp(),
    };
    await FirebaseFirestore.instance.collection('todos').add(newTodo);
    _textEditingController.clear();
  }

  void handleToggleTodo(String id, bool status) async {
    await FirebaseFirestore.instance.collection('todos').doc(id).update({'status': !status});
  }

  void handleDeleteTodo(String id) async {
    await FirebaseFirestore.instance.collection('todos').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Todo List')),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(labelText: 'Enter Todo'),
          ),
          ElevatedButton(
            onPressed: handleCreateTodo,
            child: const Text('Add Todo'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('todos').orderBy('createdAt', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final todos = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    var todo = todos[index];
                    return ListTile(
                      title: Text(todo['text']),
                      leading: Checkbox(
                        value: todo['status'],
                        onChanged: (bool? value) {
                          handleToggleTodo(todo.id, todo['status']);
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => handleDeleteTodo(todo.id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

