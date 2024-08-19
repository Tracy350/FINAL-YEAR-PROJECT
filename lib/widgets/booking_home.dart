import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/model/top_rated_model.dart';
import 'package:trial2/utils/colors.dart';

class HomeBooking extends StatelessWidget {
  final Rating rating;
  const HomeBooking({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              rating.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rating.hotelname,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    rating.hotellocation,
                    style: GoogleFonts.montserrat(),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        rating.rating.toString(),
                        style: GoogleFonts.montserrat(color: AppColors.green1),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        '(4,748 reviews)',
                        style: GoogleFonts.montserrat(),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  Text(
                    rating.price,
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: AppColors.green1,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '/night',
                    style: GoogleFonts.montserrat(),
                  ),
                  const Icon(Icons.bookmark, color: AppColors.green1)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
