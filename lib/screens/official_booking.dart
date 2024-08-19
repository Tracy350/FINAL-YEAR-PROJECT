import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/homepage.dart';

import 'package:trial2/widgets/booking_list.dart';

class OfficialBooking extends StatelessWidget {
  const OfficialBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          iconSize: 20,
        ),
        title: Text(
          'My Booking',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: BookingList(),
            ),
            BookingPageList(),
            const SizedBox(
              height: 10,
            ),
            BookingPageList(),
            const SizedBox(
              height: 10,
            ),
            BookingPageList(),
            const SizedBox(
              height: 10,
            ),
            BookingPageList(),
          ],
        ),
      ),
    );
  }

  Padding BookingPageList() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        height: 150,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/toprated1.png',
                      height: 80, width: 80, fit: BoxFit.cover),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Palms Casino Resort',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700))),
                    Text(
                      'Kasoa, Ghana',
                      style: GoogleFonts.montserrat(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 25,
                      width: 200,
                      decoration: BoxDecoration(
                        color: AppColors.cancelledbg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment
                          .center, // Center the text within the container
                      child: Text(
                        'Cancelled & Refunded',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: AppColors.cancelledtext,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.cancelledbg,
              ),
              height: 30,
              alignment: Alignment.center,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.warning,
                    color: AppColors.cancelledtext,
                  ),
                  Text(
                    'You cancelled this hotel booking',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: AppColors.cancelledtext, fontSize: 13)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
