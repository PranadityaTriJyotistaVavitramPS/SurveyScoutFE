import 'dart:io';

import 'package:flutter/material.dart';
import 'package:surveyscout/routes/app_routes.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class PaymentGatewayScreen extends StatefulWidget {
    @override
  _PaymentGatewayScreenState createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  late WebViewController _controller;

  String snapUrl = "";

  @override
  void initState() {
    super.initState();
    snapUrl = Get.arguments?["snapUrl"] ?? "";

    // ✅ Initialize WebView Controller for Android and iOS
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JS
      ..setBackgroundColor(const Color(0xFFF2EEE9))
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
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
      )
      ..loadRequest(Uri.parse(snapUrl)); // Load Midtrans payment page
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
      body: WebViewWidget(controller: _controller),
    );
  }

  // ✅ Handle Payment Success
  void _handlePaymentSuccess() {
    Get.snackbar("Pembayaran Berhasil", "Transaksi Anda telah selesai.",
        backgroundColor: Colors.green, colorText: Colors.white);
    Get.offAllNamed(AppRoutes.paymentConfirmation); // Redirect to a success page
  }

  // ❌ Handle Payment Failure
  void _handlePaymentFailure() {
    Get.snackbar("Pembayaran Gagal", "Silakan coba lagi.",
        backgroundColor: Colors.red, colorText: Colors.white);
    Get.offAllNamed("/transactionReview"); // Redirect back to transaction page
  }
}
