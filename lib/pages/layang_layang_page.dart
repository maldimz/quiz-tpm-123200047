import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LayangLayangPage extends StatefulWidget {
  const LayangLayangPage({super.key});

  @override
  State<LayangLayangPage> createState() => _LayangLayangPageState();
}

class _LayangLayangPageState extends State<LayangLayangPage> {
  String _hasilLuas = "";
  String _hasilKeliling = "";

  TextEditingController diagonal1Controller = TextEditingController();
  TextEditingController diagonal2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hitung luas dan keliling layang-layang",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 40,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: diagonal1Controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan diagonal 1',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: diagonal2Controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan diagonal 2',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            var message = "";
            if (diagonal1Controller.text.isEmpty ||
                diagonal2Controller.text.isEmpty)
              message = "Masukkan nilai diagonal 1 dan diagonal 2";
            else if (double.parse(diagonal1Controller.text) <= 0 ||
                double.parse(diagonal2Controller.text) <= 0)
              message = "Masukkan nilai diagonal 1 dan diagonal 2 lebih dari 0";
            else
              message = "Berhasil";

            if (message != "Berhasil") {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
              return;
            }
            setState(() {
              double diagonal1 = double.parse(diagonal1Controller.text);
              double diagonal2 = double.parse(diagonal2Controller.text);

              double luas = diagonal1 * diagonal2 / 2;
              double keliling = 2 * (diagonal1 + diagonal2);

              _hasilLuas = luas.toString();
              _hasilKeliling = keliling.toString();
            });
          },
          child: Text("Hitung"),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          _hasilKeliling.isNotEmpty && _hasilLuas.isNotEmpty ? "Hasil" : "",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          _hasilLuas.isNotEmpty ? "Luas: $_hasilLuas" : "",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          _hasilKeliling.isNotEmpty ? "Keliling: $_hasilKeliling" : "",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
