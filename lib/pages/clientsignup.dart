import 'package:flutter/material.dart';
import 'clientprojects.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class ClientSignUp extends StatefulWidget {
  const ClientSignUp({Key? key}) : super(key: key);

  @override
  State<ClientSignUp> createState() => _ClientSignUpState();
}

class NIKInputField extends StatefulWidget {
  @override
  State<ClientSignUp> createState() => _ClientSignUpState();
}


class _ClientSignUpState extends State<ClientSignUp> {
  final TextEditingController _controllernik = TextEditingController();
  String? errorMessage;
  String? _pinError;

  @override
  void dispose() {
    _controllernik.dispose();
    super.dispose();
  }

  void _validatePins() {
    setState(() {
      if (_controller10.text.isNotEmpty && _controller11.text.isNotEmpty) {
        if (_controller10.text != _controller11.text) {
          _pinError = "PIN tidak cocok!";
        } else {
          _pinError = null;
        }
      }
    });
  }


  void _validateFieldsnik(String value) {
    String? newError;
    if (value.length != 16 || !RegExp(r'^\d{16}$').hasMatch(value)) {
      newError = "NIK wajib sebanyak 16 digit dan berupa angka";
    }

    if (newError != errorMessage) {
      setState(() {
        errorMessage = newError;
      });
    }
  }

