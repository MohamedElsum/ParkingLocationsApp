import 'package:breaking_bad_clone/business_logic/cubit/parking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
            backgroundColor: Colors.indigo,
            title: Text('Parking Locations'),
          ),
          body: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 700,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(30.033333, 31.233334),
                    zoom: 15,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                    onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    elevation: 5,
                  ),
                    child: Text('Add Parking Location'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
