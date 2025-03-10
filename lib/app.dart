import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'controllers/client/project_controller.dart';
import 'controllers/global/auth_controller.dart';
import 'controllers/global/payment_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget

class SurveyScoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize controllers globally
    Get.put(ProjectController());
    // Get.put(AuthController());
    // Get.put(PaymentController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SurveyScout',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        textTheme: GoogleFonts.nunitoSansTextTheme(), // Example custom font
      ),
      initialRoute: AppRoutes.respondentCriteriaDetails,
      getPages: AppPages.pages,
    );
  }
}