  Future<DateTime?> selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF826754),
              onPrimary: Color(0xFFF1E9E5),
              surface: Color(0xFFD7CCC8),
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Color(0xFFD7CCC8),
          ),
          child: child!,
        );
      },
    );

    return _picked;
  }


  TextEditingController _dateController = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
  final TextEditingController _controller10 = TextEditingController();
  final TextEditingController _controller11 = TextEditingController();
  String? _selectedGender;
  String? _selectedCompany;
  int nomortext = 0;

  void _validateFields() {
    setState(() {
      // Periksa apakah semua TextField sudah terisi
      bool allFilled = _controller1.text.isNotEmpty && //nama lengkap
          _controller2.text.isNotEmpty && //jenis kelamin
          _controller3.text.isNotEmpty && //tanggal lahir
          _controller4.text.isNotEmpty && //nomor telepon
          _controller5.text.isNotEmpty && //nik
          _controller6.text.isNotEmpty && //nama bank
          _controller7.text.isNotEmpty && //nomor rekening
          _controller8.text.isNotEmpty && //nama perusahaan
          _controller9.text.isNotEmpty && //jenis perusahaan
          _controller10.text.isNotEmpty && //pin akses 1
          _controller11.text.isNotEmpty && (_controller10.text == _controller11.text); //pin akses 2

      nomortext = allFilled ? 1 : 0;
    });
  }

  bool _isObscured = true;

  final int nomorselesai = 12;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF1E9E5),
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    Container(
                      width: double.infinity,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Selangkah Lagi!',
                          style: TextStyle(
                            color: Color(0xFF705D54),
                            fontSize: 32,
                            fontFamily: 'SourceSans3',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mohon isi data diri berikut',
                          style: TextStyle(
                            color: Color(0xFFA3948D),
                            fontSize: 16,
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              //NAMA LENGKAP############################################################################
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center, // Posisi gambar di tengah
                        child: Image(
                          image: AssetImage('assets/images/namalengkap.png'),
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover, // Gambar menyesuaikan dengan ukuran yang ditentukan
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 250, // Tentukan lebar maksimum untuk kolom teks
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                          children: [
                            Text(
                              'Nama Lengkap',
                              style: TextStyle(
                                color: Color(0xFF705D54),
                                fontSize: 16,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 2),
                            Container(
                              width: (MediaQuery.of(context).size.width) * 9 / 10, // Lebar sesuai dengan yang diinginkan
                              child: TextField(
                                controller: _controller1,
                                onChanged: (value) => _validateFields(),
                                decoration: InputDecoration(
                                  hintText: 'John Doe',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 16,
                                    fontFamily: 'NunitoSans', // Pastikan font sudah ditambahkan
                                    fontStyle: FontStyle.italic, // Gaya italic
                                    fontWeight: FontWeight.w400, // Bobot reguler
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10), // Sesuaikan padding
                                  isDense: true, // Mengurangi padding vertikal
                                  border: InputBorder.none, // Menghilangkan garis bawah
                                ),
                                // Pastikan TextField mengisi lebar Container
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Lebar mengikuti lebar layar
                height: 1, // Tinggi garis (dapat disesuaikan sesuai kebutuhan)
                color: Color(0xFF705D54), // Warna garis sesuai dengan yang diinginkan
              ),
              SizedBox(height: 15),

              //JENIS KELAMIN########################################################################
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage('assets/images/jeniskelamin.png'),
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jenis Kelamin',
                            style: TextStyle(
                              color: Color(0xFF705D54),
                              fontSize: 16,
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
                                    value: 'Pria',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                        _controller2.text = value; // Simpan ke controller
                                      });
                                    },
                                    fillColor: MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.selected)) {
                                          return Color(0xFF705D54);
                                        }
                                        return Color(0xFF705D54);
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Pria',
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
                                    value: 'Wanita',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value!;
                                        _controller2.text = value; // Simpan ke controller
                                      });
                                    },
                                    fillColor: MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.selected)) {
                                          return Color(0xFF705D54);
                                        }
                                        return Color(0xFF705D54);
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Wanita',
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

              SizedBox(height: 15),

              //TANGGAL LAHIR########################################################################
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center, // Posisi gambar di tengah
                        child: Image(
                          image: AssetImage('assets/images/tanggallahir.png'),
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover, // Gambar menyesuaikan dengan ukuran yang ditentukan
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 250, // Tentukan lebar maksimum untuk kolom teks
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                          children: [
                            Text(
                              'Tanggal Lahir',
                              style: TextStyle(
                                color: Color(0xFF705D54),
                                fontSize: 16,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 15),
                            TextField(

                              controller: _controller3,
                              decoration: InputDecoration(
                                labelText: 'DD-MM-YYYY',
                                labelStyle: TextStyle(color: Color(0xFF826754)),
                                filled: true,
                                fillColor: Color(0xFFF1E9E5),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF826754)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFD7CCC8)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await selectDate();
                                if (pickedDate != null) {
                                  setState(() {
                                    _controller3.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                                  });
                                }
                              },

                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              //NOMOR TELEPON########################################################################
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center, // Posisi gambar di tengah
                        child: Image(
                          image: AssetImage('assets/images/nomortelepon.png'),
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover, // Gambar menyesuaikan dengan ukuran yang ditentukan
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 250, // Tentukan lebar maksimum untuk kolom teks
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                          children: [
                            Text(
                              'Nomor Telepon',
                              style: TextStyle(
                                color: Color(0xFF705D54),
                                fontSize: 16,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 2),
                            Container(
                              width: (MediaQuery.of(context).size.width) * 9 / 10, // Lebar sesuai dengan yang diinginkan
                              child: TextField(
                                controller: _controller4,
                                onChanged: (value) => _validateFields(),
                                decoration: InputDecoration(
                                  hintText: '081 234 567 890',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 16,
                                    fontFamily: 'NunitoSans', // Pastikan font sudah ditambahkan
                                    fontStyle: FontStyle.italic, // Gaya italic
                                    fontWeight: FontWeight.w400, // Bobot reguler
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10), // Sesuaikan padding
                                  isDense: true, // Mengurangi padding vertikal
                                  border: InputBorder.none, // Menghilangkan garis bawah
                                ),
                                // Pastikan TextField mengisi lebar Container
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Lebar mengikuti lebar layar
                height: 1, // Tinggi garis (dapat disesuaikan sesuai kebutuhan)
                color: Color(0xFF705D54), // Warna garis sesuai dengan yang diinginkan
              ),
              SizedBox(height: 15),

              //NIK########################################################################
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/nik.png',
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 250,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NIK',
                                  style: TextStyle(
                                    color: Color(0xFF705D54),
                                    fontSize: 16,
                                    fontFamily: 'NunitoSans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  child: TextField(
                                    controller: _controller5,
                                    onChanged: _validateFieldsnik,
                                    keyboardType: TextInputType.number,
                                    maxLength: 16,
                                    decoration: InputDecoration(
                                      hintText: '3403130101901001',
                                      hintStyle: TextStyle(
                                        color: Color(0xFFB0B0B0),
                                        fontSize: 16,
                                        fontFamily: 'NunitoSans',
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                                      isDense: true,
                                      border: InputBorder.none,
                                      counterText: "",
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                if (errorMessage != null)
                                  Column(
                                    children: [
                                      SizedBox(width: 40),
                                      Wrap(
                                        children: [
                                          Text(
                                            errorMessage!,
                                            softWrap: true,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                              fontFamily: 'NunitoSans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
              Container(
                width: double.infinity, // Lebar mengikuti lebar layar
                height: 1, // Tinggi garis (dapat disesuaikan sesuai kebutuhan)
                color: Color(0xFF705D54), // Warna garis sesuai dengan yang diinginkan
              ),
              SizedBox(height: 15),

              //BANK########################################################################
              Container(
                width: double.infinity, // Lebar penuh untuk kontainer besar


                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Rata atas kedua kontainer
                  children: [
                    // Kontainer kiri (kontainer lama)
                    Expanded(
                      flex: 3, // Fleksibilitas untuk menyesuaikan lebar relatif
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 54 - 50) / 2,


                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri untuk isi kolom
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Align(
                                    alignment: Alignment.center, // Posisi gambar di tengah
                                    child: Image(
                                      image: AssetImage('assets/images/namabank.png'),
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover, // Gambar menyesuaikan dengan ukuran yang ditentukan
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  width: (MediaQuery.of(context).size.width - 54 - 100) / 2,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                                      children: [
                                        Text(
                                          'Nama Bank',
                                          style: TextStyle(
                                            color: Color(0xFF705D54),
                                            fontSize: 16,
                                            fontFamily: 'NunitoSans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Container(
                                          width: (MediaQuery.of(context).size.width) * 9 / 10, // Lebar sesuai dengan yang diinginkan
                                          child: TextField(
                                            controller: _controller6,
                                            onChanged: (value) => _validateFields(),
                                            decoration: InputDecoration(
                                              hintText: 'Bank Saya',
                                              hintStyle: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 16,
                                                fontFamily: 'NunitoSans', // Pastikan font sudah ditambahkan
                                                fontStyle: FontStyle.italic, // Gaya italic
                                                fontWeight: FontWeight.w400, // Bobot reguler
                                              ),
                                              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10), // Sesuaikan padding
                                              isDense: true, // Mengurangi padding vertikal
                                              border: InputBorder.none, // Menghilangkan garis bawah
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity, // Lebar mengikuti lebar layar
                              height: 1, // Tinggi garis (dapat disesuaikan sesuai kebutuhan)
                              color: Color(0xFF705D54), // Warna garis sesuai dengan yang diinginkan
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16), // Jarak antara kontainer kiri dan kanan
                    // Kontainer kanan
                    Expanded(
                      flex: 3, // Fleksibilitas untuk menyesuaikan lebar relatif
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 54 - 50) / 2,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri untuk isi kolom
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: (MediaQuery.of(context).size.width - 54 - 50) / 2,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                                      children: [
                                        Text(
                                          'Nomor Rekening',
                                          style: TextStyle(
                                            color: Color(0xFF705D54),
                                            fontSize: 16,
                                            fontFamily: 'NunitoSans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Container(
                                          width: (MediaQuery.of(context).size.width) * 9 / 10, // Lebar sesuai dengan yang diinginkan
                                          child: TextField(
                                            controller: _controller7,
                                            onChanged: (value) => _validateFields(),
                                            decoration: InputDecoration(
                                              hintText: '1234567890',
                                              hintStyle: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 16,
                                                fontFamily: 'NunitoSans', // Pastikan font sudah ditambahkan
                                                fontStyle: FontStyle.italic, // Gaya italic
                                                fontWeight: FontWeight.w400, // Bobot reguler
                                              ),
                                              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10), // Sesuaikan padding
                                              isDense: true, // Mengurangi padding vertikal
                                              border: InputBorder.none, // Menghilangkan garis bawah
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity, // Lebar mengikuti lebar layar
                              height: 1, // Tinggi garis (dapat disesuaikan sesuai kebutuhan)
                              color: Color(0xFF705D54), // Warna garis sesuai dengan yang diinginkan
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              //Nama Perusahaan########################################################################
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center, // Posisi gambar di tengah
                        child: Image(
                          image: AssetImage('assets/images/namaperusahaan.png'),
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover, // Gambar menyesuaikan dengan ukuran yang ditentukan
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 250, // Tentukan lebar maksimum untuk kolom teks
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                          children: [
                            Text(
                              'Nama Perusahaan',
                              style: TextStyle(
                                color: Color(0xFF705D54),
                                fontSize: 16,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 2),
                            Container(
                              width: (MediaQuery.of(context).size.width) * 9 / 10, // Lebar sesuai dengan yang diinginkan
                              child: TextField(
                                controller: _controller8,
                                onChanged: (value) => _validateFields(),
                                decoration: InputDecoration(
                                  hintText: 'PT Maju Mapan',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 16,
                                    fontFamily: 'NunitoSans', // Pastikan font sudah ditambahkan
                                    fontStyle: FontStyle.italic, // Gaya italic
                                    fontWeight: FontWeight.w400, // Bobot reguler
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10), // Sesuaikan padding
                                  isDense: true, // Mengurangi padding vertikal
                                  border: InputBorder.none, // Menghilangkan garis bawah
                                ),
                                // Pastikan TextField mengisi lebar Container
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Lebar mengikuti lebar layar
                height: 1, // Tinggi garis (dapat disesuaikan sesuai kebutuhan)
                color: Color(0xFF705D54), // Warna garis sesuai dengan yang diinginkan
              ),
              SizedBox(height: 15),

              //Jenis Perusahaan########################################################################
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center, // Posisi gambar di tengah
                        child: Image(
                          image: AssetImage('assets/images/jenisperusahaan.png'),
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover, // Gambar menyesuaikan dengan ukuran yang ditentukan
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 250, // Tentukan lebar maksimum untuk kolom teks
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                          children: [
                            Text(
                              'Jenis Perusahaan',
                              style: TextStyle(
                                color: Color(0xFF705D54),
                                fontSize: 16,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio<String>(
                                      value: 'Perusahaan',
                                      groupValue: _selectedCompany,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedCompany = value!;
                                          _controller9.text = value; // Simpan ke controller
                                        });
                                      },
                                      fillColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (states.contains(MaterialState.selected)) {
                                            return Color(0xFF705D54);
                                          }
                                          return Color(0xFF705D54);
                                        },
                                      ),

                                    ),
                                    Text('Perusahaan',
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
                                      groupValue: _selectedCompany,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedCompany = value!;
                                          _controller9.text = value; // Simpan ke controller
                                        });
                                      },
                                      fillColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (states.contains(MaterialState.selected)) {
                                            return Color(0xFF705D54);
                                          }
                                          return Color(0xFF705D54);
                                        },
                                      ),

                                    ),
                                    Text('Perorangan',
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
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              //Pin Akses1########################################################################
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center, // Posisi gambar di tengah
                        child: Image(
                          image: AssetImage('assets/images/pinakses.png'),
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover, // Gambar menyesuaikan dengan ukuran yang ditentukan
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                          children: [
                            Text(
                              'PIN Akses',
                              style: TextStyle(
                                color: Color(0xFF705D54),
                                fontSize: 16,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 2),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7, // Batasi lebar Row
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 9, // Memberikan lebih banyak ruang pada TextField
                                    child: TextField(
                                      controller: _controller10,

                                      onChanged: (value) {
                                        _validatePins();
                                        _validateFields();
                                      },
                                      obscureText: _isObscured, // Kontrol apakah teks disembunyikan
                                      decoration: InputDecoration(
                                        hintText: '6 digit, hanya angka',

                                        hintStyle: TextStyle(
                                          color: Color(0xFFB0B0B0),
                                          fontSize: 16,
                                          fontFamily: 'NunitoSans',
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                                        isDense: true,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      _isObscured ? Icons.visibility_off : Icons.visibility,
                                      color: Color(0xFF705D54),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscured = !_isObscured; // Ubah status visibilitas teks
                                      });
                                    },
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                  ),
                                ],
                              ),
                            ),
                            if (_pinError != null)
                              Column(
                                children: [
                                  SizedBox(width: 40),
                                  Wrap(
                                    children: [
                                      Text(
                                        _pinError!,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontFamily: 'NunitoSans',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Lebar mengikuti lebar layar
                height: 1, // Tinggi garis (dapat disesuaikan sesuai kebutuhan)
                color: Color(0xFF705D54), // Warna garis sesuai dengan yang diinginkan
              ),
              SizedBox(height: 15),

              //Pin Akses2########################################################################
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center, // Posisi gambar di tengah
                        child: Image(
                          image: AssetImage('assets/images/pinakses.png'),
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover, // Gambar menyesuaikan dengan ukuran yang ditentukan
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                          children: [
                            Text(
                              'Konfirmasi Pin Akses',
                              style: TextStyle(
                                color: Color(0xFF705D54),
                                fontSize: 16,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 2),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7, // Batasi lebar Row
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 9, // Memberikan lebih banyak ruang pada TextField
                                    child: TextField(
                                      controller: _controller11,
                                      onChanged: (value) {
                                        _validatePins();
                                        _validateFields();
                                      },
                                      obscureText: _isObscured, // Kontrol apakah teks disembunyikan
                                      decoration: InputDecoration(
                                        hintText: 'Masukkan kembali PIN Akses',

                                        hintStyle: TextStyle(
                                          color: Color(0xFFB0B0B0),
                                          fontSize: 16,
                                          fontFamily: 'NunitoSans',
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                                        isDense: true,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      _isObscured ? Icons.visibility_off : Icons.visibility,
                                      color: Color(0xFF705D54),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscured = !_isObscured; // Ubah status visibilitas teks
                                      });
                                    },
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                  ),
                                ],
                              ),
                            ),
                            if (_pinError != null)
                              Column(
                                children: [
                                  SizedBox(width: 40),
                                  Wrap(
                                    children: [
                                      Text(
                                        _pinError!,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontFamily: 'NunitoSans',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity, // Lebar mengikuti lebar layar
                height: 1, // Tinggi garis (dapat disesuaikan sesuai kebutuhan)
                color: Color(0xFF705D54), // Warna garis sesuai dengan yang diinginkan
              ),
              SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFD7CCC8),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all( // Menambahkan border
                    color: Color(0xFF826754), // Warna border
                    width: 1.5, // Ketebalan border
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon di kiri
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(
                        'assets/images/hurufi.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    // Teks di kanan
                    Expanded(
                      child: Text(
                        "PIN Akses digunakan untuk memverifikasi bahwa memang Anda yang akan mengubah informasi penting seperti rekening atau mengakses data rahasia.",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF705D54),
                          fontFamily: "NunitoSans",
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Text(
              //   'Nomortext: $nomortext',
              //   style: TextStyle(fontSize: 20),
              // ),

              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: nomortext != 1 ? Color(0xFFC4B8B1) : Color(0xFF826754),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Border radius 8
                  ),
                ),
                onPressed: nomortext == 1
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                }
                    : null, // Tombol dinonaktifkan jika `nomortext` bukan 1
                child: Container(
                  width: double.infinity, // Lebar tombol penuh
                  alignment: Alignment.center, // Tulisan di tengah
                  child: Text(
                    "Lanjut",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'NunitoSans',
                      color: nomortext != 1 ? Color(0xFFD7CCC8) : Color(0xFFF1E9E5),
                    ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
