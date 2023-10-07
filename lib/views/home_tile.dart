import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller/function_controller.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Obx(() {
      if (controller.users.isEmpty) {
        return  Center(
          child:  Lottie.asset('assets/lottie/Animation - 1696711106882.json',height: height*0.6,width:width*0.6),
        );
      }
      return ListView.builder(
        itemCount: controller.users.length,
        itemBuilder: (context, index) {
          final user = controller.users[index];

          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.horizontal,
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd ||
                  direction == DismissDirection.endToStart) {
                controller.deleteUser(index);
              }
            },
            child: ListTile(
              title: Text('Name: ${user.name}'),
              subtitle: Text('Age: ${user.age}'),
            ),
          );
        },
      );
    });
  }
}
