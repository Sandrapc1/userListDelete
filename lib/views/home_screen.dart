import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_details/core/colors.dart';
import 'package:user_details/views/home_tile.dart';
import '../controller/function_controller.dart';
import 'floating_tile.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen({super.key});
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: black,
        title: const Text(
          'User List',
          style: TextStyle(color: white, fontSize: 20),
        ),
      ),
      body: UserTile(controller: controller),
      floatingActionButton: FloatingTile(controller: controller),
    );
  }
}
