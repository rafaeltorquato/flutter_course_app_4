import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App'),
        ),
        body: const Center(
          child: Text('Initial'),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
