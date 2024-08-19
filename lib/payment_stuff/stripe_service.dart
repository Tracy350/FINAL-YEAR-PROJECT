// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_stripe/flutter_stripe.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:logger/logger.dart';

// // class StripeService {
// //   static String apiBase = 'https://api.stripe.com/v1';
// //   static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';

// //   static String secret = 'sk_test_VePHdqKTYQjKNInc7u56JBrQ';
// //   static Map<String, String> headers = {
// //     "Authorization": 'Bearer ${StripeService.secret}',
// //     'Content-Type': 'application/x-www-form-urlencoded'
// //   };

// //   static init() {
// //     Stripe.publishableKey = 'pk_test_TYooMQauvdEDq54NiTphI7jx';
// //   }

// //   static Future<Map<String, dynamic>> createPaymentIntent(
// //       String amount, String currency) async {
// //     try {
// //       Map<String, dynamic> body = {
// //         'amount': amount,
// //         'currency': currency,
// //         'payment_method_types[]': 'card'
// //       };
// //       var response = await http.post(
// //         Uri.parse(StripeService.paymentApiUrl),
// //         body: body,
// //         headers: StripeService.headers,
// //       );
// //       return jsonDecode(response.body);
// //     } catch (e) {
// //       // throw Exception("Failed to create payment intent");
// //       Logger().d(e.toString());
// //       throw Exception(e.toString());
// //     }
// //   }

// //   static Future<void> initPaymentSheet(String amount, String currency) async {
// //     try {
// //       // Create payment intent
// //       final paymentIntent = await createPaymentIntent(amount, currency);
// //       Logger().d(paymentIntent['client_secret']);

// //       // Initialize payment sheet
// //       await Stripe.instance.initPaymentSheet(
// //         paymentSheetParameters: SetupPaymentSheetParameters(
// //           paymentIntentClientSecret:
// //               paymentIntent['client_secret'], // Correct key here
// //           merchantDisplayName: "Your Merchant Name",
// //           style: ThemeMode.system,
// //         ),
// //       );
// //     } catch (e) {
// //       Logger().d(e.toString());
// //       throw Exception(e.toString());
// //     }
// //   }

// //   static Future<void> presentPaymentSheet() async {
// //     try {
// //       await Stripe.instance.presentPaymentSheet();
// //     } catch (e) {
// //       Logger().d(e.toString());
// //       throw Exception(e.toString());
// //       // throw Exception("Failed to present payment intent");
// //     }
// //   }
// // }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';

// class StripeService {
//   static String apiBase = 'https://api.stripe.com/v1/payment_intents';
//   static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';

//   static String secret = 'pk_test_51PTvor02oymYTVMNmyNGufbmFgv8WLxl7fo2nF4CN8lPFdwPPzRhuHvrkYRLhUqsv0LlITqixxu9pL6uewn0fEvi00SFvymhXI'; // Your actual secret key
//   static Map<String, String> headers = {
//     "Authorization": 'Bearer ${StripeService.secret}',
//     'Content-Type': 'application/x-www-form-urlencoded'
//   };

//   static init() {
//     Stripe.publishableKey = 'pk_test_51PTvor02oymYTVMNmyNGufbmFgv8WLxl7fo2nF4CN8lPFdwPPzRhuHvrkYRLhUqsv0LlITqixxu9pL6uewn0fEvi00SFvymhXI'; // Your actual publishable key
//   }

//   static Future<Map<String, dynamic>> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': amount, // Ensure this is in the smallest currency unit (e.g., cents)
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       var response = await http.post(
//         Uri.parse(StripeService.paymentApiUrl),
//         body: body,
//         headers: StripeService.headers,
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to create PaymentIntent: ${response.body}');
//       }
//     } catch (e) {
//       Logger().e("Failed to create payment intent: $e");
//       throw Exception("Failed to create payment intent: $e");
//     }
//   }

//   static Future<void> initPaymentSheet(String amount, String currency) async {
//     try {
//       // Create payment intent
//       final paymentIntent = await createPaymentIntent(amount, currency);

//       // Retrieve the client_secret from the PaymentIntent response
//       final clientSecret = paymentIntent['client_secret'];

//       if (clientSecret == null) {
//         throw Exception("client_secret is null");
//       }

//       Logger().d("Client Secret: $clientSecret");

//       // Initialize payment sheet
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: clientSecret, // Correct key here
//           merchantDisplayName: "Your Merchant Name",
//           style: ThemeMode.system,
//         ),
//       );
//     } catch (e) {
//       Logger().e("Failed to initialize payment sheet: $e");
//       throw Exception("Failed to initialize payment sheet: $e");
//     }
//   }

//   static Future<void> presentPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//     } catch (e) {
//       Logger().e("Failed to present payment sheet: $e");
//       throw Exception("Failed to present payment sheet: $e");
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:trial2/payment_stuff/constants.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment() async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(10, "usd");
    if (paymentIntentClientSecret == null) return;
    await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: 'Tracy Funkor'
    ));
    await _processPayment();
    } catch (e) {
      print(e);
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        'amount': _calculateAmont(amount),
        'currency': currency,
      };
      var response = await dio.post('https://api.stripe.com/v1/payment_intents',
          data: data,
          options:
              Options(contentType: Headers.formUrlEncodedContentType, headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded'
          }));
          if (response.data !=null){
            return response.data["client_secret"];
          }
          return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    }catch (e) {
      print(e);
    }
  }

  String _calculateAmont(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}
