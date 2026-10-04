import 'package:flutter/material.dart';
import '../data/question_list.dart';
import 'qution_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: Center(

        child: Container(
          width: 350,
          height: 300,

          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border(
              top: BorderSide(color: const Color(0xFF0066FF), width: 3),
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [

                  Expanded(flex: 1, child: Center(child: Text("Quiz"))),


                  Row(

                    children: List.generate(
                      100,
                          (index) => Expanded(
                        child: Container(
                          height: 1,
                          color: index % 2 == 0 ? Colors.grey : Colors.transparent,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 20),


                  Expanded(

                    flex: 3,
                    child: Center(
                      child: Column(
                        children: [
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Questions"),
                              Text("${questionList.length}"),
                            ],
                          ),

                          SizedBox(height: 15),

                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Passing Percentage"),
                              Text("50%"),
                            ],
                          ),

                          SizedBox(height: 15),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Attempts Left"),
                              Text("1"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,

                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          _showDeclarationDailog(context);
                        },

                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF1463FF),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text(
                          "Start Quiz",
                          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15),
                        ),
                      ),
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

  void _showDeclarationDailog(BuildContext context) {
    bool isChecked = false;


    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (dialogContext, setState) {
          return AlertDialog(

            title: Text("Declaration"),
            content: SizedBox(
              width: 400,

              child: Row(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;

                      });
                    },

                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                          "I have read all the instructions carefully and have understood them. "
                          "I agree not to cheat or use unfair means in this examination. "
                          "I understand that using unfair means of any sort for my own or someone else's "
                          "advantage will lead to my immediate disqualification. "
                          "The decision of administrator will be final in these matters and cannot be appealed.",
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(

                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: isChecked
                    ? () {

                  Navigator.pop(dialogContext);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QutionPage()),


                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  backgroundColor: Color(0xFF3D84FF),
                ),
                child: Text("Start Test"),
              ),
            ],
          );
        });
      },
    );
  }
}