import 'package:bloc/bloc.dart';
import 'package:breaking_bad_clone/domain/models/location.dart';
import 'package:breaking_bad_clone/domain/usecases/add_location_usecase.dart';
import 'package:breaking_bad_clone/domain/usecases/get_locations_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
part 'parking_state.dart';

class ParkingCubit extends Cubit<ParkingState> {
  final AddLocationUsecase _addLocationUsecase;
  final GetLocationUsecase _getLocationUsecase;

  List<Locations>? _locations;

  List<Locations>? get locations => _locations;

  ParkingCubit(this._addLocationUsecase,this._getLocationUsecase)
      : super(
          ParkingInitial(),
        );

  Future<void> addLocation(
      double lat, double long, String name, String des, double rate) async {
    await _addLocationUsecase.addLocation(lat, long, name, des, rate);
  }

  Future<void> getLocationsData() async{
    emit(ParkingLoading());
    final locations = await _getLocationUsecase.getLocationsData();
    _locations = locations;
    emit(ParkingLoaded(locations));
  }
}
