import 'package:breaking_bad_clone/business_logic/cubit/parking_cubit.dart';
import 'package:breaking_bad_clone/presentation/screens/add_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingMapScreen extends StatefulWidget {
  const ParkingMapScreen({Key? key}) : super(key: key);

  @override
  State<ParkingMapScreen> createState() => _ParkingMapScreenState();
}

class _ParkingMapScreenState extends State<ParkingMapScreen> {
  final Set<Marker> _markers = {};
  late ParkingCubit _parkingCubit;

  @override
  void initState() {
    _parkingCubit = BlocProvider.of<ParkingCubit>(context);
    _parkingCubit.getLocationsData();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        const Marker(
          markerId: MarkerId('First Location'),
          position: LatLng(30.033333, 31.233334),
          infoWindow: InfoWindow(
            title: 'Cairo',
            snippet: 'Parking Location',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Parking Locations'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 700,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: _markers,
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
    );
  }
}
