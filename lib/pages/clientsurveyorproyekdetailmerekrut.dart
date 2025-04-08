import 'package:flutter/material.dart';
import 'package:surveyscout/pages/respondenprojects.dart';
import 'dart:async'; // Import untuk Future.delayed
import 'clientsignup.dart';
import 'surveyorprojects.dart';
import 'respondenprojects.dart';

void main() {
  runApp(Clientsurveyorproyekdetailmerekrut());
}

class Clientsurveyorproyekdetailmerekrut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF2EEE9), // Warna latar belakang
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // Tinggi total AppBar (50 + 10 padding)
          child: Container(
            padding: EdgeInsets.only(top: 20), // Padding atas 10
            color: Color(0xFFD7CCC8), // Warna background AppBar
            child: AppBar(
              backgroundColor: Colors.transparent, // Transparan agar tidak menimpa warna Container
              toolbarHeight: 50,
              centerTitle: true,
              elevation: 0, // Hilangkan shadow agar lebih rapi
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF705D54)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                'Detail Proyek Survey',
                style: TextStyle(
                  fontFamily: 'NutinoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Color(0xFF705D54),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(27), // Padding di semua sisi
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Sejajar ke kiri
              mainAxisAlignment: MainAxisAlignment.start, // Tetap di atas
              children: [
                Text(
                  'Pengamatan Lalu Lintas di Simpang Lima Semarang',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "SourceSans3",
                    color: Color(0xFF705D54),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10), // Spasi antar elemen
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Padding dalam container
                  decoration: BoxDecoration(
                    color: Color(0xFF826754), // Warna latar belakang container
                    borderRadius: BorderRadius.circular(16), // Membuat sudut melengkung
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Sesuaikan ukuran Container dengan konten
                    children: [
                      Icon(
                        Icons.search, // Ganti dengan ikon sesuai kebutuhan
                        color: Colors.white,
                        size: 14, // Ukuran ikon sesuai teks
                      ),
                      SizedBox(width: 6), // Jarak antara ikon dan teks
                      Text(
                        'Merekrut',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NunitoSans",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Diunggah pada 12.31 WIB, Senin, 20 Jan. 2025',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "NunitoSans",
                    color: Color(0xFFA3948D),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8), // Padding dalam container
                  decoration: BoxDecoration(
                    color: Color(0xFFA3948D), // Warna latar belakang container
                    borderRadius: BorderRadius.circular(8), // Membuat sudut melengkung
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Sesuaikan ukuran Container dengan konten
                    children: [
                      Icon(
                        Icons.punch_clock_rounded, // Ganti dengan ikon sesuai kebutuhan
                        color: Colors.white,
                        size: 14, // Ukuran ikon sesuai teks
                      ),
                      SizedBox(width: 6), // Jarak antara ikon dan teks
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tenggat Waktu',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NunitoSans",
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '10.00 WIB, Kamis, 20 Maret 2025 (2 bulan lagi)',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NunitoSans",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width * 4.55/11,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFEDE7E2),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max, // Memastikan Row mengikuti lebar Container
                          children: [
                            Icon(Icons.location_on, color: Color(0xFFA3948D), size: 20), // Ikon di kiri
                            SizedBox(width: 8), // Jarak antara ikon dan teks
                            Flexible( // Ganti Expanded dengan Flexible untuk menghindari unbounded width issue
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lokasi Survei',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "NunitoSans",
                                      color: Color(0xFFA3948D),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Simpang Lima, Semarang',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NunitoSans",
                                      color: Color(0xFFA3948D),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width:MediaQuery.of(context).size.width * 4.55/11,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFEDE7E2),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max, // Memastikan Row mengikuti lebar Container
                          children: [
                            Icon(Icons.money, color: Color(0xFFA3948D), size: 20), // Ikon di kiri
                            SizedBox(width: 8), // Jarak antara ikon dan teks
                            Flexible( // Ganti Expanded dengan Flexible untuk menghindari unbounded width issue
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Komisi',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "NunitoSans",
                                      color: Color(0xFFA3948D),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Rp 500.000',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NunitoSans",
                                      color: Color(0xFFA3948D),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity, // Lebar penuh
                  height: 1, // Tinggi 1
                  color: Color(0xFFB0B0B0),
                ),
                SizedBox(height: 10),
                Container(
                  width:double.infinity,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFEDE7E2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max, // Memastikan Row mengikuti lebar Container
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        children: [
                          Container(
                            width: 57,
                            height: 100,

                            decoration: BoxDecoration(
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 30,
                                  bottom: 33,
                                  child: CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Colors.red, // Warna bingkai
                                    backgroundImage: AssetImage('assets/images/foto1.png'), // Ganti dengan path gambar Anda
                                  ),
                                ),
                                Positioned(
                                  right: 30,
                                  bottom: 33,
                                  child: CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Colors.blue, // Warna bingkai
                                    backgroundImage: AssetImage('assets/images/foto2.png'), // Ganti dengan path gambar Anda
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.green, // Warna bingkai
                                  backgroundImage: AssetImage('assets/images/foto3.png'), // Ganti dengan path gambar Anda
                                ),
                              ],

                            ),
                          ),
                        ],
                      ),


                      SizedBox(width: 8), // Jarak antara ikon dan teks
                      Flexible( // Ganti Expanded dengan Flexible untuk menghindari unbounded width issue
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '20 pelamar telah mendaftar',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NunitoSans",
                                color: Color(0xFF705D54),
                              ),
                            ),
                            SizedBox(height: 4),
                            Wrap(
                              children: [
                                Text(
                                  'Tinjau pengalaman mereka atau mulai chat untuk screening',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NunitoSans",
                                    color: Color(0xFFA3948D),
                                  ),

                                ),
                              ],
                            ),

                            SizedBox(height: 4),
                            Wrap(
                              children: [
                                GestureDetector(
                                  onTap: () {

                                    _showPelamar(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF826754),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center, // Pusatkan teks dan ikon
                                      children: [
                                        Icon(Icons.local_post_office_sharp, size: 14, color: Color(0xFFEDE7E2)), // Ikon di kiri
                                        SizedBox(width: 4), // Jarak antara ikon dan teks
                                        Text(
                                          'Tinjau',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "NunitoSans",
                                            color: Color(0xFFEDE7E2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "SourceSans3",
                    color: Color(0xFF705D54),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Surveyor diminta untuk mencatat jumlah kendaraan yang melewati Simpang Lima selama jam sibuk (07:00-09:00 dan 16:00-18:00). Data akan digunakan untuk analisis kepadatan lalu lintas guna mendukung rencana pembangunan jalan baru.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "NunitoSans",
                    color: Color(0xFFA3948D),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Kualifikasi',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "SourceSans3",
                    color: Color(0xFF705D54),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Tenaga surveyor harus Cermat menghitung kendaraan secara manual. Mampu menggunakan Excel untuk rekap data. Nyaman bekerja di luar ruangan.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "NunitoSans",
                    color: Color(0xFFA3948D),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Luaran',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "SourceSans3",
                    color: Color(0xFF705D54),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Untuk dapat menyelesaikan proyek ini, surveyor diminta memberikan File Excel berisi rekap jumlah kendaraan berdasarkan kategori (mobil, motor, bus). Foto kondisi simpang lima selama pengamatan.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "NunitoSans",
                    color: Color(0xFFA3948D),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'ID #ASD1321',
                        textAlign: TextAlign.center, // Rata tengah
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "NunitoSans",
                          color: Color(0xFFB0B0B0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ),
      ),

    );
  }

  void _showPelamar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      isScrollControlled: true, // Allow bottom sheet to adjust based on its content
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)), // Apply rounded corners to the content
          child: Container(
            width: MediaQuery.of(context).size.width, // Make the width fill the screen
            padding: EdgeInsets.all(24),
            color: Color(0xFFF1E9E5),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Makes the bottom sheet take only necessary height
              children: [
                Container(
                  width: 100,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Color(0xFFB0B0B0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(height: 10), // Spasi antara garis dan tulisan
                Stack(
                  children: [

                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Pelamar",
                            style: TextStyle(
                              fontFamily: 'SourceSans3',
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF705D54),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFB8ADA5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                "20",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'SourceSans3',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF826754),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Future.delayed(Duration.zero, () {
                          _apaartiangkaini(context); // Tampilkan pop-up kedua
                        });
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.grey[400],
                          child: Icon(
                            Icons.question_mark,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [

                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/hermanwalton.png'),
                        ),
                        Positioned(
                          bottom: -3,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              width: 45,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xFFD7CCC8),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF826754),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.thumb_up,
                                    color: Color(0xFF826754),
                                    size: 8,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "90%",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF826754),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          //color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Herman Walton",
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF705D54),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Anda",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFA3948D),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " :  Oke, ditunggu ya, ini nanti untuk linknya zoom.us/InterviewWonderesearch",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFA3948D),
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF826754),
                          width: 1,
                        ),
                      ),
                      child: Icon(Icons.task, color: Color(0xFF826754)),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Future.delayed(Duration.zero, () {
                          _rekrutpelamarini(context); // Tampilkan pop-up kedua
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF826754),
                        ),
                        child: Icon(Icons.arrow_forward_rounded, color: Color(0xFFF1E9E5)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [

                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/bagaskaraputra.png'),
                        ),
                        Positioned(
                          bottom: -3,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              width: 45,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xFFD7CCC8),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF826754),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.thumb_up,
                                    color: Color(0xFF826754),
                                    size: 8,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "80%",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF826754),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          //color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bagaskara Putra",
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF705D54),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Bagaskara",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFA3948D),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " :  Baik, Pak/Bu, saya bersedia untuk Zoom interview besok pagi",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFA3948D),
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF826754),
                          width: 1,
                        ),
                      ),
                      child: Icon(Icons.task, color: Color(0xFF826754)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF826754),
                      ),
                      child: Icon(Icons.arrow_forward_rounded, color: Color(0xFFF1E9E5)),
                    )
                  ],
                ),
                Row(
                  children: [

                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/indri.png'),
                        ),
                        Positioned(
                          bottom: -3,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              width: 45,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xFFD7CCC8),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF826754),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.thumb_up,
                                    color: Color(0xFF826754),
                                    size: 8,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "NEW",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF826754),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          //color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Indri Putri",
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF705D54),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFA3948D),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Belum ada percakapan. Tekan untuk memulai Chat.",

                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFB0B0B0),
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF826754),
                          width: 1,
                        ),
                      ),
                      child: Icon(Icons.task, color: Color(0xFF826754)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF826754),
                      ),
                      child: Icon(Icons.arrow_forward_rounded, color: Color(0xFFF1E9E5)),
                    )
                  ],
                ),
                Row(
                  children: [

                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/austinpamungkas.png'),
                        ),
                        Positioned(
                          bottom: -3,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              width: 45,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xFFD7CCC8),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF826754),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.thumb_up,
                                    color: Color(0xFF826754),
                                    size: 8,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "85%",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF826754),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          //color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Austin Pamungkas",
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF705D54),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "",
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFA3948D),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Belum ada percakapan. Tekan untuk memulai Chat.",

                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFB0B0B0),
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF826754),
                          width: 1,
                        ),
                      ),
                      child: Icon(Icons.task, color: Color(0xFF826754)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF826754),
                      ),
                      child: Icon(Icons.arrow_forward_rounded, color: Color(0xFFF1E9E5)),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,

                  child: Text.rich(
                    TextSpan(
                      text: "16 lainnya telah ditolak. ",
                      style: TextStyle(
                        fontFamily: "NunitoSans",
                        color: Color(0xFFA3948D),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: "Tampilkan?",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _rekrutpelamarini(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(0),
            color: Color(0xFFF1E9E5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24),
                Divider(
                  thickness: 3,
                  indent: 150,
                  endIndent: 150,
                  color: Color(0xFFB0B0B0),
                ),
                SizedBox(height: 10),
                Text(
                  "Rekrut Pelamar Ini?",
                  style: TextStyle(
                    fontFamily: 'SourceSans3',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF705D54),
                  ),
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/hermanwalton.png'),
                    ),
                    Positioned(
                      bottom: -3,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          width: 45,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Color(0xFFD7CCC8),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFF826754),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Color(0xFF826754),
                                size: 8,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "90%",
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF826754),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  "Herman Walton",
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF705D54),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xFF826754),

                  ),
                  child: Row(
                    children: [

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Future.delayed(Duration.zero, () {
                              _apakahandayakinmerekrutpelamarini(context); // Tampilkan pop-up kedua
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E9E5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.account_box,
                                  color: Color(0xFF826754),
                                  size: 24,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Ya, rekrut",
                                  style: TextStyle(
                                    color: Color(0xFF826754),
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Future.delayed(Duration.zero, () {
                              _apakahandayakinmenolakpelamarini(context); // Tampilkan pop-up kedua
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFFF1E9E5), width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.not_interested,
                                  color: Color(0xFFF1E9E5),
                                  size: 24,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Tolak",
                                  style: TextStyle(
                                    color: Color(0xFFF1E9E5),
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _apakahandayakinmerekrutpelamarini(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(0),
            color: Color(0xFFF1E9E5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24),
                Divider(
                  thickness: 3,
                  indent: 150,
                  endIndent: 150,
                  color: Color(0xFFB0B0B0),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text.rich(
                    TextSpan(
                      text: "Apakah Anda yakin ",
                      style: TextStyle(
                        fontFamily: "SourceSans3",
                        color: Color(0xFF705D54),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: "merekrut ",
                          style: TextStyle(
                            fontFamily: "SourceSans3",
                            color: Color(0xFF705D54),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: "pelamar ini?",
                          style: TextStyle(
                            fontFamily: "SourceSans3",
                            color: Color(0xFF705D54),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/hermanwalton.png'),
                    ),
                    Positioned(
                      bottom: -3,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          width: 45,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Color(0xFFD7CCC8),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFF826754),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Color(0xFF826754),
                                size: 8,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "90%",
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF826754),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  "Herman Walton",
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF705D54),
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text.rich(
                    TextSpan(
                      text: "Merekrut pelamar ini akan ",
                      style: TextStyle(
                        fontFamily: "NunitoSans",
                        color: Color(0xFF3A2B24),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: "otomatis menolak 3 pelamar lainnya.",
                          style: TextStyle(
                            fontFamily: "NunitoSans",
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,

                          ),
                        ),

                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xFF826754),

                  ),
                  child: Row(
                    children: [

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _showFloatingAlert(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E9E5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Ya, rekrut",
                                  style: TextStyle(
                                    color: Color(0xFF826754),
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);

                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFFF1E9E5), width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(
                                  "Batal",
                                  style: TextStyle(
                                    color: Color(0xFFF1E9E5),
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showFloatingAlert(BuildContext context) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 6),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "Pelamar berhasil direkrut!",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // Hapus alert setelah 3 detik
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  void _apakahandayakinmenolakpelamarini(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(0),
            color: Color(0xFFF1E9E5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24),
                Divider(
                  thickness: 3,
                  indent: 150,
                  endIndent: 150,
                  color: Color(0xFFB0B0B0),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text.rich(
                    TextSpan(
                      text: "Apakah Anda yakin ",
                      style: TextStyle(
                        fontFamily: "SourceSans3",
                        color: Color(0xFF705D54),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: "menolak ",
                          style: TextStyle(
                            fontFamily: "SourceSans3",
                            color: Color(0xFF705D54),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: "pelamar ini?",
                          style: TextStyle(
                            fontFamily: "SourceSans3",
                            color: Color(0xFF705D54),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/hermanwalton.png'),
                    ),
                    Positioned(
                      bottom: -3,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          width: 45,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Color(0xFFD7CCC8),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xFF826754),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Color(0xFF826754),
                                size: 8,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "90%",
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF826754),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  "Herman Walton",
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF705D54),
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text.rich(
                    TextSpan(
                      text: "Kami yang akan memberitahu pelamar apabila lamarannya ditolak",
                      style: TextStyle(
                        fontFamily: "NunitoSans",
                        color: Color(0xFFA3948D),
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xFF826754),

                  ),
                  child: Row(
                    children: [

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFF1E9E5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Ya, tolak pelamar",
                                    style: TextStyle(
                                      color: Color(0xFF826754),
                                      fontFamily: "NunitoSans",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);

                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFFF1E9E5), width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(
                                  "Batal",
                                  style: TextStyle(
                                    color: Color(0xFFF1E9E5),
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _apaartiangkaini(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(0),
            color: Color(0xFFF1E9E5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24),
                Text(
                  "Apa arti angka ini?",
                  style: TextStyle(
                    fontFamily: 'SourceSans3',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF705D54),
                  ),
                ),
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/orangmenelepon.png'),
                    ),
                    Positioned(
                      bottom: -15,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFD7CCC8),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color(0xFF826754),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 6,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Color(0xFF826754),
                                size: 12,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "85%",
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF826754),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(26),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Color(0xFFA3948D), fontSize: 16, fontFamily: "NunitoSans", fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text:
                          'Persentase dengan simbol jari jempol adalah indikator ',
                        ),
                        TextSpan(
                          text: 'ScoutTrust',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                          ' yang menunjukkan:\n'
                              '• Pencapaian surveyor dalam menyelesaikan proyek terdahulu sebelum tenggat waktu\n'
                              '• Akumulasi penilaian klien sebelumnya\n'
                              '• Kecepatan merespons\n'
                              'Semakin tinggi persentase, semakin baik',
                        ),
                      ],
                    ),
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(


                  ),
                  child: Row(
                    children: [

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);

                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFF826754),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(
                                  "Mengerti",
                                  style: TextStyle(
                                    color: Color(0xFFF1E9E5),
                                    fontFamily: "NunitoSans",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}