import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial2/utils/colors.dart';

class SquareTile extends StatelessWidget {
  final String svgPath;
  const SquareTile({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Adjust width as needed
      height: 60, // Adjust height as needed
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.bordercolor),
          borderRadius: BorderRadius.circular(20) // Border color
          ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SvgPicture.asset(
          svgPath,
        ),
      ),
    );
  }
}
