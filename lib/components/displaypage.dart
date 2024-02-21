import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage(
      {super.key, required this.name, required this.id, required this.email});

  final String name;
  final String id;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Page'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Here is your info!!!"),
                const SizedBox(height: 20),
                Text("Name: $name"),
                const SizedBox(height: 20),
                Text("ID: $id"),
                const SizedBox(height: 20),
                Text("Email: $email"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go back to form page'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
