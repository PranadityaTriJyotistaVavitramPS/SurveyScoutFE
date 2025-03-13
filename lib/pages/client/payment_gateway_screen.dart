import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class PaymentGatewayScreen extends StatefulWidget {
  final String snapUrl; // ✅ The URL for Midtrans payment page

  PaymentGatewayScreen({required this.snapUrl});

  @override
  _PaymentGatewayScreenState createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EEE9),
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: GoogleFonts.nunitoSans(
            fontSize: 16,
            color: Color(0xFF705D54),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFD7CCC8),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF826754)),
        leading: IconButton(
          icon: Iconify(MaterialSymbols.arrow_back, color: Color(0xFF826754)),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: WebView(
        initialUrl: widget.snapUrl, // ✅ Load Midtrans payment page
        javascriptMode: JavascriptMode.unrestricted, // ✅ Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.contains("transaction-success")) {
            _handlePaymentSuccess();
            return NavigationDecision.prevent;
          }
          if (request.url.contains("transaction-failed")) {
            _handlePaymentFailure();
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  // ✅ Handle Payment Success
  void _handlePaymentSuccess() {
    Get.snackbar("Pembayaran Berhasil", "Transaksi Anda telah selesai.",
        backgroundColor: Colors.green, colorText: Colors.white);
    Get.of; // Redirect to a success page
  }

  // ❌ Handle Payment Failure
  void _handlePaymentFailure() {
    Get.snackbar("Pembayaran Gagal", "Silakan coba lagi.",
        backgroundColor: Colors.red, colorText: Colors.white);
    Get.offAllNamed("/transactionReview"); // Redirect back to transaction page
  }
}
