import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/intern_state.dart';
import '../blocs/intern_bloc.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<InternBloc, InternState>(
        builder: (context, state) {
          if (state is InternLoaded) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 11, 0, 11),
              child: ListView.builder(
                itemCount: state.leaderboard.length,
                itemBuilder: (context, index) {
                  final user = state.leaderboard[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(11, 5, 11, 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: ListTile(
                        tileColor: Color(0xffc4c4c4),
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(user['name']),
                        trailing: Text('₹${user['donations']}'),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
