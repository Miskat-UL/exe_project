import 'dart:convert';

import 'package:ex_project/model/friends_data_model.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  String baseUrl = "https://randomuser.me/api/?results=10";

  /// function to fetch data
  Future<List<Friends>> getFriendsData() async {
    var data = await http.get(Uri.parse(baseUrl));
    var json = jsonDecode(data.body)['results'];

    List<Friends> friendsList = [];
    for (var data in json) {
      friendsList.add(Friends.fromJson(data));
    }
    return friendsList;
  }
}
