// import 'package:get/get.dart';
// import 'package:user_details/core/colors.dart';

// class UserListController extends GetxController {
//   var users = <String>['User 1', 'User 2', 'User 3', 'User 4', 'User 5'].obs;

//   void addUser() {
//     users.add('New User');
//     Get.snackbar('', 'Add the New User',
//     backgroundColor: white);
//   }

//   void deleteUser(int index)async {
//     users.removeAt(index);
//     Get.snackbar('', 'Remove from user',
//     backgroundColor: red,
//     colorText: white
//     );
//   }
// }

import 'package:get/get.dart';
import '../core/colors.dart';
import '../model/user_model.dart';

class UserController extends GetxController {
  var users = <User>[].obs;

  void addUser(User user) {
    users.add(user);
     Get.snackbar('Add New User', '',
    backgroundColor: white);
  }

  void deleteUser(int index) {
    users.removeAt(index);
     Get.snackbar('Remove from User', '',
    backgroundColor: red,
    colorText: white
    );
  }
}
