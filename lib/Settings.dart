  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';

  class Settings  extends StatelessWidget{
    const Settings({super.key});
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade500,
          title: Text("Settings Page"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: .center,
            children: [
              const Text("Settings Page",
                style: TextStyle(color: Colors.greenAccent,fontSize: 30, fontWeight:FontWeight.bold),
              )
            ],
          ),
        ),
      );
    }
  }

