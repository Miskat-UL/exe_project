import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  /// function to get friends name from a map
  String getFriendsName(Map name) {
    var data = name.entries.map((e) {
      return e.value;
    }).toList();
    return data.join(" ");
  }

  /// function to  launch Email app to send mail
  Future<void> launchEmailComposer(BuildContext context, String email) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final query = encodeQueryParameters(
        <String, String>{'subject': "Hi , hope this email finds you well"});

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: query,
    );
    launchUrl(emailLaunchUri);
  }
}
