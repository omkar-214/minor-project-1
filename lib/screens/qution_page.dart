import 'package:flutter/material.dart';
import '../data/question_list.dart';
import '../widgets/option_tile.dart';
import 'result_page.dart';

class QutionPage extends StatefulWidget {
  @override
  State<QutionPage> createState() => _QutionPageState();
}

class _QutionPageState extends State<QutionPage> {
  int currentIndex = 0;
  String userName = "Omkar";
  List<int> answers = [];
  List<bool> marked = [];

  @override
  void initState() {
    super.initState();
    answers = List.filled(questionList.length, -1);
    marked = List.filled(questionList.length, false);
  }

  int getScore() {
    int score = 0;
    for (int i = 0; i < questionList.length; i++) {
      if (answers[i] == questionList[i].correctOptionIndex) {
        score++;
      }
    }
    return score;
  }

  int getAnsweredCount() {
    int count = 0;
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] != -1) {
        count++;
      }
    }
    return count;
  }

  int getMarkedCount() {
    int count = 0;
    for (int i = 0; i < marked.length; i++) {
      if (marked[i]) {
        count++;
      }
    }
    return count;
  }

  void submitTest() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          userName: userName,
          score: getScore(),
          total: questionList.length,
        ),
      ),
          (route) => route.isFirst,
    );
  }

  void showSubmitDialog() {
    int answered = getAnsweredCount();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Are you sure you want to finish the assessment?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Section Summary", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 12),
              Wrap(
                spacing: 20,
                runSpacing: 8,
                children: [
                  Text("$answered answered"),
                  Text("${getMarkedCount()} Marked as review"),
                  Text("${questionList.length - answered} Unanswered"),
                ],
              ),
            ],
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: Text("Resume"),
            ),
            ElevatedButton(
              onPressed: () {
                submitTest();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF16966A),
              ),
              child: Text(
                "Submit Assessment",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget questionPart() {
    var question = questionList[currentIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "SECTION 1",
              style: TextStyle(color: Colors.lightBlue, fontSize: 12),
            ),
            SizedBox(width: 8),
            Text("Part A", style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(height: 4),
        Text(
          "Question ${currentIndex + 1}",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text("+1 Marks", style: TextStyle(color: Colors.grey)),
        SizedBox(height: 25),
        Text(question.questionText, style: TextStyle(fontSize: 16)),
        SizedBox(height: 25),
        for (int i = 0; i < question.options.length; i++)
          OptionTile(
            text: question.options[i],
            isSelected: answers[currentIndex] == i,
            onTap: () {
              setState(() {
                answers[currentIndex] = i;
              });
            },
          ),
      ],
    );
  }

  Widget bottomBar() {
    bool isLast = currentIndex == questionList.length - 1;

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        OutlinedButton.icon(
          onPressed: currentIndex == 0
              ? null
              : () {
            setState(() {
              currentIndex--;
            });
          },
          icon: Icon(Icons.chevron_left, size: 18),
          label: Text("Previous"),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            setState(() {
              answers[currentIndex] = -1;
            });
          },
          icon: Icon(Icons.delete_outline, size: 18),
          label: Text("Clear Response"),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            setState(() {
              marked[currentIndex] = !marked[currentIndex];
            });
          },
          icon: Icon(
            marked[currentIndex] ? Icons.bookmark : Icons.bookmark_border,
            size: 18,
          ),
          label: Text(marked[currentIndex] ? "Unmark" : "Mark"),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            if (isLast) {
              showSubmitDialog();
            } else {
              setState(() {
                currentIndex++;
              });
            }
          },
          icon: Icon(
            isLast ? Icons.upload_outlined : Icons.check_circle_outline,
            color: Colors.white,
            size: 18,
          ),
          label: Text(
            isLast ? "Submit Assessment" : "Save and Next",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF16966A),
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: questionPart(),
                ),
              ),
              bottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}