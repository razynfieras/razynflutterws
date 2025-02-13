import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingscreenState();
}

class _RatingscreenState extends State<RatingScreen> {
  var playerData;
  var playerStats;

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loadplayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Player Ratings",
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {
              loadplayer();
              loadelo();
            },
            icon: const Icon(Icons.refresh, size: 30),
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Search Field
            _buildSearchField(),
            const SizedBox(height: 20),

            // Player Info Card
            if (playerData != null) _buildPlayerInfoCard(),
            const SizedBox(height: 20),

            // Player Stats Card
            if (playerStats != null) _buildPlayerStatsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        labelText: "Search Player",
        hintText: "Enter username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
      ),
      onSubmitted: (value) {
        loadplayer();
        loadelo();
      },
    );
  }

  Widget _buildPlayerInfoCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Player Avatar
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                playerData["avatar"] ?? '',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              playerData["name"] ?? '',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "@${playerData["username"]}",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              "League: ${playerData["league"] ?? ''}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "${playerData["followers"] ?? 0} Followers",
              style: TextStyle(fontSize: 16, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerStatsCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ratings:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildRatingRow(
                "Rapid:", playerStats["chess_rapid"]["last"]["rating"]),
            _buildRatingRow(
                "Bullet:", playerStats["chess_bullet"]["last"]["rating"]),
            _buildRatingRow(
                "Blitz:", playerStats["chess_blitz"]["last"]["rating"]),
            _buildRatingRow("FIDE:", playerStats["fide"]),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(String label, dynamic rating) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 8),
          Text(
            rating?.toString() ?? 'N/A',
            style: TextStyle(fontSize: 16, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }

  Future<void> loadplayer() async {
    String player = searchController.text;
    playerData = null;

    final apiUrl = Uri.parse('https://api.chess.com/pub/player/$player');
    try {
      // Make an HTTP GET request.
      final response = await http.get(apiUrl);
      log(response.body);

      // Check if the response is OK (status code 200).
      if (response.statusCode == 200) {
        // Decode the JSON response.
        playerData = json.decode(response.body);
        // Update the state with the fetched data.
        setState(() {});
      } else {
        print(
            'Error: Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the request.
      print('Exception caught: $e');
    }
  }

  Future<void> loadelo() async {
    String player = searchController.text;
    playerStats = null;

    final apiUrl = Uri.parse('https://api.chess.com/pub/player/$player/stats');
    try {
      // Make an HTTP GET request.
      final response = await http.get(apiUrl);
      log(response.body);

      // Check if the response is OK (status code 200).
      if (response.statusCode == 200) {
        // Decode the JSON response.
        playerStats = json.decode(response.body);
        // Update the state with the fetched data.
        setState(() {});
      } else {
        print(
            'Error: Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the request.
      print('Exception caught: $e');
    }
  }
}
