part of 'parking_cubit.dart';

abstract class ParkingState extends Equatable {
  const ParkingState();
}

class ParkingInitial extends ParkingState {
  @override
  List<Object> get props => [];
}

class ParkingLoading extends ParkingState {
  @override
  List<Object> get props => [];
}

class ParkingLoaded extends ParkingState {
  final List<dynamic> data;

  const ParkingLoaded(this.data);

  @override
  List<Object> get props => [data];
}
