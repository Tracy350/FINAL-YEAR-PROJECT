import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/screens/navidation_body.dart';
import 'package:trial2/widgets/notification_listtile.dart';

class ProfileNotification extends StatefulWidget {
  const ProfileNotification({super.key});

  @override
  State<ProfileNotification> createState() => _ProfileNotificationState();
}

class _ProfileNotificationState extends State<ProfileNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationBody()),
            );
          },
          iconSize: 20,
        ),
        title: Text(
          'Notification',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
      body: Column(
        children: const [
          NotificationListtile(title: 'General Notification'),
          NotificationListtile(title: 'Sound'),
          NotificationListtile(title: 'Vibrate'),
          NotificationListtile(title: 'App Updates'),
          NotificationListtile(title: 'New Service Available'),
          NotificationListtile(title: 'New tips available')
        ],
      ),
    );
  }
}
