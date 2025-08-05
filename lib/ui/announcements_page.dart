import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final announcements = [
      '🎉 New reward unlocked at ₹6,000!',
      '📢 Webinar on fundraising tips this Friday!',
      '💡 Share your referral code to earn rewards!',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: announcements
            .map(
              (a) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(a),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
