import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  const SingleCard({
    Key? key,
    required this.name,
    required this.image,
    required this.country,
  }) : super(key: key);
  final String name;
  final String image;
  final String country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.network(image),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(name), Text(country)],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
