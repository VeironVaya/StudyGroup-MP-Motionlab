# API Guide for General Usage and Flutter/Dart Implementation

IMPORTANT: from My Brother
use bruno is better than postman because it linked to github and open-source.

## Introduction

An API (Application Programming Interface) is a set of rules and tools that allows software applications to communicate with each other. APIs provide a standardized way to access functionality or data from other services, enabling developers to build more robust and interconnected applications. This guide explores general API concepts and how they can be implemented in Flutter using Dart.

---

## Table of Contents

1. [What is an API?](#1-what-is-an-api)
2. [Types of APIs](#2-types-of-apis)
3. [How APIs Work](#3-how-apis-work)
4. [Advantages of Using APIs](#4-advantages-of-using-apis)
5. [Implementing APIs in Flutter](#5-implementing-apis-in-flutter)
6. [Example of API Usage in Flutter](#6-example-of-api-usage-in-flutter)


---

## 1. What is an API?

An API is a medium through which applications can access the services or resources of another application, platform, or hardware device. APIs abstract the underlying implementation and expose only the objects or actions the developer needs.

---

## 2. Types of APIs

### **Based on Usage**
- Web APIs: Enable communication over HTTP/HTTPS (e.g., REST, GraphQL).
- Operating System APIs: Allow apps to interact with system resources (e.g., Android API, iOS API).
- Library or Framework APIs: Provide prebuilt functionality (e.g., Flutter API).

### **Based on Architecture**
- REST (Representational State Transfer): A lightweight, stateless architecture that uses HTTP methods.
- SOAP (Simple Object Access Protocol): A protocol that uses XML for communication.
- GraphQL: A query language for fetching data with more flexibility.
- gRPC: Uses HTTP/2 and Protocol Buffers for faster communication.

---

## 3. How APIs Work

APIs act as a bridge between two systems. The interaction involves:

- **1. Request:** A client sends an HTTP request (GET, POST, PUT, DELETE) to the server with the necessary data or parameters.
- **2. Proccesing:** The server processes the request and retrieves or manipulates the requested data.
- **3. Response:** The server sends back a response in a standard format, typically JSON or XML.

Examples: 

request:
```json
GET /users/123 HTTP/1.1
Host: api.example.com
Authorization: Bearer <token>
```
response:
```json
{
  "id": 123,
  "name": "John Doe",
  "email": "johndoe@example.com"
}
```


---

## 4. Advantages of Using APIs

- **Integration:** Connect multiple systems seamlessly.
- **Scalability:** Reduce the need for duplicating code by accessing remote services.
- **Efficiency:** Speed up development by leveraging existing services.
- **Automation:** Enable automated workflows between applications.
- **Consistency:** Standardized interfaces lead to uniform application behavior.

---

## 5. Implementing APIs in Flutter

Flutter, using the Dart language, provides robust tools and libraries for API integration. The most commonly used library is http for making HTTP requests.
Using Dio's actually doable too.


---

## 6.Example of API Usage in Flutter

```dart
class ProductController extends GetxController {
  var products = <dynamic>[].obs;
  var categories = <String>[].obs;
  var selectedCategory = 'All'.obs;
  var isLoading = true.obs;
  var isLoadingCategories = true.obs;
  var searchQuery = ''.obs; // Store the current search query

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
  }

  Future<void> fetchCategories() async {
    try {
      isLoadingCategories.value = true;
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products/category-list'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is List && data.isNotEmpty) {
          categories.value = ['All', ...List<String>.from(data)];
        } else {
          categories.value = ['All'];
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      categories.value = ['All'];
    } finally {
      isLoadingCategories.value = false;
    }
  }

  Future<void> fetchProducts([String? category]) async {
    isLoading.value = true;
    try {
      String url = category != null && category != 'All'
          ? 'https://dummyjson.com/products/category/$category'
          : 'https://dummyjson.com/products';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        products.value = data['products'];
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchProducts(String query) async {
    isLoading.value = true;
    try {
      final url = 'https://dummyjson.com/products/search?q=$query';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        products.value = data['products'];
      } else {
        throw Exception('Failed to search products');
      }
    } catch (e) {
      print('Error searching products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
    fetchProducts(category);
  }
}

```
**Key Points:**
- State Management with GetX: The ProductController manages the state for products and categories.
- PI Calls: http package is used for making API requests.
- Real-Time Updates: Observables (obs) automatically update the UI when their values change.
- Error Handling: Includes basic try-catch blocks for managing errors.