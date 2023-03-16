import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SegitigaPage extends StatefulWidget {
  const SegitigaPage({super.key});

  @override
  State<SegitigaPage> createState() => _SegitigaPageState();
}

class _SegitigaPageState extends State<SegitigaPage> {
  String _hasilLuas = "";
  String _hasilKeliling = "";

  TextEditingController alasController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  TextEditingController sisi1Controller = TextEditingController();
  TextEditingController sisi2Controller = TextEditingController();
  TextEditingController sisi3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hitung luas dan keliling segitiga",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 40,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: alasController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan alas',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: tinggiController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan tinggi',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: sisi1Controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan sisi 1',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: sisi2Controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan sisi 2',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: sisi3Controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Masukkan sisi 3',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            var message = "";

            if (alasController.text.isEmpty ||
                tinggiController.text.isEmpty ||
                sisi1Controller.text.isEmpty ||
                sisi2Controller.text.isEmpty ||
                sisi3Controller.text.isEmpty)
              message =
                  "Masukkan nilai alas, tinggi, sisi 1, sisi 2, dan sisi 3";
            else if (double.parse(alasController.text) <= 0 ||
                double.parse(tinggiController.text) <= 0 ||
                double.parse(sisi1Controller.text) <= 0 ||
                double.parse(sisi2Controller.text) <= 0 ||
                double.parse(sisi3Controller.text) <= 0)
              message = "Masukkan nilai lebih dari 0";
            else if (double.parse(sisi1Controller.text) >=
                    double.parse(sisi2Controller.text) +
                        double.parse(sisi3Controller.text) ||
                double.parse(sisi2Controller.text) >=
                    double.parse(sisi1Controller.text) +
                        double.parse(sisi3Controller.text) ||
                double.parse(sisi3Controller.text) >=
                    double.parse(sisi1Controller.text) +
                        double.parse(sisi2Controller.text))
              message = "Masukkan nilai sisi 1, sisi 2, dan sisi 3 yang valid";
            else
              message = "berhasil";

            if (message != "berhasil") {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
              return;
            }

            setState(() {
              double alas = double.parse(alasController.text);
              double tinggi = double.parse(tinggiController.text);
              double sisi1 = double.parse(sisi1Controller.text);
              double sisi2 = double.parse(sisi2Controller.text);
              double sisi3 = double.parse(sisi3Controller.text);

              double luas = (alas * tinggi) / 2;
              double keliling = sisi1 + sisi2 + sisi3;

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
          _hasilLuas.isEmpty || _hasilKeliling.isEmpty ? "" : "Hasil",
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
