import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'core/utils/App_assets.dart';
class TimeTab extends StatefulWidget {
  @override
  _TimeTabState createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  Map<String, dynamic>? prayerTimes;

  @override
  void initState() {
    super.initState();
    _fetchPrayerTimes();
  }

  Future<void> _fetchPrayerTimes() async {
    final response = await http.get(Uri.parse('YOUR_API_ENDPOINT_HERE'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        prayerTimes = data['data']['timings']; // Adjust based on your API structure
      });
    } else {
      print('Failed to load prayer times');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            AppAssets.backgroundTimeTab,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header with date and title
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Islami',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '16 Jul 2024 - Tuesday',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                // Prayer Times Section
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.brown[700],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildPrayerTimeTile('Fajr', prayerTimes?['Fajr'] ?? '01:01 AM'),
                          _buildPrayerTimeTile('Dhuhr', prayerTimes?['Dhuhr'] ?? '01:01 PM'),
                          _buildPrayerTimeTile('Asr', prayerTimes?['Asr'] ?? '04:38 PM'),
                          _buildPrayerTimeTile('Maghrib', prayerTimes?['Maghrib'] ?? '07:57 PM'),
                          _buildPrayerTimeTile('Isha', prayerTimes?['Isha'] ?? '09:00 PM'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Next Prayer - 02:32',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Azkar Buttons
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildAzkarButton('Evening Azkar', AppAssets.eveningAzkarIcon),
                      _buildAzkarButton('Morning Azkar', AppAssets.morningAzkarIcon),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeTile(String prayer, String time) {
    return Column(
      children: [
        Text(
          prayer,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          time,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildAzkarButton(String title, String assetPath) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press (e.g., navigate to Azkar screen)
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Image.asset(assetPath, height: 50),
          SizedBox(height: 10),
          Text(title, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}