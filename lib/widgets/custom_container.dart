import 'package:flutter/material.dart';

class VoteInfoCard extends StatelessWidget {
  final String title;
  final String dateInfo;
  final String description;
  final Color backgroundColor; // new parameter

  const VoteInfoCard({
    super.key,
    required this.title,
    required this.dateInfo,
    required this.description,
    this.backgroundColor = const Color(0xffF8E2EE),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 440,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            dateInfo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
