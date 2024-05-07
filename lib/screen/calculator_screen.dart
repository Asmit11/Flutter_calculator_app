import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final gap = const SizedBox(
    height: 10,
  );

  int? first;

  int? second;

  int result = 0;

  final TextEditingController _numController = TextEditingController();

  final List<String> IstOperatorNumber = [
    "C",
    "",
    "/",
    "<-",
    "7",
    "8",
    "9",
    "-",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "",
    "/",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Calculator App",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.end,
                controller: _numController,
                // limit the character to 10 digit
                maxLength: 10,
                // show the num keyboard
                keyboardType: TextInputType.number,
                // don't allow character typing
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '0',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "0";
                  }
                  return null;
                },
              ),
              // gap,
              Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: IstOperatorNumber.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      onPressed: () {
                        if (IstOperatorNumber[index] == "C") {
                          _numController.text = "";
                        } else if (IstOperatorNumber[index] == "<-") {
                          _numController.text = _numController.text
                              .substring(0, _numController.text.length - 1);
                        } else {
                          _numController.text += IstOperatorNumber[index];
                        }
                      },
                      child: Text(
                        IstOperatorNumber[index],
                        style: const TextStyle(fontSize: 30),
                      ));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
