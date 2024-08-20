import 'package:flutter/material.dart';

class LeaderboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Weekly and Monthly
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: innerBoxIsScrolled ? Text("Leaderboard") : null,
                  background: _buildTopContent(),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(36.0), // Reduced the height
                  child: TabBar(
                    indicatorColor: Colors.orangeAccent,
                    labelPadding: EdgeInsets.symmetric(horizontal: 4.0), // Reduced padding
                    labelStyle: TextStyle(
                      fontSize: 16, // Increased font size for visibility
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent, // Text color for selected tab
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 16, // Consistent font size
                      color: Colors.white70, // Text color for unselected tabs
                    ),
                    indicatorWeight: 3.0, // Thickness of the tab indicator
                    tabs: [
                      Tab(text: "Weekly"),
                      Tab(text: "Monthly"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _buildLeaderboardList(),
              _buildLeaderboardList(), // Can customize for "Monthly"
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '#4',
              style: TextStyle(
                color: Colors.amberAccent, // Gold color
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              'You are doing better than 60% of other players!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTopPlayer('Alena Donin', '1,469 QP', Icons.emoji_events),
                _buildTopPlayer('Davis Curtis', '2,569 QP', Icons.emoji_events,
                    isWinner: true),
                _buildTopPlayer('Craig Gouse', '1,053 QP', Icons.emoji_events),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRankedBadge('#2'),
                _buildRankedBadge('#1'),
                _buildRankedBadge('#3'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPlayer(String name, String points, IconData icon,
      {bool isWinner = false}) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: isWinner ? 40 : 30,
            backgroundColor: isWinner ? Colors.orange : Colors.blueAccent,
            child: Icon(icon, size: isWinner ? 40 : 30, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            points,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankedBadge(String rank) {
    return Expanded(
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            rank,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardList() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildLeaderboardItem(1, 'Davis Curtis', '2,569 points', Colors.amberAccent),
        _buildLeaderboardItem(2, 'Alena Donin', '1,469 points', Colors.grey),
        _buildLeaderboardItem(3, 'Craig Gouse', '1,053 points', Colors.orange),
        _buildLeaderboardItem(4, 'Madelyn Dias', '590 points'),
        _buildLeaderboardItem(5, 'Zain Vaccaro', '448 points'),
        _buildLeaderboardItem(6, 'Skylar Geidt', '448 points'),
        // Add more leaderboard items as needed
      ],
    );
  }

  Widget _buildLeaderboardItem(int rank, String name, String points,
      [Color? badgeColor]) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.blueGrey[900],
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blueGrey[700],
          child: Text(
            rank.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          points,
          style: TextStyle(
            color: Colors.white70,
            fontFamily: 'Poppins',
          ),
        ),
        trailing: badgeColor != null
            ? Icon(
                Icons.emoji_events,
                color: badgeColor,
              )
            : null,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LeaderboardTab(),
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: Color(0xFF121212), // Very dark background
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
    ),
  ));
}
