import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        icon,
        height: 20,
      ),
      minLeadingWidth: 30,
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          textStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
