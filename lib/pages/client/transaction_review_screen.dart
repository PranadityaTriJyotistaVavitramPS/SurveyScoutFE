import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:iconify_flutter/icons/icon_park_solid.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:get/get.dart';
import 'package:surveyscout/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';

class TransactionReviewScreen extends StatefulWidget {
  @override
  _TransactionReviewScreenState createState() => _TransactionReviewScreenState();
}

class _TransactionReviewScreenState extends State<TransactionReviewScreen> {

  final TextEditingController _projectRespondentKualifikasiLainnyaController = TextEditingController();
  final TextEditingController _projectRespondentUsiaRangeController = TextEditingController();
  final TextEditingController _minAgeController = TextEditingController();
  final TextEditingController _maxAgeController = TextEditingController();
  final TextEditingController _projectRespondentKabKotaTinggalController = TextEditingController();
  final TextEditingController _projectRespondentHobiController = TextEditingController();
  final List<String> _selectedHobbies = [];
  final List<String> _selectedEducationLevels = [];
  final List<String> _selectedMaritalStatuses = [];
  final List<String> _selectedJobs = [];

  Widget _buildReceiptRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: Color(0xFF705D54),
              )),
          Text(value,
              textAlign: TextAlign.right,
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: Color(0xFF705D54),
              )),
        ],
      ),
    );
  }

  void _clearFormData() {
    final box = GetStorage();
    box.remove('project_respondent_kualifikasi_lainnya');
    box.remove('project_respondent_usia_range');
    box.remove('project_respondent_kab_kota_tinggal');
    box.remove('project_respondent_hobi');
    box.remove('project_respondent_status_kawin');
    box.remove('project_respondent_pendidikan');
    box.remove('project_respondent_pekerjaan');

    // Also clear UI fields if necessary
    setState(() {
      _projectRespondentKualifikasiLainnyaController.clear();
      _projectRespondentUsiaRangeController.clear();
      _minAgeController.clear();
      _maxAgeController.clear();
      _projectRespondentKabKotaTinggalController.clear();
      _projectRespondentHobiController.clear();
      _selectedHobbies.clear();
      _selectedEducationLevels.clear();
      _selectedMaritalStatuses.clear();
      _selectedJobs.clear();
    });

    print("All form data cleared!"); // Debugging log
  }

  void _showSaveDraftBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      backgroundColor: Color(0xFFF0E8E4),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 60,
              height: 4,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Color(0xFFB0B0B0),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 32),

            // Title
            Text(
              "Simpan sebagai draft?",
              style: TextStyle(
                color: Color(0xFF705D54),
                fontSize: 24,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.w700,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),

            // Subtitle
            Text(
              "Anda dapat melanjutkannya lain kali",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                color: Color(0xFFA3948D),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),

            // Buttons Section with Background Color
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFF826754), // Background color behind buttons
              child: Row(
                children: [
                  // Simpan Button (Filled)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back(); // Close modal
                        Get.toNamed(AppRoutes.clientProjectList);
                        Future.delayed(Duration(milliseconds: 500), () {
                          Get.snackbar(
                            "Draft tersimpan",
                            "Anda dapat melanjutkan pengisian proyek kapan saja.",
                            snackPosition: SnackPosition.BOTTOM, // Snackbar at bottom
                            backgroundColor: Color(0xFF826754),
                            colorText: Colors.white,
                            margin: EdgeInsets.all(16),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEDE7E2), // Match "Lanjut" button
                        foregroundColor: Color(0xFF826754), // Text color
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // 8dp rounded rectangle
                        ),
                      ),
                      child: Text("Ya, Simpan", style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold)),
                    ),
                  ),

                  SizedBox(width: 8), // Space between buttons

                  // Jangan Simpan Button (Outlined)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _clearFormData();
                        Get.back();
                        Get.toNamed(AppRoutes.clientProjectList);
                        Future.delayed(Duration(milliseconds: 500), () {
                          Get.snackbar(
                            "Proyek diurungkan",
                            "Anda membatalkan proyek ini.",
                            snackPosition: SnackPosition.BOTTOM, // Snackbar at bottom
                            backgroundColor: Color(0xFF826754),
                            colorText: Colors.white,
                            margin: EdgeInsets.all(16),
                          );
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFFEDE7E2)), // Match "Kembali" button
                        foregroundColor: Color(0xFFEDE7E2),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // 8dp rounded rectangle
                        ),
                      ),
                      child: Text("Jangan Simpan", style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EEE9),
      appBar: AppBar(
        title: Text(
          'Scouting Talent',
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
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Iconify(MaterialSymbols.more_vert, color: Color(0xFF826754)),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100, 100, 0, 0),
                items: [
                  PopupMenuItem(
                    value: 'save_draft',
                    child: Text('Simpan sebagai draft'),
                  ),
                ],
              ).then((value) {
                if (value == 'save_draft') {
                  _showSaveDraftBottomSheet();
                }
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Bar
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFF826754),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFF826754),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFF826754),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Title "Langkah 3"
                Text(
                  'Langkah 3',
                  style: TextStyle(
                    color: Color(0xFF705D54),
                    fontSize: 24,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),

                SizedBox(height: 8),
                Text(
                  'Tinjau dan konfirmasi transaksi untuk proyek “Studi Kepuasan Penggunaan Produk Kecantikan”',
                  style: GoogleFonts.nunitoSans(
                    color: Color(0xFFA3948D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24), // Add spacing before receipt section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF0E8E4),
                border: Border(
                  top: BorderSide(color: Color(0xFF826754), width: 1),
                  bottom: BorderSide(color: Color(0xFF826754), width: 1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildReceiptRow("Komisi", "Rp 200.000"),
                  _buildReceiptRow("Biaya Penanganan", "Rp 5.000"),
                  _buildReceiptRow("Biaya Administrasi Bank", "Rp 0"),
                  Divider(color: Color(0xFF826754), thickness: 1),
                  _buildReceiptRow("Total Pembayaran", "Rp 205.000", isBold: true),
                ],
              ),
            ),
            // Garansi Uang Kembali Panel

            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFA3948D), // Background color
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Iconify(IconParkSolid.protect, color: Colors.white, size: 24), // Icon
                  ),
                  SizedBox(width: 12), // Spacing
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Garansi Uang Kembali 100%",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Pembayaran Anda akan dikembalikan apabila tidak ada kandidat yang mendaftar setelah 7 hari pengunggahan",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16), // Spacing below panel

            // Pembayaran akan diproses dengan
            Text(
              "Pembayaran akan diproses dengan",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Color(0xFF705D54),
              ),
            ),

            SizedBox(height: 8), // Spacing

            // Payment Processing Image (Replace with actual asset or URL)
            Center(
              child: Image.asset(
                "assets/images/qrislogo.png",
                width: 167,
                height: 27,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Color(0xFF826754), // Footer background color
        child: Row(
          children: [
            // Kembali Button (Outlined) - Takes Half Width
            Expanded(
              child: OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFFEDE7E2)),
                  foregroundColor: Color(0xFFEDE7E2),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // 8dp rounded rectangle
                  ),
                ),
                child: Text("Kembali", style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold)),
              ),
            ),

            SizedBox(width: 8), // Space between buttons

            // Lanjut Button (Filled) - Takes Half Width
            Expanded(
              child: ElevatedButton.icon(
                // onPressed: () => Get.back(),
                onPressed: () {
                  String snapUrl = "https://app.sandbox.midtrans.com/snap/v2/vtweb/TRANSACTION_TOKEN"; // Replace with dynamic URL

                  Get.toNamed(AppRoutes.paymentGateway, arguments: {
                    "snapUrl": snapUrl, // ✅ Pass Snap URL
                  });
                }, // Disable if incomplete
                icon: Icon(Icons.arrow_forward, size: 20),
                label: Text("Lanjut", style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  // backgroundColor: _isFormComplete() ? Color(0xFFEDE7E2) : Color(0xFFB5A89A), // Disabled color if incomplete
                  foregroundColor: Color(0xFF826754), // Text/icon color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // 8dp rounded rectangle
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
