import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:user_details/core/colors.dart';
import '../controller/function_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final UserController controller = Get.find<UserController>();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: black,
        title: const Text(
          'Search',
          style: TextStyle(color: white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    hintText: 'Search users...',
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                        controller.clearSearch();
                      },
                      icon: const Icon(Icons.clear),
                    )),
                onChanged: (value) {
                  controller.searchUsers(value);
                },
              ),
            ),
            Expanded(
              child: Obx(() {
                final filteredUsers = controller.filteredUsers;
                return filteredUsers.isEmpty
                    ? Center(
                        child: Lottie.asset(
                          'assets/lottie/animation_lmbxu3hl.json',
                          height: height * 0.6,
                          width: width * 0.6,
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filteredUsers[index].name),
                          );
                        },
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
