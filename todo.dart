import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

// Model untuk tugas
class Todo {
  final int id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.description = '',
    required this.startTime,
    required this.endTime,
    this.isCompleted = false,
  });
}

// Provider untuk mengelola daftar tugas
class TodoListProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  // Fungsi untuk mengambil data dari Google Calendar
  Future<void> fetchEvents() async {
    // ... (kode untuk otentikasi dan permintaan API ke Google Calendar)

    // Parsing data dan menyimpan ke database
    for (var event in events) {
      // ... (kode untuk menyimpan data ke database)
    }
    notifyListeners();
  }

  // Fungsi untuk menambahkan tugas secara manual
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  // ... (fungsi untuk menghapus, mengedit, dan fungsi lainnya)
}

// UI untuk menampilkan dan mengelola tugas
class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ... (kode UI untuk menampilkan daftar tugas)
  }
}

// Fungsi utama
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await database.open(); // Membuka database lokal

  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoListProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('To-Do List'),
          ),
          body: TodoList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // ... (kode untuk menambahkan tugas baru)
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    ),
  );
}
