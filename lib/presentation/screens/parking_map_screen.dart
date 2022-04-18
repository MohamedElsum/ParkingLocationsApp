import 'package:breaking_bad_clone/business_logic/cubit/parking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'add_location_screen.dart';

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
    _parkingCubit.getLocationsData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParkingCubit, ParkingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: const Text('Parking Locations'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 700,
                  child: GoogleMap(
                    markers: getMarkers(state),
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(30.033333, 31.233334),
                      zoom: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                AddLocation(parkingCubit: _parkingCubit)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      elevation: 5,
                    ),
                    child: const Text('Add Parking Location'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Set<Marker> getMarkers(state) {
    late Set<Marker> apiMarkers = {};
    if (state is ParkingLoaded) {
      for (int i = 0; i < state.locations.length - 1; i++) {
        apiMarkers.add(Marker(
          markerId: MarkerId(state.locations[i].name),
          position: LatLng(double.parse(state.locations[i].latitude),
              double.parse(state.locations[i].longitude)),
          infoWindow: InfoWindow(
            title: state.locations[i].name,
            snippet: state.locations[i].desc,
          ),
        ));
      }
    }
    return apiMarkers;
  }
}
