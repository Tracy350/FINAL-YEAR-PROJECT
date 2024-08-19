import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:trial2/payment_stuff/stripe_service.dart';
import 'package:trial2/providers/auth_provider.dart';
import 'package:trial2/providers/search_controller.dart';
import 'package:trial2/screens/auth/auth_screen.dart';
import 'package:trial2/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

const Color primaryColor = AppColors.green1;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await FirebaseAppCheck.instance.activate(
//     androidProvider: AndroidProvider.debug,
//     appleProvider: AppleProvider.debug,
//   );
//   StripeService.init();
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (context) => EmailProvider(),
//       ),
//       ChangeNotifierProvider(
//         create: (context) => SearchFieldController(),
//       ),
//     ],
//     child: const MyApp(),
//   ));
// }
const String stripePublishableKey =
    'pk_test_51PTvor02oymYTVMNmyNGufbmFgv8WLxl7fo2nF4CN8lPFdwPPzRhuHvrkYRLhUqsv0LlITqixxu9pL6uewn0fEvi00SFvymhXI';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  Stripe.merchantIdentifier = ' Merchant identifier';
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => EmailProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchFieldController(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: primaryColor),
      home: const AuthScreen(),
    );
  }
}
