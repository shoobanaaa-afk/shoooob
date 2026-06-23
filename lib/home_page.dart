import 'package:flutter/material.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentContainer = 0;

  void moveImage() {
    setState(() {
      currentContainer = (currentContainer + 1) % 4;
    });
  }

  Widget buildContainer(int index) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: currentContainer == index
          ? Image.network(
        "https://picsum.photos/100",
        fit: BoxFit.cover,
      )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo App"),
        leading: IconButton(
          icon: const Icon(Icons.login),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Login(),
              ),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
                  (index) => buildContainer(index),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: moveImage,
            child: const Text("Move Image"),
          ),
        ],
      ),
    );
  }
}