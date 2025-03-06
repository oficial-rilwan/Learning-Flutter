import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((item) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                            item['is_correct'] == true
                                ? Colors.blue[200]
                                : Colors.pink[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(
                            ((item['question_index'] as int) + 1).toString(),
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['question'] as String,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            item['user_answer'] as String,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 170, 160, 199),
                            ),
                          ),
                          Text(
                            item['correct_answer'] as String,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 98, 177, 242),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
