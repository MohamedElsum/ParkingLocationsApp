import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'parking_state.dart';

class ParkingCubit extends Cubit<ParkingState> {

  ParkingCubit() : super(ParkingInitial());
}
