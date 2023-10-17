import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final result;
  const ResultScreen({super.key, required this.result});
  @override
  Widget build(BuildContext context) {
    final mq = MediaQueryData.fromView(WidgetsBinding.instance.window);
    String score = result >= 18.5 && result <= 24.9
        ? "Health Weight"
        : result >= 25.0 && result <= 29.9
            ? "Overweight"
            : result >= 30
                ? "Obesity"
                : "Underweight";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Result"),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: mq.size.height,
          ),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Your BMI is: ",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 8)),
                  Text(
                    result.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 8)),
                  Text(
                    "You are $score",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 16)),
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.black)),
                    child: const Text("Recalculate"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
