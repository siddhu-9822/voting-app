import 'package:flutter/material.dart';

class CandidateInfo extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;

  const CandidateInfo({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: screenWidth * 0.12, // responsive radius
        ),
        SizedBox(width: screenWidth * 0.05),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // responsive font
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
