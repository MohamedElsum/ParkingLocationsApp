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
  final List<Locations> locations;

  const ParkingLoaded(this.locations);

  @override
  List<Object> get props => [locations];
}
