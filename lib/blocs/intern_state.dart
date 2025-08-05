import '../models/intern.dart';

abstract class InternState {}

class InternInitial extends InternState {}

class InternLoaded extends InternState {
  final Intern intern;
  final List<Map<String, dynamic>> leaderboard;

  InternLoaded({required this.intern, required this.leaderboard});
}
