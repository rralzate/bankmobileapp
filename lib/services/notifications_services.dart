import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messageKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String title, String message) {
    return Get.snackbar(title, message,
        icon: const Icon(Icons.person, color: Colors.white),
        backgroundColor: const Color.fromRGBO(243, 145, 73, 1),
        colorText: Colors.white);
  }

  static showDefaultDialog(String title, BuildContext context) {
    return Get.defaultDialog(
      title: title,
      titleStyle: Theme.of(context).textTheme.bodyText1,
      content: Column(
        children: [
          CircularProgressIndicator(
            strokeWidth: 3,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
