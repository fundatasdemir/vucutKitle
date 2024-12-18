import 'package:flutter/material.dart';
import 'anaSayfa.dart';

class Hesaplasayfasi extends StatefulWidget {
  final String boy;
  final String kilo;

  Hesaplasayfasi({required this.boy, required this.kilo});

  @override
  State<Hesaplasayfasi> createState() => _HesaplasayfasiState();
}

class _HesaplasayfasiState extends State<Hesaplasayfasi> {
  double sonuc = 0;
  @override
  void initState() {
    super.initState();
    hesaplaIslemi();
  }

  void hesaplaIslemi() {
    try {
      double boy = double.parse(widget.boy);
      double kilo = double.parse(widget.kilo);
      setState(() {
        sonuc = kilo / (boy * boy);
      });
    } catch (e) {
      setState(() {
        sonuc = 0;
      });
      print("Bir Hata Oluştu: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sonuç Sayfası"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vücut Kitle İndeksinz:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                sonuc.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Geri Dön"),
              ),
            ],
          ),
        ));
  }
}
