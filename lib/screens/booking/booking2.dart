import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/model/top_rated_model.dart';
import 'package:trial2/payment_stuff/stripe_service.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/booking/booking3.dart';

class Booking2 extends StatefulWidget {
  final Rating rating;
  const Booking2({super.key, required this.rating});

  @override
  State<Booking2> createState() => _Booking2State();
}

class _Booking2State extends State<Booking2> {
  String? _selectedTitle;
  String? _selectedPayment;
  String amount = '5000';
  String currency = 'USD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Name of Reservation',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontWeight: FontWeight.w700)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsetsDirectional.symmetric(vertical: 15.0),
                  hintText: 'Title',
                  hintStyle: TextStyle(color: AppColors.hinttext),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.inputinactive)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.green1)),
                  filled: true,
                  fillColor: AppColors.inputinactive),
              value: _selectedTitle,
              items: ['Miss', 'Mr', 'Mrs', 'Dr', 'Ing.', 'Prof']
                  .map((option) => DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTitle = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsetsDirectional.symmetric(vertical: 15.0),
                    hintText: 'First Name',
                    hintStyle: TextStyle(color: AppColors.hinttext),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.inputinactive)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.green1)),
                    filled: true,
                    fillColor: AppColors.inputinactive)),
            const SizedBox(
              height: 20,
            ),
            const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsetsDirectional.symmetric(vertical: 15.0),
                    hintText: 'Last Name',
                    hintStyle: TextStyle(color: AppColors.hinttext),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.inputinactive)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.green1)),
                    filled: true,
                    fillColor: AppColors.inputinactive)),
            const SizedBox(
              height: 20,
            ),
            const TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email_rounded),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsetsDirectional.symmetric(vertical: 15.0),
                    hintText: 'E-mail',
                    hintStyle: TextStyle(color: AppColors.hinttext),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.inputinactive)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.green1)),
                    filled: true,
                    fillColor: AppColors.inputinactive)),
            const SizedBox(
              height: 20,
            ),
            const TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.phone_android_rounded),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsetsDirectional.symmetric(vertical: 15.0),
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: AppColors.hinttext),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.inputinactive)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.green1)),
                    filled: true,
                    fillColor: AppColors.inputinactive)),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsetsDirectional.symmetric(vertical: 15.0),
                  hintText: 'Mode of payment',
                  hintStyle: TextStyle(color: AppColors.hinttext),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.inputinactive)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.green1)),
                  filled: true,
                  fillColor: AppColors.inputinactive),
              value: _selectedPayment,
              items: ['Credit Card', 'Mobile Money']
                  .map((option) => DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPayment = value;
                });
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    onPressed: () async {
                      // try{
                      //   await StripeService.initPaymentSheet(amount, currency);
                      //   await StripeService.presentPaymentSheet();
                      // } catch(e){
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text("Error: ${e.toString()}"))
                      //   );
                      // }
                    },
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
