import 'package:flutter/material.dart';

class MyRecordsScreen extends StatelessWidget {
  const MyRecordsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Records"),
        leading: const  Icon(Icons.list_alt_rounded),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red, Colors.black],
            
          ),
        ),
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}