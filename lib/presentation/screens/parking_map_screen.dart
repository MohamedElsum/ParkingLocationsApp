import 'package:breaking_bad_clone/business_logic/cubit/parking_cubit.dart';
import 'package:breaking_bad_clone/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParkingMapScreen extends StatefulWidget {
  const ParkingMapScreen({Key? key}) : super(key: key);

  @override
  State<ParkingMapScreen> createState() => _ParkingMapScreenState();
}

class _ParkingMapScreenState extends State<ParkingMapScreen> {
  late ParkingCubit _parkingCubit;

  @override
  void initState() {
    super.initState();
    _parkingCubit = BlocProvider.of<ParkingCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParkingCubit, ParkingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.appYellow,
          ),
          body: Container(),
        );
      },
    );
  }
}
