import 'package:flutter/material.dart';
import 'add_tab.dart';
import 'leaderboard_tab.dart';
import 'profile_tab.dart';
import 'quiz_screen.dart'; // Import the QuizScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    AddTab(),
    LeaderboardTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF00BFAE), // Teal color
        unselectedItemColor: Colors.grey[500],
        backgroundColor: Color(0xFF1E1E1E), // Dark background
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // Top padding for status bar
            Text(
              "WELCOME BACK",
              style: TextStyle(
                color: Colors.grey.shade400, // Light grey text color
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vikram Aditya",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[800],
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF2A2A2A), // Slightly lighter dark background
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.headset, color: Colors.white),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent Quiz: Trading Basics',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: 0.65,
                            backgroundColor: Colors.white30,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF00BFAE), // Teal color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    '65%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF2A2A2A), // Slightly lighter dark background
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Take part in challenges with friends or other traders',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00BFAE), // Teal color
                      foregroundColor: Colors.black,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(12),
                    ),
                    child: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Live Quizzes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.grey.shade400, // Light grey text color
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                QuizItem(
                  title: 'Market Analysis Quiz',
                  quizzes: 12,
                  icon: Icons.trending_up,
                ),
                QuizItem(
                  title: 'Technical Indicators Quiz',
                  quizzes: 10,
                  icon: Icons.show_chart,
                ),
                // Add more QuizItem widgets here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuizItem extends StatelessWidget {
  final String title;
  final int quizzes;
  final IconData icon;

  QuizItem({
    required this.title,
    required this.quizzes,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Color(0xFF2A2A2A), // Dark card background
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF00BFAE)), // Teal color
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
        ),
        subtitle: Text(
          'Trading - $quizzes Quizzes',
          style: TextStyle(color: Colors.grey.shade500, fontFamily: 'Roboto'),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF00BFAE), // Teal color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Start Quiz',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF1E1E1E), // Dark background
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Roboto',
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1E1E1E),
        selectedItemColor: Color(0xFF00BFAE), // Teal color
        unselectedItemColor: Colors.grey[500],
      ),
    ),
  ));
}
