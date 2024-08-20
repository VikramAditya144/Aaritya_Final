import 'package:flutter/material.dart';
import 'dart:async';
import '../models/question.dart';
import '../services/api_service.dart';
import '../widgets/animated_background.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<Question>> _questions;
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;
  int? _selectedOptionId;
  bool? _isCorrect;
  
  // Timer variables
  late Timer _timer;
  int _secondsRemaining = 600; // 10 minutes in seconds

  @override
  void initState() {
    super.initState();
    _questions = ApiService().fetchQuestions();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          _endQuiz();
        }
      });
    });
  }

  void _endQuiz() {
    _timer.cancel();
    Navigator.pushReplacementNamed(
      context, 
      '/result',
      arguments: _correctAnswers,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _answerQuestion(int selectedOptionId) {
    _questions.then((questions) {
      setState(() {
        _selectedOptionId = selectedOptionId;
        _isCorrect =
            selectedOptionId == questions[_currentQuestionIndex].correctAnswer;

        if (_isCorrect!) {
          _correctAnswers++;
        }

        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            if (_currentQuestionIndex < questions.length - 1) {
              _currentQuestionIndex++;
              _selectedOptionId = null;
              _isCorrect = null;
            } else {
              _endQuiz();
            }
          });
        });
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      body: AnimatedBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return FutureBuilder<List<Question>>(
                future: _questions,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                            color: Color(0xFF6A53A1))); // Purple color
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error}',
                            style: TextStyle(
                                color: Colors.red[300], fontSize: 18)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                        child: Text('No questions available',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 18)));
                  } else {
                    final question = snapshot.data![_currentQuestionIndex];

                    double padding = constraints.maxWidth > 800 ? 40 : 20;
                    double textSize = constraints.maxWidth > 800 ? 28 : 24;

                    return Column(
                      children: [
                        LinearProgressIndicator(
                          value: (_currentQuestionIndex + 1) /
                              snapshot.data!.length,
                          backgroundColor: Colors.grey[800],
                          color: Colors.blueAccent, // Changed color
                          minHeight: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Time Remaining: ${_formatTime(_secondsRemaining)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellowAccent, // Changed color
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.black,
                                  Colors.grey[900]!, // Dark gradient
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: padding, vertical: padding),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Question ${_currentQuestionIndex + 1}/${snapshot.data!.length}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  if (question.imageUrl.isNotEmpty)
                                    Container(
                                      constraints: BoxConstraints(
                                        maxHeight: constraints.maxHeight * 0.3,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Image.network(
                                        question.imageUrl,
                                        fit: BoxFit.contain,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        (loadingProgress
                                                                .expectedTotalBytes ??
                                                            1)
                                                    : null,
                                              ),
                                            );
                                          }
                                        },
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Text(
                                            'Image not available',
                                            style: TextStyle(color: Colors.red),
                                          );
                                        },
                                      ),
                                    )
                                  else
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('No image available',
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(padding),
                                      decoration: BoxDecoration(
                                        color: _selectedOptionId != null
                                            ? (_isCorrect!
                                                ? Colors.green[700]
                                                : Colors.red[700])
                                            : Colors.grey[800],
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        question.question,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: textSize,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Column(
                                    children: question.options.map((option) {
                                      bool isSelected =
                                          _selectedOptionId == option.id;
                                      bool isCorrectOption =
                                          option.id == question.correctAnswer;

                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        width: constraints.maxWidth * 0.8,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: isSelected
                                                ? (isCorrectOption
                                                    ? Colors.green[700]
                                                    : Colors.red[700])
                                                : Colors.grey[800],
                                            foregroundColor: Colors.white,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            shadowColor: Colors.black.withOpacity(0.4),
                                            elevation: 4,
                                            side: BorderSide(
                                              color: isSelected
                                                  ? (isCorrectOption
                                                      ? Colors.green
                                                      : Colors.red)
                                                  : Colors.grey[600]!,
                                              width: 2,
                                            ),
                                          ),
                                          onPressed: _selectedOptionId == null
                                              ? () => _answerQuestion(option.id)
                                              : null,
                                          child: Text(
                                            option.text,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
