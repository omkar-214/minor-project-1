import 'package:flutter/material.dart';
import 'qution_page.dart';

class ResultPage extends StatelessWidget {
  final String userName;
  final int score;
  final int total;

  ResultPage({
    required this.userName,
    required this.score,
    required this.total,
  });

  Widget infoCard(String title, String value) {
    return Scaffold(
      body: Expanded(

        child: Container(
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 11, color: Colors.black54)),

              SizedBox(height: 14),

              Text(
                value,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget countItem(String title, int value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 11, color: Colors.black54)),

        SizedBox(height: 14),

        Text(
          "$value",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int wrong = total - score;
    double percentage = (score / total) * 100;
    bool isPassed = percentage >= 50;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isPassed ? Color(0xFFC8FFE8) : Color(0xFFFFD9D9),
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(

                children: [

                  SizedBox(height: 50),
                  CircleAvatar(

                    radius: 28,
                    backgroundColor: isPassed ? Colors.green : Colors.red,
                    child: Icon(
                      isPassed ? Icons.check : Icons.close,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  SizedBox(height: 25),

                  Text(
                    isPassed
                        ? "Congratulations $userName ,\nyou have passed the assessment."
                        : "Sorry $userName ,\nyou have not passed the assessment.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 25),


                  Wrap(

                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [

                      OutlinedButton.icon(

                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        icon: Icon(Icons.chevron_left, size: 18),
                        label: Text("Back to Home"),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                        ),
                      ),


                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => QutionPage()),
                          );
                        },
                        icon: Icon(Icons.refresh, color: Colors.white, size: 18),
                        label: Text(
                          "Restart Quiz",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1463FF),
                          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),


                  Row(
                    children: [
                      infoCard("ASSESSMENT NAME", "Smart Quiz"),
                    ],
                  ),
                  SizedBox(height: 16),


                  Row(

                    children: [
                      infoCard("TOTAL MARKS SCORED", "$score.00 / $total marks"),
                      SizedBox(width: 16),
                      infoCard("PERCENTAGE", "${percentage.toStringAsFixed(0)} %"),
                    ],
                  ),

                  SizedBox(height: 16),


                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        countItem("TOTAL", total, Colors.black),
                        countItem("CORRECT", score, Colors.green),
                        countItem("INCORRECT", wrong, Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}