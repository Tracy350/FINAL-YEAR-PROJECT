import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';
import 'package:trial2/screens/booking/booking2.dart';
import 'package:trial2/screens/payment_page.dart';
import 'package:http/http.dart' as http;

class Booking3 extends StatefulWidget {
  const Booking3({super.key});

  @override
  State<Booking3> createState() => _Booking3State();
}

// void main(){
//   Stripe.publishableKey = "pk_test_51PTvor02oymYTVMNmyNGufbmFgv8WLxl7fo2nF4CN8lPFdwPPzRhuHvrkYRLhUqsv0LlITqixxu9pL6uewn0fEvi00SFvymhXI";
// }

class _Booking3State extends State<Booking3> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Payment',
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Payment Methods',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15)),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Add New Card',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: AppColors.green1)),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/momo.png',
                    height: 100,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Mobile Money',
                    style: GoogleFonts.montserrat(
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  const Spacer(),
                  Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/credit_card.jpg',
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('Credit Card',
                      style: GoogleFonts.montserrat(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w600))),
                  const Spacer(),
                  Radio(
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      })
                ],
              ),
            ],
          ),
        )

        //DIFFERENT PART//
        //  Padding(
        //    padding: const EdgeInsets.all(12.0),
        //    child: Form(
        //     key:_formKey,
        //      child: Column(
        //       children: [
        //         TextFormField(
        //           controller: amountController,
        //           autovalidateMode: AutovalidateMode.onUserInteraction,
        //           validator: (value) {
        //             if (value ==null || value.isEmpty){
        //               return 'Please enter the amount';
        //             }
        //             return null;
        //           },
        //           decoration: const InputDecoration(
        //                 border: InputBorder.none,
        //                 contentPadding: EdgeInsetsDirectional.symmetric(vertical: 15.0),
        //                 hintText: '1000',
        //                 prefix: Text('GHS'),
        //                 hintStyle: TextStyle(color: AppColors.hinttext),
        //                 enabledBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(color: AppColors.inputinactive)),
        //                 focusedBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(color: AppColors.green1)),
        //                 filled: true,
        //                 fillColor: AppColors.inputinactive)
        //         ),
        //         SizedBox(height: 20,),
        //         TextFormField(
        //           controller: emailController,
        //           autovalidateMode: AutovalidateMode.onUserInteraction,
        //           validator: (value) {
        //             if (value ==null || value.isEmpty){
        //               return 'Please enter the email';
        //             }
        //             return null;
        //           },
        //           decoration: const InputDecoration(
        //                 border: InputBorder.none,
        //                 contentPadding: EdgeInsetsDirectional.symmetric(vertical: 15.0),
        //                 hintText: 'example@gmail.com',
        //                labelText: 'Email',
        //                 hintStyle: TextStyle(color: AppColors.hinttext),
        //                 enabledBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(color: AppColors.inputinactive)),
        //                 focusedBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(color: AppColors.green1)),
        //                 filled: true,
        //                 fillColor: AppColors.inputinactive)
        //         ),
        //          Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //             child: Container(
        //                 height: 40,
        //                 margin: EdgeInsets.all(5),
        //                 width: double.infinity,
        //                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        //                 child: MaterialButton(
        //                   child: Text(
        //                     'make Payment',
        //                     style: TextStyle(color: Colors.white),
        //                   ),
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(50)),
        //                   color: AppColors.green1,
        //                   onPressed: () {
        //                     // showDialog(
        //                     //     context: context,
        //                     //     builder: (context) => const Booking3());

        //                     if(!_formKey.currentState!.validate()){
        //                       return ;
        //                     }
        //                     // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(
        //                     //   amount: amountController.text,
        //                     //   email: emailController.text,

        //                     // )
        //                     // ));
        //                   },
        //                 )),
        //           )
        //       ],
        //      ),
        //    ),
        //  )

        );
  }
}
