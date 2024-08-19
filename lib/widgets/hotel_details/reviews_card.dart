import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 10),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.bordercolor, width: 1),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jenny Wilson',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700)),
                    Text(
                      'Dec 10, 2024',
                      style: GoogleFonts.montserrat(fontSize: 12),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.green1,
                  ),
                  child: Row(children: [
                    Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    Text(
                      '5',
                      style: GoogleFonts.montserrat(color: Colors.white),
                    )
                  ]),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Very nice and comfortable hotel , thank you for accompanying my vacation',
              style: GoogleFonts.montserrat(),
            ),
          ],
        ),
      ),
    );
  }
}
