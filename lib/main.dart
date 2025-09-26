// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusMateApp());
}

class CampusMateApp extends StatelessWidget {
  const CampusMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusMate',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}

// Splash Screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text("CampusMate",
                style: TextStyle(color: Colors.white, fontSize: 28)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Dashboard
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {"title": "Notes", "icon": Icons.book, "page": const NotesPage()},
      {"title": "Timetable", "icon": Icons.schedule, "page": const TimetablePage()},
      {"title": "Assignments", "icon": Icons.assignment, "page": const AssignmentsPage()},
      {"title": "News", "icon": Icons.newspaper, "page": Placeholder()},
      {"title": "Chat", "icon": Icons.chat, "page": Placeholder()},
      {"title": "Profile", "icon": Icons.person, "page": Placeholder()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("CampusMate")),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: features.map((f) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => f["page"] as Widget),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(f["icon"] as IconData, size: 50, color: Colors.blue),
                    const SizedBox(height: 10),
                    Text(f["title"] as String,
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Notes Page
class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = ["Stack Notes", "Linked List Notes"];
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.description, color: Colors.blue),
            title: Text(notes[index]),
            trailing: const Icon(Icons.download),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Timetable Page
class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final timetable = {
      "Monday": ["9AM - Math", "10AM - DS"],
      "Tuesday": ["9AM - DBMS", "11AM - OS"],
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Timetable")),
      body: ListView(
        children: timetable.entries.map((entry) {
          return Card(
            child: ListTile(
              title: Text(entry.key,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(entry.value.join("\n")),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Assignments Page
class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final assignments = [
      {"title": "Assignment 1", "status": "Due tomorrow"},
      {"title": "Assignment 2", "status": "Completed"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Assignments")),
      body: ListView(
        children: assignments.map((a) {
          return Card(
            child: ListTile(
              title: Text(a["title"]!),
              subtitle: Text(a["status"]!),
              trailing: Icon(
                a["status"] == "Completed"
                    ? Icons.check_circle
                    : Icons.warning,
                color: a["status"] == "Completed" ? Colors.green : Colors.red,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}















