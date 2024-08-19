import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 30,
        ),
        title: Text(
          'My Bookmark',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.0,
              mainAxisExtent: 150),
          itemBuilder: (_, index) {
            return Container(
              // color: Colors.black,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: const [],
              ),
            );
          }),
    );
  }
}
