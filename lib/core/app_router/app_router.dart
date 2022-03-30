import 'package:breaking_bad_clone/business_logic/cubit/parking_cubit.dart';
import 'package:breaking_bad_clone/core/constants/strings.dart';
import 'package:breaking_bad_clone/presentation/screens/parking_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late ParkingCubit _parkingCubit;

  AppRouter() {
    _parkingCubit = ParkingCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.parkingMapScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => _parkingCubit,
            child: const ParkingMapScreen(),
          ),
        );
    }
  }
}
