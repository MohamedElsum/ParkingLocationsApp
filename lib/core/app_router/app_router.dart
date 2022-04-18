import 'package:breaking_bad_clone/business_logic/cubit/parking_cubit.dart';
import 'package:breaking_bad_clone/core/constants/strings.dart';
import 'package:breaking_bad_clone/domain/usecases/add_location_usecase.dart';
import 'package:breaking_bad_clone/domain/usecases/get_locations_usecase.dart';
import 'package:breaking_bad_clone/presentation/screens/add_location_screen.dart';
import 'package:breaking_bad_clone/presentation/screens/parking_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late ParkingCubit _parkingCubit;
  late AddLocationUsecase _addLocationUsecase;
  late GetLocationUsecase _getLocationUsecase;

  AppRouter() {
    _addLocationUsecase = AddLocationUsecase();
    _getLocationUsecase = GetLocationUsecase();
    _parkingCubit = ParkingCubit(_addLocationUsecase, _getLocationUsecase);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.showParkingMapScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => _parkingCubit,
            child: const ParkingMapScreen(),
          ),
        );
      case AppConstants.parkingMapScreen:
        return MaterialPageRoute(
          builder: (_) => AddLocation(
            parkingCubit: _parkingCubit,
          ),
        );
    }
    return null;
  }
}
