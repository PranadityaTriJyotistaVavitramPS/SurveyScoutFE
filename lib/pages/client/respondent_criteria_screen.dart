import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/cil.dart';
import 'package:iconify_flutter/icons/codicon.dart';
import 'package:iconify_flutter/icons/gis.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:surveyscout/routes/app_routes.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:intl/intl.dart';

class RespondentCriteriaDetailsScreen extends StatefulWidget {
  @override
  _RespondentCriteriaDetailsScreenState createState() => _RespondentCriteriaDetailsScreenState();}


class _RespondentCriteriaDetailsScreenState extends State<RespondentCriteriaDetailsScreen> {
  final TextEditingController _projectRespondentKualifikasiLainnyaController = TextEditingController();
  final TextEditingController _projectRespondentUsiaRangeController = TextEditingController();
  final TextEditingController _projectRespondentKabKotaTinggalController = TextEditingController();
  final TextEditingController _projectRespondentHobiController = TextEditingController();
  final TextEditingController _projectRespondentStatusKawinController = TextEditingController();
  final TextEditingController _projectRespondentPendidikanController = TextEditingController();
  final TextEditingController _projectRespondentPekerjaanController = TextEditingController();

  int _totalKomisi = 0;

  bool _isFormComplete() {
    return _projectRespondentUsiaRangeController.text.isNotEmpty &&
        _projectRespondentKualifikasiLainnyaController.text.isNotEmpty &&
        _projectRespondentKabKotaTinggalController.text.isNotEmpty &&
        _projectRespondentHobiController.text.isNotEmpty &&
        _projectRespondentStatusKawinController.text.isNotEmpty &&
        _projectRespondentPendidikanController.text.isNotEmpty &&
        _projectRespondentPekerjaanController.text.isNotEmpty;
  }

  bool _isFormFilled() {
    return _projectRespondentUsiaRangeController.text.isNotEmpty ||
        _projectRespondentKualifikasiLainnyaController.text.isNotEmpty ||
        _projectRespondentKabKotaTinggalController.text.isNotEmpty ||
        _projectRespondentHobiController.text.isNotEmpty ||
        _projectRespondentStatusKawinController.text.isNotEmpty ||
        _projectRespondentPendidikanController.text.isNotEmpty ||
        _projectRespondentPekerjaanController.text.isNotEmpty;
  }


  @override
  void initState() {
    super.initState();
    _projectRespondentKualifikasiLainnyaController.text =
        GetStorage().read('project_description') ?? '';
    _projectRespondentUsiaRangeController.text = GetStorage().read('project_title') ?? '';
    _projectRespondentKabKotaTinggalController.text = GetStorage().read('project_qualification') ?? '';
    _projectRespondentHobiController.text = GetStorage().read('project_outcome') ?? '';
    _projectRespondentStatusKawinController.text = GetStorage().read('project_commission') ?? '';
    _projectRespondentPendidikanController.text = GetStorage().read('project_respondent_amount') ?? '';
    _projectRespondentPekerjaanController.text = GetStorage().read('project_location') ?? '';

  }

  @override
  void dispose() {
    _projectRespondentKualifikasiLainnyaController.dispose();
    _projectRespondentUsiaRangeController.dispose();
    _projectRespondentKabKotaTinggalController.dispose();
    _projectRespondentHobiController.dispose();
    _projectRespondentStatusKawinController.dispose();
    _projectRespondentPekerjaanController.dispose();
    _projectRespondentPendidikanController.dispose();
    super.dispose();
  }


  void _saveProjectRespondentUsiaRange(String value) {
    GetStorage().write('project_respondent_usia_range', value);
  }

  void _saveProjectRespondentKabKotaTinggal(String value) {
    GetStorage().write('project_respondent_kab_kota_tinggal', value);
  }

  void _saveProjectRespondentHobi(String value) {
    GetStorage().write('project_respondent_hobi', value);
  }

  void _saveProjectRespondentStatusKawin(String value) {
    GetStorage().write('project_respondent_status_kawin', value);
  }

  void _saveProjectRespondentPendidikan(String value) {
    GetStorage().write('project_respondent_pendidikan', value);
  }

  void _saveProjectRespondentPekerjaan(String value) {
    GetStorage().write('project_respondent_pekerjaan', value);
  }

  void _saveProjectRespondentKualifikasiLainnya(String value) {
    GetStorage().write('project_respondent_kualifikasi_lainnya', value);
  }


  void _saveDraft() {
    _saveProjectRespondentUsiaRange(_projectRespondentUsiaRangeController.text);
    _saveProjectRespondentKualifikasiLainnya(_projectRespondentKualifikasiLainnyaController.text);
    _saveProjectRespondentKabKotaTinggal(_projectRespondentKabKotaTinggalController.text);
    _saveProjectRespondentHobi(_projectRespondentHobiController.text);
    _saveProjectRespondentStatusKawin(_projectRespondentStatusKawinController.text);
    _saveProjectRespondentPendidikan(_projectRespondentPendidikanController.text);
    _saveProjectRespondentPekerjaan(_projectRespondentPekerjaanController.text);
    _saveProjectRespondentPendidikan(_projectRespondentPendidikanController.text);
  }

