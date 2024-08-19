import "package:http/http.dart" as http;
import "package:logger/logger.dart";
import "package:trial2/utils/constants.dart";

Future<dynamic> initPayment() async {
  try {
    final url = Uri.parse(paystackPayUrl);
    final resp = await http.post(
      url,
      body: {
        "email": "g.ikwegbu@gmail.com",
        "amount": "10000",
        "reference": "randomDetails",
        "callback_url": "https://github.com/gikwegbu",
      },
      headers: {
        'Authorization': 'Bearer sk_test_039***************',
        'Content-Type': 'application/json',
      },
    );
    Logger().d(resp);
  } catch (e) {}
}
