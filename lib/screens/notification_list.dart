import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/screens/homepage.dart';
import 'package:trial2/screens/navidation_body.dart';
import 'package:trial2/widgets/notification_page_widgets/booking_cancelled.dart';
import 'package:trial2/widgets/notification_page_widgets/payment_successful.dart';
import 'package:trial2/widgets/notification_page_widgets/2stepverificationn_successful.dart';
import 'package:trial2/widgets/notification_page_widgets/verification_successful.dart';
import 'package:trial2/widgets/notification_page_widgets/wallet_notification.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 20,
        ),
        title: Text(
          'Notification',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontWeight: FontWeight.w700)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentSuccessful(),
            const SizedBox(
              height: 20,
            ),
            const WalletNotification(),
            Text(
              'Yesterday',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            const BookingCancelled(),
            const SizedBox(
              height: 20,
            ),
            const StepVerificationSuccessful(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'December 11, 2024',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            const VerificationSuccessful()
          ],
        ),
      ),
    );
  }
}
