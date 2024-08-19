import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/widgets/toggle_switch.dart';

class NotificationListtile extends StatefulWidget {
  const NotificationListtile({super.key, required this.title});

  final String title;

  @override
  State<NotificationListtile> createState() => _NotificationListtileState();
}

class _NotificationListtileState extends State<NotificationListtile> {
  bool lights = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: lights,
      onChanged: (bool value) {
        setState(() {
          lights = value;
        });
      },
      activeColor: AppColors.green1,
      title: Text(
        widget.title,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
