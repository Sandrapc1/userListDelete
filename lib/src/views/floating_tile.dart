import 'package:flutter/material.dart';
import '../controller/function_controller.dart';
import '../../core/colors.dart';
import '../model/user_model.dart';

class FloatingTile extends StatelessWidget {
  const FloatingTile({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: black,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            String name = '';
            int age = 0;
            return AlertDialog(
              title: const Text('Add User'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    onChanged: (value) {
                      age = int.tryParse(value) ?? 0;
                    },
                    decoration: const InputDecoration(labelText: 'Age'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    User newUser = User(name: name, age: age);
                    controller.addUser(newUser);
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
        color: white,
      ),
    );
  }
}
