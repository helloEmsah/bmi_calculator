import 'package:dicoding_ta/pages/bmi_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Welcome"),
          backgroundColor: Colors.black87,
        ),
        body: const WelcomeScreen());
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/scale_image.jpg"),
                  fit: BoxFit.cover)),
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("BMI CALCULATOR",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              Container(
                color: Colors.white70,
                padding: const EdgeInsets.all(8),
                child: const Text(
                    "This app will calculate a numerical value derived from an individual's height and weight. It is a simple way to assess whether a person has a healthy body weight for a given height.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.black)),
                child: const Text("Continue",
                    style: TextStyle(color: Colors.white70)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BMIScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
