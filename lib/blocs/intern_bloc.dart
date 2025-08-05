
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
        {'name': 'Deepak', 'donations': 6000},
        {'name': 'Ram', 'donations': 5500},
        {'name': 'Manish', 'donations': 5000},
        {'name': 'Prabhat', 'donations': 4800},
        {'name': 'Ravi', 'donations': 4500},
      ];

      emit(InternLoaded(intern: intern, leaderboard: leaderboard));
    });
  }
}
