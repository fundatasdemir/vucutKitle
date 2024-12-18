import 'package:flutter/material.dart';
import 'hesaplaSayfasi.dart';

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  double sonuc = 0;

  TextEditingController boyController = TextEditingController();

  TextEditingController kiloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Vücüt Kitle İndeksi Hesaplama Programı",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildText(),
          _buildTextFieldBoy(),
          SizedBox(height: 12),
          _buildTextFieldKilo(),
          SizedBox(height: 25),
          _buildElavetButton()
        ],
      ),
    );
  }

  Widget _buildText() {
    return Text(
      sonuc.toStringAsFixed(2),
      style: TextStyle(
        fontSize: 48,
      ),
    );
  }

  Widget _buildTextFieldBoy() {
    return TextField(
      controller: boyController,
      decoration: InputDecoration(
          label: Text("Boyunuz:"),
          suffixText: "m",
          hintText: "Örneğin: 1.75",
          counterText: "Noktayı unutmayınız!",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }

  Widget _buildTextFieldKilo() {
    return TextField(
      controller: kiloController,
      decoration: InputDecoration(
          label: Text("Kilonuz:"),
          suffixText: "kg",
          hintText: "Örneğin: 52",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildElavetButton() {
    return ElevatedButton(
      onPressed: () => hesaplaSayfasiniAc(context),
      child: Text(
        "Hesapla",
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
    );
  }

  void hesaplaSayfasiniAc(BuildContext context) {
    String boyText = boyController.text.trim();
    String kiloText = kiloController.text.trim();

    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (context) {
        return Hesaplasayfasi(
          boy: boyText,
          kilo: kiloText,
        );
      },
    );
    Navigator.push(context, sayfaYolu);
  }
}
