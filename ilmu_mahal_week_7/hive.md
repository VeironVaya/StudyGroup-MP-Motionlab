# Hive Guide for General Usage and Flutter/Dart Implementation

IMPORTANT: Debugging
look at stack overflow on changing the gradles version.

## Introduction

Hive is a lightweight, fast, and NoSQL database for Flutter. It’s particularly well-suited for storing simple data locally on the device. It doesn't require a network connection, making it ideal for offline storage. This guide explains how Hive works and how you can use it in your Flutter applications.

---

## Table of Contents

1. [What is Hive?](#1-what-is-hive?)
2. [Advantages of Using Hive](#2-advantages-of-using-hive)
3. [Setting Up Hive in Flutter](#3-setting-up-hive-in-flutter)
4. [CRUD Operations with Hive](#4-crud-operations-with-hive)
5. [Example of Using Hive in Flutter](#5-example-of-using-hive-in-flutter)



---

## 1. What is Hive?

Hive is a fast key-value database that is simple to use and is perfect for storing small amounts of data, such as settings, user data, or cached results. Unlike traditional databases, Hive doesn’t require any network connectivity, and it’s suitable for both large and small amounts of data. It's based on a NoSQL model, where each value is stored under a unique key.

Hive supports several data types, including basic primitive types, lists, and custom objects.

---

## 2. Advantages of Using Hive

- Lightweight: Hive is fast and lightweight with no need for complex setup.
- Offline Storage: It stores data locally on the device, making it ideal for offline usage.
- Key-Value Pairs: Easily store and retrieve data using simple key-value pairs.
- Simple Setup: No complicated configurations or setup required.
- Strong Typing Support: Hive allows you to store complex objects and even provides adapters for custom types.


---

## 3. Setting Up Hive in Flutter

### 1. Add Dependencies: Add hive and hive_flutter to your pubspec.yaml file:

note: use Ctrl + Shift + P (add dependency) for ez utilizing

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.0.4
  hive_flutter: ^1.1.0

```

### 2. Initialize Hive: In your main.dart, initialize Hive before running the app:

```dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();  // Initialize Hive
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Example',
      home: HomePage(),
    );
  }
}

```

### 3. Create a Box: A box is where Hive stores data. To create a box, use Hive.openBox():

```dart
var box = await Hive.openBox('myBox');
```

---

## 4. CRUD Operations with Hive

### 1. Create / Add Data:
You can use put() to insert or update a value:
```dart
var box = await Hive.openBox('myBox');
await box.put('name', 'John Doe');
```
### 2. Read Data:
```dart
var box = await Hive.openBox('myBox');
String name = box.get('name', defaultValue: 'Unknown');
print(name); // Prints 'John Doe'

```
### 3. Update Data:
```dart
await box.put('name', 'Jane Doe');
```
### 4. Delete Data:
```dart
await box.delete('name');
```
### 5. Clear All Data:
```dart
await box.clear();

```

---

## 5. Example of Using Hive in Flutter

```dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box favoriteBox;

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  void _initializeHive() async {
    favoriteBox = await Hive.openBox('favorites');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Favorite Products'),
      ),
      body: FutureBuilder(
        future: favoriteBox.isOpen ? Future.value(true) : Hive.openBox('favorites'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Fetching products and displaying the favorite status
          List<String> products = ['Product 1', 'Product 2', 'Product 3'];
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              String product = products[index];
              bool isFavorite = favoriteBox.get(product, defaultValue: false);

              return ListTile(
                title: Text(product),
                trailing: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    favoriteBox.put(product, !isFavorite); // Toggle favorite status
                    setState(() {});
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

```
### Key Points:

- Box Creation: The favoriteBox is used to store favorite product statuses.
- CRUD Operations: We add, update, and delete data in the Hive box using put(), get(), and delete().
- Real-Time Updates: The UI is updated automatically when the data changes because we call setState() after updating the favorite status.
- Persisting Data: Data is stored locally and remains even after the app is closed and reopened.
