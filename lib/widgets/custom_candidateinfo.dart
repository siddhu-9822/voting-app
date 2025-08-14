import 'package:flutter/material.dart';
import 'package:flutter_vote/widgets/custom_button.dart';

class CandidateCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final Widget profileScreen;
  final VoidCallback onVote;

  const CandidateCard({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.profileScreen,
    required this.onVote,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.38;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Candidate Info
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: screenWidth * 0.15,
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: screenWidth * 0.06),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: buttonWidth,
                child: CustomButton(
                  text: 'VIEW PROFILE',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profileScreen),
                    );
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                child: CustomButton(text: 'VOTE', onPressed: onVote),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
