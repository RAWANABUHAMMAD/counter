import 'package:flutter/material.dart';

void main() {
  runApp(const BasketballScoreCounter());
}

class BasketballScoreCounter extends StatelessWidget {
  const BasketballScoreCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ScoreCounterPage(),
    );
  }
}

class ScoreCounterPage extends StatefulWidget {
  const ScoreCounterPage({super.key});

  @override
  State<ScoreCounterPage> createState() => _ScoreCounterPageState();
}

class _ScoreCounterPageState extends State<ScoreCounterPage> {
  int teamAScore = 0;
  int teamBScore = 0;

  void _incrementScore(int points, String team) {
    setState(() {
      if (team == 'A') {
        teamAScore += points;
      } else {
        teamBScore += points;
      }
    });
  }

  void _resetScores() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Basketball Pointer Counter',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                buildTeamColumn('Team A', teamAScore, 'A'),
                Container(
                  width: 1,
                  color: Colors.black,
                ),
                buildTeamColumn('Team B', teamBScore, 'B'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              onPressed: _resetScores,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text(
                'Reset Pointer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTeamColumn(String teamName, int score, String team) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            teamName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          buildAddPointButton('Add 1 Point', 1, team),
          const SizedBox(height: 8),
          buildAddPointButton('Add 2 Point', 2, team),
          const SizedBox(height: 8),
          buildAddPointButton('Add 3 Point', 3, team),
        ],
      ),
    );
  }

  Widget buildAddPointButton(String label, int point, String team) {
    return ElevatedButton(
      onPressed: () => _incrementScore(point, team),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(130, 40),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
