import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whatsapp'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(
          Ionicons.arrow_forward,
          color: Colors.black54,
          size: 24,
        ),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text('Welcome to Whatsapp!'),
      ),
      
    );
  }
}
