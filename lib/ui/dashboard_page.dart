import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/intern_state.dart';
import '../blocs/intern_bloc.dart';
import 'leaderboard_page.dart';
import 'announcements_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intern Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<InternBloc, InternState>(
        builder: (context, state) {
          if (state is InternLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${state.intern.name}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text('Referral Code: ${state.intern.referralCode}'),
                  const SizedBox(height: 10),
                  Text('Total Donations: ₹${state.intern.totalDonations}'),
                  const SizedBox(height: 20),
                  const Text(
                    'Rewards:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...state.intern.rewards
                      .map(
                        (r) => Card(
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Text(r),
                            ),
                          ),
                          color: Color(0xffc4c4c4),
                        ),
                      )
                      .toList(),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: const Text('Leaderboard'),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.blueAccent
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LeaderboardPage(),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: const Text('Announcements'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.blueAccent
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AnnouncementsPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
