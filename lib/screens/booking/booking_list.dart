import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/model/top_rated_model.dart';
import 'package:trial2/screens/homepage.dart';
import 'package:trial2/screens/navidation_body.dart';
import 'package:trial2/widgets/booking_home.dart';

class AllBooking extends StatefulWidget {
  const AllBooking({super.key});

  @override
  State<AllBooking> createState() => _AllBookingState();
}

class _AllBookingState extends State<AllBooking> {
  final ratings = Rating.dataSample;
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
            'Recently Booked',
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(fontWeight: FontWeight.w600)),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Column(
              children: [
                SizedBox(
                  height: 640,
                  child: ListView.builder(
                    itemCount: ratings.length,
                    itemBuilder: (context, index) {
                      return HomeBooking(rating: ratings[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
