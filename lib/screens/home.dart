import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('The count is $count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          count++;
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
