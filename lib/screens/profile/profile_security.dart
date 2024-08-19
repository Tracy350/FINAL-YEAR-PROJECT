import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/screens/navidation_body.dart';
import 'package:trial2/widgets/notification_listtile.dart';

class ProfileSecurity extends StatefulWidget {
  const ProfileSecurity({super.key});

  @override
  State<ProfileSecurity> createState() => _ProfileSecurityState();
}

class _ProfileSecurityState extends State<ProfileSecurity> {
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
          'Security',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
      body:  Column(
        children: [
          NotificationListtile(title: 'Face ID'),
          NotificationListtile(title: 'Remember me'),
          NotificationListtile(title: 'Touch ID'),
        ],
      ),
    );
  }
}
