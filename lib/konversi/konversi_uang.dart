import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double inputAmount = 0.0;
  double convertedAmount = 0.0;
  String selectedFromCurrency = 'Rupiah';
  String selectedToCurrency = 'USD';

  Map<String, double> exchangeRates = {
    'Rupiah': 14000,
    'USD': 1.0, // Ubah sesuai dengan nilai tukar aktual
    'SAR': 3.7, // Ubah sesuai dengan nilai tukar aktual
    'MYR': 3.5, // Ubah sesuai dengan nilai tukar aktual
  };

  void convertCurrency() {
    setState(() {
      double fromRate = exchangeRates[selectedFromCurrency] ?? 1.0;
      double toRate = exchangeRates[selectedToCurrency] ?? 1.0;
      convertedAmount = (inputAmount * toRate) / fromRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mario MONEY'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueGrey],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10), 
            Image.asset(
              '../assets/gambar5.jpg', 
              height: 200, 
              width: 300,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Masukkan Jumlah'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: selectedFromCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFromCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
                Text('ke'),
                DropdownButton<String>(
                  value: selectedToCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedToCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text('$selectedFromCurrency: $inputAmount'),
            Text('$selectedToCurrency: ${convertedAmount.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
