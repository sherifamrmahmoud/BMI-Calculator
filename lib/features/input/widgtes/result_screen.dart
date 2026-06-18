import 'package:flutter/material.dart';
import 'package:nti5/core/colors_manager.dart';
import 'package:nti5/core/styles_manager.dart';

import 'package:nti5/core/button.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  const ResultScreen({super.key, required this.bmi});

  String getResult() {
    if (bmi < 18.5) {
      return "UNDERWEIGHT";
    } else if (bmi < 25) {
      return "NORMAL";
    } else if (bmi < 30) {
      return "OVERWEIGHT";
    } else {
      return "OBESE";
    }
  }

  String getMessage() {
    if (bmi < 18.5) {
      return "You have a lower than normal body weight. Try to eat more.";
    } else if (bmi < 25) {
      return "You have a normal body weight. Good job!";
    } else if (bmi < 30) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else {
      return "Your body weight is very high. Please consult a doctor.";
    }
  }

  Color getColor() {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi < 25) {
      return Colors.green;
    } else if (bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: AppBar(
        title: Text(
          "BMI RESULT",
          style: StylesManager.whiteStyle.copyWith(fontSize: width * 0.05),
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.primaryColor,
      ),

      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          children: [
            SizedBox(height: height * 0.02),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Result",
                style: StylesManager.whiteStyle.copyWith(
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: height * 0.04),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * 0.05),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(width * 0.05),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// RESULT TEXT
                    Text(
                      getResult(),
                      style: TextStyle(
                        color: getColor(),
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: height * 0.04),

                    /// BMI VALUE
                    FittedBox(
                      child: Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.04),

                    /// DESCRIPTION
                    Text(
                      getMessage(),
                      textAlign: TextAlign.center,
                      style: StylesManager.whiteStyle.copyWith(
                        fontSize: width * 0.04,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            SizedBox(
              width: double.infinity,
              height: height * 0.07,
              child: BmiButton(
                text: "RE-CALCULATE",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
