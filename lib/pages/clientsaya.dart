import 'package:flutter/material.dart';
import 'clientprojects.dart';
import 'clientchat.dart';

class Clientsaya extends StatefulWidget {
  @override
  _ClientSayaPageState createState() => _ClientSayaPageState();
}

class _ClientSayaPageState extends State<Clientsaya> {
  String? _selectedJenisClient;
  int activeButton = -1; // Tombol default yang tidak aktif
  bool isOn = false;
  bool isOn2 = false;
  final TextEditingController _controller9 = TextEditingController();
  String? _selectedCompany;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFF1E9E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFF2EEE9),
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(27.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  //color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur jarak space-between
                    children: [
                      Container(
                        width: 50,
                        height: 50, // Tinggi container

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start, // Mengatur jarak space-between
                          children: [
                            Container(
                              width: 50, // Lebar kontainer kiri
                              height: 50, // Tinggi kontainer kiri
                              child: Image.asset(
                                'assets/images/surveyscoutlogo.png', // Gambar dari folder aset
                                fit: BoxFit.contain, // Agar gambar tidak terpotong
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/layananpelanggan.png'),
                            fit: BoxFit.cover,
                          ),
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

      body: Container(
        padding: const EdgeInsets.all(27),
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFF2EEE9), // Warna latar belakang
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Menyusun konten di kiri
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFFEDE7E2), // Warna kontainer utama
                ),
                width: double.infinity, // Lebar penuh
                padding: EdgeInsets.all(30), // Jarak antar kontainer utama

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spasi rata antar kontainer
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      width: double.infinity, // Lebar penuh
                      //color: Colors.red, // Warna kontainer pertama
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/ellipse2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      //color: Colors.green, // Warna kontainer kedua
                      child: const Center(
                        child: Text(
                          'Agus Ginting',
                          style: TextStyle(
                              color: Color(0xFF705D54),
                              fontFamily: "NunitoSans",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      child: Center(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            // Jika lebar kurang dari 600, ubah menjadi Column
                            bool isNarrow = constraints.maxWidth < 300;
                            return Flex(
                              direction: isNarrow ? Axis.vertical : Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Kontainer Kiri
                                Container(
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Gambar
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/ptwidyamandala.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      // Teks
                                      const Text(
                                        'PT Widya Mandala',
                                        style: TextStyle(
                                          color: Color(0xFF705D54),
                                          fontFamily: "NunitoSans",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Jarak antar kontainer (Horizontal atau Vertikal)
                                SizedBox(
                                  width: isNarrow ? 0 : 8, // Jarak horizontal
                                  height: isNarrow ? 8 : 0, // Jarak vertikal
                                ),
                                // Kontainer Kanan
                                Container(
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Gambar
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/images/surabaya.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      // Teks
                                      const Text(
                                        'Surabaya',
                                        style: TextStyle(
                                          color: Color(0xFF705D54),
                                          fontFamily: "NunitoSans",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => JenisPenggunaWidget(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color(0xFFA3948D),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Ubah Profil',
                            style: TextStyle(
                              color: Color(0xFFEDE7E2),
                              fontFamily: "NunitoSans",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                width: double.infinity, // Lebar penuh
                padding: EdgeInsets.all(8),
                //color: Colors.green,
                child: const Center(
                  child: Text(
                    'Keamanan',
                    style: TextStyle(
                        color: Color(0xFF705D54),
                        fontFamily: "SourceSans3",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFEDE7E2), // Warna kontainer utama
                ),
                padding: const EdgeInsets.all(8), // Padding utama kontainer
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antar elemen
                      children: [
                        // Kontainer Kiri
                        Row(
                          children: [
                            // Gambar di sebelah kiri
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/pinakses2.png'),
                                  fit: BoxFit.cover, // Menjaga proporsi gambar
                                ),
                              ),
                            ),
                            const SizedBox(width: 8), // Jarak antara gambar dan teks
                            // Teks di sebelah kanan
                            Container(
                              width: 100, // Atur lebar kontainer
                              child: const Text(
                                'Pin Akses',
                                style: TextStyle(
                                  color: Color(0xFF705D54),
                                  fontSize: 14,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Kontainer Tengah
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Terakhir diubah 1 Mei 2023',
                              style: TextStyle(
                                color: Color(0xFFA3948D),
                                fontFamily: "NunitoSans",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              // Memotong teks jika terlalu panjang
                            ),
                          ),
                        ),
                        // Kontainer Kanan
                        Container(
                          width: 15,
                          height: 15,
                          child: Image.asset(
                            'assets/images/panahkanan.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8), // Jarak antara Row dan Garis
                    // Garis bawah
                    Container(
                      width: double.infinity,
                      height: 1, // Tinggi garis
                      color: const Color(0xFFCAC4D0), // Warna garis
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antar elemen
                      children: [
                        // Kontainer Kiri
                        Row(
                          children: [
                            // Gambar di sebelah kiri
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/autentikasi.png'),
                                  fit: BoxFit.cover, // Menjaga proporsi gambar
                                ),
                              ),
                            ),
                            const SizedBox(width: 8), // Jarak antara gambar dan teks
                            // Teks di sebelah kanan
                            Container(
                              width: 100, // Atur lebar kontainer
                              child: const Text(
                                'Autentikasi',
                                style: TextStyle(
                                  color: Color(0xFF705D54),
                                  fontSize: 14,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Kontainer Tengah
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'OTP',
                              style: TextStyle(
                                color: Color(0xFFA3948D),
                                fontFamily: "NunitoSans",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),

                            ),
                          ),
                        ),
                        // Kontainer Kanan
                        Container(
                          width: 15,
                          height: 15,
                          child: Image.asset(
                            'assets/images/panahkanan.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 1, // Tinggi garis
                      color: const Color(0xFFCAC4D0), // Warna garis
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antar elemen
                      children: [
                        // Kontainer Kiri
                        Row(
                          children: [
                            // Gambar di sebelah kiri
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/perangkat.png'),
                                  fit: BoxFit.cover, // Menjaga proporsi gambar
                                ),
                              ),
                            ),
                            const SizedBox(width: 8), // Jarak antara gambar dan teks
                            // Teks di sebelah kanan
                            Container(
                              width: 100, // Atur lebar kontainer
                              child: const Text(
                                'Perangkat',
                                style: TextStyle(
                                  color: Color(0xFF705D54),
                                  fontSize: 14,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Kontainer Tengah
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Google Pixel 9XL +1 lainnya',
                              style: TextStyle(
                                color: Color(0xFFA3948D),
                                fontFamily: "NunitoSans",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              // Memotong teks jika terlalu panjang
                            ),
                          ),
                        ),
                        // Kontainer Kanan
                        Container(
                          width: 15,
                          height: 15,
                          child: Image.asset(
                            'assets/images/panahkanan.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Lebar penuh
                padding: EdgeInsets.all(8),
                //color: Colors.green,
                child: const Center(
                  child: Text(
                    'Pembayaran',
                    style: TextStyle(
                      color: Color(0xFF705D54),
                      fontFamily: "SourceSans3",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFEDE7E2), // Warna kontainer utama
                ),
                padding: const EdgeInsets.all(8), // Padding utama kontainer
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antar elemen
                      children: [
                        // Kontainer Kiri
                        Row(
                          children: [
                            // Gambar di sebelah kiri
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/rekening.png'),
                                  fit: BoxFit.cover, // Menjaga proporsi gambar
                                ),
                              ),
                            ),
                            const SizedBox(width: 8), // Jarak antara gambar dan teks
                            // Teks di sebelah kanan
                            Container(
                              width: 100, // Atur lebar kontainer
                              child: const Text(
                                'Rekening',
                                style: TextStyle(
                                  color: Color(0xFF705D54),
                                  fontSize: 14,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Kontainer Tengah
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'BCA | XXX130',
                              style: TextStyle(
                                color: Color(0xFFA3948D),
                                fontFamily: "NunitoSans",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              // Memotong teks jika terlalu panjang
                            ),
                          ),
                        ),
                        // Kontainer Kanan
                        Container(
                          width: 15,
                          height: 15,
                          child: Image.asset(
                            'assets/images/panahkanan.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8), // Jarak antara Row dan Garis
                    // Garis bawah
                    Container(
                      width: double.infinity,
                      height: 1, // Tinggi garis
                      color: const Color(0xFFCAC4D0), // Warna garis
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antar elemen
                      children: [
                        // Kontainer Kiri
                        Row(
                          children: [
                            // Gambar di sebelah kiri
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/riwayat.png'),
                                  fit: BoxFit.cover, // Menjaga proporsi gambar
                                ),
                              ),
                            ),
                            const SizedBox(width: 8), // Jarak antara gambar dan teks
                            // Teks di sebelah kanan
                            Container(
                              width: 100, // Atur lebar kontainer
                              child: const Text(
                                'Riwayat',
                                style: TextStyle(
                                  color: Color(0xFF705D54),
                                  fontSize: 14,
                                  fontFamily: "NunitoSans",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Kontainer Tengah
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Membayar Rp 500.000 23 Agustus 2024',
                              style: TextStyle(
                                color: Color(0xFFA3948D),
                                fontFamily: "NunitoSans",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),

                            ),
                          ),
                        ),
                        // Kontainer Kanan
                        Container(
                          width: 15,
                          height: 15,
                          child: Image.asset(
                            'assets/images/panahkanan.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Container(
                width: double.infinity, // Lebar penuh
                padding: EdgeInsets.all(8),
                //color: Colors.green,
                child: const Center(
                  child: Text(
                    'Notifikasi',
                    style: TextStyle(
                      color: Color(0xFF705D54),
                      fontFamily: "SourceSans3",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFEDE7E2), // Warna kontainer utama
                ),
                padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antar elemen
                      children: [
                        // Kontainer Kiri
                        Row(
                          children: [
                            // Gambar di sebelah kiri
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/informasiumum.png'),
                                  fit: BoxFit.cover, // Menjaga proporsi gambar
                                ),
                              ),
                            ),
                            const SizedBox(width: 8), // Jarak antara gambar dan teks
                            // Teks di sebelah kanan
                            Container(
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Atur jarak antara teks atas dan bawah
                                crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                                children: [
                                  Text(
                                    'Informasi umum, tips, dan pengenalan produk', // Teks atas
                                    style: TextStyle(
                                      color: Color(0xFF705D54),
                                      fontSize: 14,
                                      fontFamily: "NunitoSans",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    softWrap: true, // Aktifkan pembungkusan teks
                                    overflow: TextOverflow.visible, // Tampilkan teks penuh jika terlalu panjang
                                    maxLines: null, // Izinkan teks menggunakan baris sebanyak yang diperlukan
                                  ),


                                  Text(
                                    'Kiat menggunakan SurveyScout', // Teks bawah
                                    style: TextStyle(
                                      color: Color(0xFF705D54),
                                      fontSize: 14,
                                      fontFamily: "NunitoSans",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                        // Kontainer Tengah

                        // Kontainer Kanan
                        Container(
                          padding: EdgeInsets.all(8),
                          width: 40, // Ukuran tombol
                          height: 20,
                          child: Switch(
                            value: isOn2,
                            onChanged: (bool value) {
                              setState(() {
                                isOn2 = value; // Ubah status tombol
                              });
                            },
                            activeColor: Color(0xFF826754), // Warna tombol saat aktifColors.white,
                            inactiveThumbColor: Color(0xFFD7CCC8), // Warna tombol saat tidak aktif
                            inactiveTrackColor: Colors.white, // Warna track saat tidak aktifColor(0xFF826754),
                          ),
                        )

                      ],
                    ),
                    const SizedBox(height: 8), // Jarak antara Row dan Garis
                    // Garis bawah
                    Container(
                      width: double.infinity,
                      height: 1, // Tinggi garis
                      color: const Color(0xFFCAC4D0), // Warna garis
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antar elemen
                      children: [
                        // Kontainer Kiri
                        Row(
                          children: [
                            // Gambar di sebelah kiri
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/newsletter.png'),
                                  fit: BoxFit.cover, // Menjaga proporsi gambar
                                ),
                              ),
                            ),
                            const SizedBox(width: 8), // Jarak antara gambar dan teks
                            // Teks di sebelah kanan
                            Container(
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Atur jarak antara teks atas dan bawah
                                crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                                children: [
                                  Text(
                                    'Newsletter dan promosi', // Teks atas
                                    style: TextStyle(
                                      color: Color(0xFF705D54),
                                      fontSize: 14,
                                      fontFamily: "NunitoSans",
                                      fontWeight: FontWeight.w700,
                                    ),
                                    softWrap: true, // Aktifkan pembungkusan teks
                                    overflow: TextOverflow.visible, // Tampilkan teks penuh jika terlalu panjang
                                    maxLines: null, // Izinkan teks menggunakan baris sebanyak yang diperlukan
                                  ),

                                  Text(
                                    'Jadilah yang pertama mendapatkan penawaran terbaik', // Teks bawah
                                    style: TextStyle(
                                      color: Color(0xFF705D54),
                                      fontSize: 14,
                                      fontFamily: "NunitoSans",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                        // Kontainer Tengah

                        // Kontainer Kanan
                        Container(
                          padding: EdgeInsets.all(8),
                          width: 40, // Ukuran tombol
                          height: 20,
                          child: Switch(
                            value: isOn,
                            onChanged: (bool value) {
                              setState(() {
                                isOn = value; // Ubah status tombol
                              });
                            },
                            activeColor: Color(0xFF826754), // Warna tombol saat aktifColors.white,
                            inactiveThumbColor: Color(0xFFD7CCC8), // Warna tombol saat tidak aktif
                            inactiveTrackColor: Colors.white, // Warna track saat tidak aktifColor(0xFF826754),
                          ),
                        )

                      ],
                    ),

                  ],
                ),
              ),
              // Tambahkan lebih banyak kontainer jika diperlukan
            ],
          ),
        ),
      ),




      bottomNavigationBar:
      Container(
        color: Color(0xffD7CCC8), // Footer berwarna #D7CCC8
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8), // Padding horizontal dan vertikal
        child: GestureDetector(
          onTap: () {
            // Navigasi atau aksi untuk footer
            print("Footer link clicked!");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antar container dibuat maksimal
            children: [
              GestureDetector(
                onTap: () {
                  // Navigasi ke halaman baru
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()), // Ganti dengan nama halaman Anda
                  );
                },
                child: Container(
                  width: 80,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Pusatkan isi secara vertikal
                    children: [
                      Image.asset(
                        'assets/images/proyek2.png', // Path ke gambar
                        width: 24, // Lebar gambar
                        height: 24, // Tinggi gambar
                        fit: BoxFit.contain, // Menyesuaikan ukuran gambar
                      ),
                      SizedBox(height: 4), // Memberikan jarak antara gambar dan teks
                      Text(
                        'Proyek',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NunitoSans',
                          color: Color(0xFFB8ADA5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              GestureDetector(
                onTap: () {
                  // Navigasi ke halaman baru
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Clientchat()), // Ganti dengan nama halaman Anda
                  );
                },
                child: Container(
                  width: 80,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Pusatkan isi secara vertikal
                    children: [
                      Image.asset(
                        'assets/images/chat3.png', // Path ke gambar
                        width: 24, // Lebar gambar
                        height: 24, // Tinggi gambar
                        fit: BoxFit.contain, // Menyesuaikan ukuran gambar
                      ),
                      SizedBox(height: 4), // Memberikan jarak antara gambar dan teks
                      Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NunitoSans',
                          color: Color(0xFFB8ADA5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                },
                child: Container(
                  width: 80,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Pusatkan isi secara vertikal
                    children: [
                      Image.asset(
                        'assets/images/saya2.png', // Path ke gambar
                        width: 24, // Lebar gambar
                        height: 24, // Tinggi gambar
                        fit: BoxFit.contain, // Menyesuaikan ukuran gambar
                      ),
                      SizedBox(height: 4), // Memberikan jarak antara gambar dan teks
                      Text(
                        'Saya',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'NunitoSans',
                          color: Color(0xFF705D54),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String hint, List<String> options, {required String selectedValue, required ValueChanged<String?> onChanged, bool isWide = false}) {
    return Container(
      width: isWide ? 300 : 200, // Conditional width based on isWide parameter
      height: 40, // Set the total height of the dropdown to 40
      child: DropdownButtonFormField<String>(
        isDense: true, // Make the dropdown more compact
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0), // Padding to control internal spacing
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners
            borderSide: BorderSide(
              color: Color(0xFF705D54), // Default border color
              width: 1, // Border width
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color(0xFF705D54), // Warna border saat fokus
              width: 2.0, // Lebar border saat fokus
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color(0xFF705D54), // Warna border saat tidak fokus
              width: 1.0, // Lebar border saat tidak fokus
            ),
          ),
        ),
        hint: Text(
          hint,
          style: TextStyle(
            fontFamily: 'NunitoSans',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 21.82 / 16, // line-height calculated as ratio of font-size
            decoration: TextDecoration.none, // No underline decoration
            color: Color(0xFF705D54), // Text color
          ),
        ),
        value: selectedValue, // Set the current selected value
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(
              option,
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 21.82 / 16,
                decoration: TextDecoration.none,
                color: Color(0xFF705D54), // Text color
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged, // Set the onChanged callback
        icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF705D54)), // Icon color
      ),
    );
  }

  Widget _buildIconBox() {
    return GestureDetector(

      child: Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // Rounded corners
          border: Border.all(
            color: Color(0xFF705D54), // Border color
            width: 1, // Border width of 1px
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center align vertically
          crossAxisAlignment: CrossAxisAlignment.start, // Center align horizontally
          children: [
            // Top line (full width)
            Container(
              width: double.infinity, // Max width
              height: 2,
              color: Color(0xFF705D54),
            ),
            SizedBox(height: 4), // Add spacing between lines
            // Middle line (2/3 of the box width)
            Container(
              width: 2 / 3 * 20, // 2/3 width of the box
              height: 2,
              color: Color(0xFF705D54),
            ),
            SizedBox(height: 4), // Add spacing between lines
            // Bottom line (half the width of the box)
            Container(
              width: 1 / 2 * 20, // 1/2 width of the box
              height: 2,
              color: Color(0xFF705D54),
            ),
          ],
        ),
      ),
    );
  }



}

class JenisPenggunaWidget extends StatefulWidget {
  @override
  HalamanBaru createState() => HalamanBaru();
}

class HalamanBaru extends State<JenisPenggunaWidget> {
  String _jenisPengguna = 'Perusahaan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          padding: EdgeInsets.only(top: 20),
          color: Color(0xFFD7CCC8),
          child: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 50,
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFF705D54)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Ubah Profil',
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
      body: Container(
        padding: const EdgeInsets.all(27),
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFF1E9E5), // Warna latar belakang
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Menyusun konten di kiri
            children: [
              Container(
                padding: EdgeInsets.all(20),
                color: Color(0xFFEDE7E2),
                child: Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage('assets/images/ellipse2.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFF826754),
                              child: Icon(Icons.edit, color: Color(0xFFffffff), size: 10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Agus Ginting',
                        style: TextStyle(
                          fontFamily: 'NutinoSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xFF705D54),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),

              //jenis kelamin ---------------------------------------------------------------------
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.wc, color: Color(0xFFC4B8B1), size: 25),
                      ),
                    ),
                    SizedBox(width: 8),

                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jenis Kelamin',
                            style: TextStyle(
                              color: Color(0xFFC4B8B1),
                              fontSize: 12,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Pria',
                            style: TextStyle(
                              color: Color(0xFFC4B8B1),
                              fontSize: 16,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFC4B8B1),
              ),

              //tanggal lahir ---------------------------------------------------------------------
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.date_range, color: Color(0xFFC4B8B1), size: 25),
                      ),
                    ),
                    SizedBox(width: 8),

                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tanggal Lahir',
                            style: TextStyle(
                              color: Color(0xFFC4B8B1),
                              fontSize: 12,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '1 Januari 2000',
                            style: TextStyle(
                              color: Color(0xFFC4B8B1),
                              fontSize: 16,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFC4B8B1),
              ),

              //nomor telepon ---------------------------------------------------------------------
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.phone, color: Color(0xFF826754), size: 25),
                      ),
                    ),
                    SizedBox(width: 8),

                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nomor Telepon',
                            style: TextStyle(
                              color: Color(0xFF705D54),
                              fontSize: 12,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 4),
                          TextField(
                            decoration: InputDecoration(
                              hintText: '081 123 456 789',
                              hintStyle: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 16,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 16,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFC4B8B1),
              ),

              //nik ------------------------------------------------------------------------
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.credit_card, color: Color(0xFFC4B8B1), size: 25),
                      ),
                    ),
                    SizedBox(width: 8),

                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NIK',
                            style: TextStyle(
                              color: Color(0xFFC4B8B1),
                              fontSize: 12,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '3203 0101 0100 0001',
                            style: TextStyle(
                              color: Color(0xFFC4B8B1),
                              fontSize: 16,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFC4B8B1),
              ),

              //nama perusahaan ------------------------------------------------------------------------
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.business, color: Color(0xFF826754), size: 25),
                      ),
                    ),
                    SizedBox(width: 8),

                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Perusahaan',
                            style: TextStyle(
                              color: Color(0xFF705D54),
                              fontSize: 12,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 4),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'PT Widya Mandala',
                              hintStyle: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 16,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 16,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFC4B8B1),
              ),

              //jenis perusahaan ------------------------------------------------------------------------
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.star, color: Color(0xFF826754), size: 25),
                      ),
                    ),
                    SizedBox(width: 8),

                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jenis Perusahaan',
                            style: TextStyle(
                              color: Color(0xFF705D54),
                              fontSize: 12,
                              fontFamily: 'NunitoSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio<String>(
                                    value: 'Perusahaan',
                                    groupValue: _jenisPengguna,
                                    activeColor: Color(0xFF705D54),
                                    onChanged: (value) {
                                      setState(() {
                                        _jenisPengguna = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Perusahaan',
                                    style: TextStyle(
                                      color: Color(0xFF705D54),
                                      fontSize: 16,
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio<String>(
                                    value: 'Perorangan',
                                    groupValue: _jenisPengguna,
                                    activeColor: Color(0xFF705D54),
                                    onChanged: (value) {
                                      setState(() {
                                        _jenisPengguna = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Perorangan',
                                    style: TextStyle(
                                      color: Color(0xFF705D54),
                                      fontSize: 16,
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFC4B8B1),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 27),
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xFFF1E9E5),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Perubahan berhasil disimpan"),
                      backgroundColor: Color(0xFF3A2B24),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF705D54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Simpan Perubahan',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
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
