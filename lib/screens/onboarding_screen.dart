import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/utils/onboarding_content.dart';
import 'package:trial2/screens/auth/login_option.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  if (value == 2) {
                    setState(() {
                      isLastPage = true;
                    });
                  } else {
                    setState(() {
                      isLastPage = false;
                    });
                  }
                });
              },
              itemCount: contents.length,
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Image.asset(contents[i].image, ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(
                      contents[i].title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      contents[i].description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 16, color: Colors.grey)),
                    )
                  ],
                );
              }),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.0002,
        ),
        SmoothPageIndicator(
          controller: controller,
          count: contents.length,
          effect: const ExpandingDotsEffect(
              spacing: 10,
              dotColor: AppColors.grey2,
              activeDotColor: AppColors.green1,
              dotHeight: 5,
              dotWidth: 5),
          onDotClicked: (index) {
            controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 20, right: 20),
          child: Container(
              height: 40,
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: AppColors.green1,
                onPressed: () {
                  isLastPage
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginOption(),
                          ),
                        )
                      : controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                },
                child: Text(
                  isLastPage ? 'Get Started' : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )),
        ),
      ],
    ));
  }
}
