class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Travel safely,\n comfortable & easily',
    image: 'assets/onboarding1.png',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam',
  ),
  OnboardingContent(
    title: 'Travel safely, \n comfortable & easily',
    image: 'assets/onboarding2.png',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam',
  ),
  OnboardingContent(
    title: 'Travel safely,\n comfortable & easily',
    image: 'assets/onboarding3.png',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam',
  ),
];
