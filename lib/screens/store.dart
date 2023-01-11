import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  Store({Key? key}) : super(key: key);
  final Faker faker = Faker();
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
          10,
          (index) => ListTile(
            title: Text(
              widget.faker.lorem.word(),
            ),
          ),
        ),
      ),
    );
  }
}
