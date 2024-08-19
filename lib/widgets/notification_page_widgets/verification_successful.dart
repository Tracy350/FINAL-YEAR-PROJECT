import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationSuccessful extends StatelessWidget {
  const VerificationSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        child: Row(
          children: [
            ClipRRect(
                child: Image.asset(
              'assets/Notification Page/successfulpayment.png',
              width: 70,
              height: 70,
            )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VerificationSuccessful',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, fontSize: 17),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Account Verification complete ',
                  style: GoogleFonts.montserrat(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
