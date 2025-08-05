
import 'package:flutter_bloc/flutter_bloc.dart';
import 'intern_event.dart';
import 'intern_state.dart';
import '../models/intern.dart';

class InternBloc extends Bloc<InternEvent, InternState> {
  InternBloc() : super(InternInitial()) {
    on<LoadInternData>((event, emit) {
      final intern = Intern(
        name: 'Manish Sharma',
        referralCode: 'manish2025',
        totalDonations: 5000,
        rewards: ['T-Shirt', 'Badge', 'E-Certificate'],
      );

      final leaderboard = [
        {'name': 'Rohan', 'donations': 7500},
        {'name': 'Deepak', 'donations': 6000},
        {'name': 'Manish', 'donations': 5000},
        {'name': 'Aryan', 'donations': 4800},
        {'name': 'Rohit', 'donations': 4500},
      ];

      emit(InternLoaded(intern: intern, leaderboard: leaderboard));
    });
  }
}
