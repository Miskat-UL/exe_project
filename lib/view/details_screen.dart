import 'package:ex_project/model/friends_data_model.dart';
import 'package:ex_project/utils/utils.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.model}) : super(key: key);
  final Friends model;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Image.network(
              widget.model.picture!.large!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            Utils().getFriendsName(widget.model.name!.toJson()),
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  "${widget.model.location!.state!}, ${widget.model.location!.city!}, ${widget.model.location!.country!}",
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              // button to send email
              Utils().launchEmailComposer(context, widget.model.email!);
            },
            child: Text(
              widget.model.email!,
              style: const TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  color: Colors.blueAccent),
            ),
          ),
          Text(
            widget.model.phone!,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
