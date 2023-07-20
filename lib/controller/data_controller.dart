import 'package:ex_project/model/friends_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ex_project/service/network_service.dart';

class ApiController extends GetxController {
  var friendsList = List<Friends>.empty(growable: true).obs;

  Future<void> fetchApiData() async {
    try {
      var repos = await NetworkService().getFriendsData();
      if (repos.isNotEmpty) {
        friendsList.value = repos;
      }
    } catch (e) {
      debugPrint("Error from fetchAPI ${e.toString()}");
    }
  }

}
