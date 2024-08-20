import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for the entire screen
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 250,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: _buildProfileHeader(),
              ),
              bottom: TabBar(
                tabs: [
                  Tab(text: "Badges"),
                  Tab(text: "Stats"),
                  Tab(text: "Details"),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              _buildBadgesSection(), // First Tab (Badges)
              _buildStatsSection(context), // Second Tab (Stats)
              _buildDetailsSection(), // Third Tab (Details)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.purple[300],
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          'Vikramaditya',
          style: TextStyle(
            fontSize: 28, // Increased font size for better visibility
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: const Color.fromARGB(255, 24, 24, 24), // Brighter color for text
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatCard('Points', '590'),
            _buildStatCard('World Rank', '#1,438'),
            _buildStatCard('Local Rank', '#56'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[300],
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          _buildBadgeItem(Icons.star, Colors.yellow),
          _buildBadgeItem(Icons.bar_chart, Colors.blue),
          _buildBadgeItem(Icons.emoji_emotions, Colors.green),
          _buildBadgeItem(Icons.lock, Colors.grey),
          _buildBadgeItem(Icons.local_fire_department, Colors.red),
          _buildBadgeItem(Icons.school, Colors.purple),
        ],
      ),
    );
  }

  Widget _buildBadgeItem(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        icon,
        size: 40,
        color: color,
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You have played a total',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.grey[300],
              ),
            ),
            Text(
              '24 quizzes this month!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.purple[200],
              ),
            ),
            SizedBox(height: 20),
            _buildCircularProgress('37/50', 'quiz played'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryCard(context, '5', 'Quiz Created'),
                _buildSummaryCard(context, '21', 'Quiz Won'),
              ],
            ),
            SizedBox(height: 20),
            _buildPerformanceSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    // Placeholder for details section
    return Center(
      child: Text(
        'Details Content Here',
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCircularProgress(String value, String label) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: 0.74,
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation(Colors.purple[200]),
                backgroundColor: Colors.grey[700],
              ),
              Center(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[300],
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context, String value, String label) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade700,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[300],
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top performance by category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          _buildPerformanceBar('Math', 0.3, Colors.purple[300]),
          SizedBox(height: 8),
          _buildPerformanceBar('Sports', 0.8, Colors.amber),
          SizedBox(height: 8),
          _buildPerformanceBar('Music', 0.6, Colors.lightBlue),
        ],
      ),
    );
  }

  Widget _buildPerformanceBar(String label, double value, Color? color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            color: Colors.grey[300],
          ),
        ),
        SizedBox(height: 4),
        LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.grey[700],
          valueColor: AlwaysStoppedAnimation<Color>(color!),
        ),
      ],
    );
  }
}