  bool _isRemote = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EEE9),
      appBar: AppBar(
        title: Text('Scouting Respondent',style: GoogleFonts.nunitoSans(
            fontSize: 16,
            color: Color(0xFF705D54),
            fontWeight: FontWeight.bold
        )),
        backgroundColor: Color(0xFFD7CCC8),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF826754)),
        leading: IconButton(
          icon: Iconify(MaterialSymbols.arrow_back,color: Color(0xFF826754)),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Iconify(MaterialSymbols.more_vert,color: Color(0xFF826754)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            //Progress bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress bar with full width and 16dp spacing
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0), // Add 16dp spacing below progress bar
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFF826754),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFF826754),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFF826754),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
              ],
            ),

            SizedBox(height: 8),
            Text(
              'Ceritakan kriteria latar belakang responden yang Anda butuhkan. Biarkan kosong bagian yang tidak memiliki syarat yang mengikat.',
              style: GoogleFonts.nunitoSans(
                color: Color(0xFFA3948D),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24),
            _buildEditableTextField(
              title: "Rentang Usia",
              controller: _projectRespondentUsiaRangeController,
              hintText: "20-25",
              icon: Iconify(Healthicons.elderly_outline, color: Color(0xFF826754)),
              onChanged: (value) {
                _saveProjectRespondentUsiaRange(value);
                setState(() {}); // Force UI to update
              },
            ),
            SizedBox(height: 16),
            _buildEditableTextField(
              title: "Kabupaten/Kota Tempat Tinggal",
              controller: _projectRespondentKabKotaTinggalController,
              hintText: "Surabaya",
              icon: Iconify(Mdi.home_variant_outline, color: Color(0xFF826754)),
              onChanged: (value) {
                _saveProjectRespondentKabKotaTinggal(value);
                setState(() {}); // Force UI to update
              },
            ),
            SizedBox(height: 16),
            _buildEditableTextField(
              title: "Hobi",
              controller: _projectRespondentHobiController,
              hintText: "Memasak, menyanyi",
              icon: Iconify(AntDesign.heart_outline, color: Color(0xFF826754)),
              onChanged: (value) {
                _saveProjectRespondentHobi(value);
                setState(() {}); // Force UI to update
              },
            ),
            SizedBox(height: 16),
            _buildEditableTextField(
              title: "Status Perkawinan",
              controller: _projectRespondentStatusKawinController,
              hintText: "Belum menikah",
              icon: Iconify(Mdi.ring, color: Color(0xFF826754)),
              onChanged: (value) {
                _saveProjectRespondentStatusKawin(value);
                setState(() {}); // Force UI to update
              },
            ),
            SizedBox(height: 16),
            _buildEditableTextField(
              title: "Tingkat Pendidikan",
              controller: _projectRespondentPendidikanController,
              hintText: "Lulus SMA",
              icon: Iconify(Cil.education, color: Color(0xFF826754)),
              onChanged: (value) {
                _saveProjectRespondentPendidikan(value);
                setState(() {}); // Force UI to update
              },
            ),
            SizedBox(height: 16),
            _buildEditableTextField(
              title: "Pekerjaan",
              controller: _projectRespondentPekerjaanController,
              hintText: "Pegawai Swasta",
              icon: Iconify(Ph.briefcase_light, color: Color(0xFF826754)),
              onChanged: (value) {
                _saveProjectRespondentPekerjaan(value);
                setState(() {}); // Force UI to update
              },
            ),
            SizedBox(height: 16),
            _buildEditableTextField(
              title: "Kualifikasi Lainnya",
              controller: _projectRespondentKualifikasiLainnyaController,
              hintText: "Menggunakan produk kecantikan secara rutin dalam sebulan terakhir...",
              icon: Iconify(Gis.search_propertie, color: Color(0xFF826754)),
              onChanged: (value) {
                _saveProjectRespondentKualifikasiLainnya(value);
                setState(() {}); // Force UI to update
              },
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
                onPressed: _isFormComplete() ? () => Get.toNamed(AppRoutes.transactionReview) : null, // Disable if incomplete
                icon: Icon(Icons.arrow_forward, size: 20),
                label: Text("Lanjut", style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFormComplete() ? Color(0xFFEDE7E2) : Color(0xFFB5A89A), // Disabled color if incomplete
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

Widget _buildEditableTextField({
  required String title,
  required TextEditingController controller,
  required String hintText,
  required Widget icon,
  required Function(String) onChanged,
  bool enabled = true,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.nunitoSans(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF705D54),
        ),
      ),
      SizedBox(height: 8),
      TextField(
        controller: controller,
        onChanged: onChanged,
        enabled: enabled,
        maxLines: null, // Allow multi-line input
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.nunitoSans(color: Color(0xFFA3948D)),
          prefixIcon:  SizedBox(width: 24, height: 24, child: Center(child: icon)), // Icon inside text field
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF826754), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF826754), width: 2),
          ),
        ),
      ),
    ],
  );

}



