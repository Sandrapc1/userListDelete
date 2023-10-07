import 'package:get/get.dart';
import '../core/colors.dart';
import '../model/user_model.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var filteredUsers = <User>[].obs;

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

   void searchUsers(String query) {
    filteredUsers.clear();
    for (var user in users) {
      if (user.name.toLowerCase().contains(query.toLowerCase())) {
        filteredUsers.add(user);
      }
    }
  }
    void clearSearch() {
    filteredUsers.clear();
  }
}
