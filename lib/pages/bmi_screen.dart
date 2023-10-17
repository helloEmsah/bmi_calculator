import 'package:bmi_calculator/pages/result_screen.dart';
import 'package:flutter/material.dart';

class BMIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BMIInputForm(),
    );
  }
}

class BMIInputForm extends StatefulWidget {
  const BMIInputForm({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<BMIInputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double result = 0.0;

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQueryData.fromView(WidgetsBinding.instance.window);

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: mq.size.height,
          ),
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Enter Weight (KG):",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your weight';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Enter Height (cm):",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your height';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.black)),
                      child: const Text("Calculate"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          double weight =
                              double.tryParse(weightController.text) ?? 0.0;
                          double height =
                              double.tryParse(heightController.text) ?? 0.0;
                          result = weight / ((height / 100) * (height / 100));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ResultScreen(result: result);
                          }));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
