import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _blurSigma = 200;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whatsapp 2'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        elevation: 8,
        enableFeedback: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(_index == 0
                ? Ionicons.chatbubbles
                : Ionicons.chatbubbles_outline),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(_index == 1 ? Ionicons.call : Ionicons.call_outline),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(_index == 2 ? Ionicons.people : Ionicons.people_outline),
            label: 'Contacts',
          ),
        ],
        currentIndex: _index,
        onTap: (value) => {
          setState(() {
            _index = value;
          })
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(
          Icons.message,
          color: Colors.white,
          size: 24,
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text('Person $index'),
              subtitle: Text('Hello!'),
            );
          },
        ),
      ),
    );
  }
}
