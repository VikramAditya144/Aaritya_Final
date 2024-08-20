import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Add this for pie chart
import '../widgets/animated_background.dart';
import '../screens/home_screen.dart'; // Import the HomeScreen

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final correctAnswers = ModalRoute.of(context)!.settings.arguments as int;
    final incorrectAnswers = 10 - correctAnswers;

    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      body: AnimatedBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Quiz Completed!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Color(0xFF1E1E1E), // Dark container background
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'You got',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            '$correctAnswers out of 10',
                            style: TextStyle(
                              color: Color(0xFFFFC107),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'questions correct!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          _buildPieChart(correctAnswers, incorrectAnswers),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton.icon(
                      icon: Icon(Icons.replay),
                      label: Text('Restart Quiz'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        backgroundColor: Color(0xFFFFC107),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadowColor: Color(0xFFFFC107).withOpacity(0.5),
                        elevation: 10,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/quiz');
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      icon: Icon(Icons.home),
                      label: Text('Go Home'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        backgroundColor: Colors.grey[800], // Dark button background
                        foregroundColor: Colors.white, // Button text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadowColor: Colors.grey[800]!.withOpacity(0.5),
                        elevation: 10,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        ); // Route to the HomeScreen
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

  Widget _buildPieChart(int correctAnswers, int incorrectAnswers) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Colors.greenAccent,
              value: correctAnswers.toDouble(),
              title: '$correctAnswers Correct',
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Dark theme text color
              ),
              radius: 60, // Smaller radius
            ),
            PieChartSectionData(
              color: Colors.redAccent,
              value: incorrectAnswers.toDouble(),
              title: '$incorrectAnswers Incorrect',
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Dark theme text color
              ),
              radius: 60, // Smaller radius
            ),
          ],
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 30, // Adjust center space if needed
        ),
      ),
    );
  }
}
