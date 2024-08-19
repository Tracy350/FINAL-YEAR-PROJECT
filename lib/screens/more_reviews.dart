import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/widgets/more_review_chips.dart';
import 'package:trial2/screens/hotel/hotel_details.dart';
import 'package:trial2/widgets/hotel_details/reviews_card.dart';

class MoreReviews extends StatelessWidget {
  const MoreReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          iconSize: 20,
        ),
        title: Text(
          'Reviews',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          const MoreReviewsChips(),
          Row(
            children: [
              Text('Review',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, fontSize: 18)),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text('4.8',
                  style: GoogleFonts.montserrat(
                      color: AppColors.green1, fontWeight: FontWeight.w600)),
              Text(
                '(4,981 reviews)',
                style: GoogleFonts.montserrat(fontSize: 12),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MoreReviews()));
                  },
                  child: Text(
                    'See All ',
                    style: GoogleFonts.montserrat(
                        color: AppColors.green1, fontWeight: FontWeight.w700),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const ReviewsCard(),
          const SizedBox(
            height: 20,
          ),
          const ReviewsCard(),
          const SizedBox(
            height: 20,
          ),
          const ReviewsCard(),
          const SizedBox(
            height: 20,
          ),
          const ReviewsCard(),
          const SizedBox(
            height: 20,
          ),
          const ReviewsCard(),
          const SizedBox(
            height: 20,
          ),
          const ReviewsCard(),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
