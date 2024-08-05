import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/utils/color_constants.dart';

class CatagaryCard extends StatelessWidget {
  const CatagaryCard(
      {super.key,
      required this.image,
      required this.title,
      required this.quiz});
  final String image;
  final String title;
  final String quiz;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 80,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: ColorConstants.WHITE),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  quiz,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            height: 200,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8)
            ),
          ),
        ),
        Positioned(bottom: 120, left: 5, child: Image.asset(image,height: 120,))
      ],
    );
  }
}
