import 'package:flutter/material.dart';

class VoteInfoCard extends StatelessWidget {
  final String title;
  final String dateInfo;
  final String description;
  final Color backgroundColor;

  const VoteInfoCard({
    super.key,
    required this.title,
    required this.dateInfo,
    required this.description,
    this.backgroundColor = const Color(0xffF8E2EE),
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25, // 30% of screen height
      width: size.width * 0.9, // 80% of screen width
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.01),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.07, // dynamic font size
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            dateInfo,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
