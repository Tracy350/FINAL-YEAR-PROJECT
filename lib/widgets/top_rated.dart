import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/model/top_rated_model.dart';
import 'package:trial2/screens/hotel/hotel_details.dart';

class TopRatedTile extends StatelessWidget {
  final Rating rating;

  const TopRatedTile({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    double tileHeight = MediaQuery.of(context).size.height * 0.4;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HotelDetail(
                        rating: rating,
                      )),
            );
          },
          child: Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  rating.image,
                  height: tileHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: tileHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 13.0),
                          decoration: BoxDecoration(
                              color: AppColors.green1,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.white),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                rating.rating.toString(),
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rating.hotelname,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  rating.hotellocation,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Text.rich(TextSpan(
                                        text: rating.price,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' /per night',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12))
                                        ])),
                                    const SizedBox(
                                      width: 150,
                                    ),
                                    const Icon(
                                      Icons.bookmark_outline,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
