import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPaymentPage extends StatefulWidget {
  const RazorpayPaymentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RazorpayPaymentPageState createState() => _RazorpayPaymentPageState();
}

class _RazorpayPaymentPageState extends State<RazorpayPaymentPage> {
  late Razorpay razorpay;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success event
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure event
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet event
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_1slNTHFN6cyL1p', // Your Razorpay Test API Key
      'amount': int.parse(textEditingController.text) * 100,
      'name': 'Sample Store',
      'description': 'Sample Payment',
      'prefill': {
        'contact': '9999999999',
        'email': 'test@samplestore.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error occurred while opening checkout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razorpay Payment Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: textEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter amount to pay',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: openCheckout,
            child: const Text('Pay Now'),
          ),
          const SizedBox(height: 16),
          SvgPicture.asset(
            'assets/razorpay_logo.svg',
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    razorpay.clear();
  }
}

class SvgPicture {
  static asset(String s, {required int width, required int height}) {}
}
