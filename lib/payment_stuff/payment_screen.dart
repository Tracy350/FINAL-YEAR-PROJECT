import 'package:flutter/material.dart';
import 'package:trial2/payment_stuff/stripe_service.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String amount = '5000';
  String currency = 'USD';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Payment Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) const CircularProgressIndicator(),
            if (!isLoading)
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  StripeService.instance.makePayment();
                  // try {
                  //   await StripeService.initPaymentSheet(amount, currency);
                  //   await StripeService.presentPaymentSheet();
                  // } catch (e) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text("Error: ${e.toString()}")),
                  //   );
                  // } finally {
                  //   setState(() {

                  //     isLoading = false;
                  //   });
                  // }
                },
                child: Text('Pay with card'),
              ),
          ],
        ),
      ),
    );
  }
}
