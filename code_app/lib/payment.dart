import 'package:flutter/material.dart';
import 'promopage.dart';
import 'paymentmethod.dart';
import 'paymentconfirm.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _namaPenyewaController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();
  int _jumlahJam = 1;
  int _jumlahLapangan = 1;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text = picked.toString(); // Ubah sesuai format yang Anda inginkan
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _jamController.text = picked.format(context); // Ubah sesuai format yang Anda inginkan
      });
    }
  }

  void _incrementJumlahJam() {
    setState(() {
      if (_jumlahJam < 5) {
        _jumlahJam++;
      }
    });
  }

  void _decrementJumlahJam() {
    setState(() {
      if (_jumlahJam > 1) {
        _jumlahJam--;
      }
    });
  }

  void _incrementJumlahLapangan() {
    setState(() {
      if (_jumlahLapangan < 2) {
        _jumlahLapangan++;
      }
    });
  }

  void _decrementJumlahLapangan() {
    setState(() {
      if (_jumlahLapangan > 1) {
        _jumlahLapangan--;
      }
    });
  }

  void _confirmOrder() {
    String namaPenyewa = _namaPenyewaController.text.trim();
    String nomorTelepon = _nomorTeleponController.text.trim();
    String tanggal = _tanggalController.text.trim();
    String jam = _jamController.text.trim();

    if (namaPenyewa.isEmpty || nomorTelepon.isEmpty || tanggal.isEmpty || jam.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ALERT!!!'),
            content: Text('Tenant Name, Telephone Number, Date, and Time must be filled in.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Lanjutkan dengan logika untuk konfirmasi pesanan
      // ...
      // Navigasi ke halaman konfirmasi pembayaran setelah konfirmasi
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentConfirmPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Payment',
          style: TextStyle(color: Color(0xFF5541D4)), // Warna teks "Payment"
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black, // Warna tombol back
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/img29.jpg',
                  width: 500,
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'CKM SPORTS CENTER', // Nama Lapangan
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _namaPenyewaController,
                decoration: InputDecoration(
                  labelText: 'Tenant Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _nomorTeleponController,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _tanggalController,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => _selectTime(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _jamController,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      suffixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Play For (hours)            :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: _decrementJumlahJam,
                      ),
                      Text(
                        _jumlahJam.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _incrementJumlahJam,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Fields                    : ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: _decrementJumlahLapangan,
                      ),
                      Text(
                        _jumlahLapangan.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _incrementJumlahLapangan,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PromoPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/img50.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Promo',
                          style: TextStyle(
                            color: Colors.black, // Warna teks tombol
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/img52.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 205, 205, 205), // Warna tombol
                  fixedSize: Size(300, 48),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentMethodPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/img51.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Payment Method',
                          style: TextStyle(
                            color: Colors.black, // Warna teks tombol
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/img52.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 205, 205, 205), // Warna tombol
                  fixedSize: Size(300, 48), // Ukuran tetap tombol
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Total Price (services cost 3000 IDR):',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '${(_jumlahJam * _jumlahLapangan * 50000 + 3000).toDouble().toStringAsFixed(0)} IDR',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5541D4), // Warna teks total harga
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _confirmOrder,
                child: Text(
                  'Confirm Your Order',
                  style: TextStyle(
                    color: Colors.white, // Warna teks tombol
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5541D4), // Warna tombol
                  fixedSize: Size(400, 60), // Ukuran tetap tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}