import 'package:breaking_bad_clone/business_logic/cubit/parking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddLocation extends StatefulWidget {
  final ParkingCubit parkingCubit;

  const AddLocation({Key? key, required this.parkingCubit}) : super(key: key);

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  double rate = 0;

  // late ParkingCubit _parkingCubit;

  Set<Marker> mark = {};

  @override
  void dispose() {
    latController.dispose();
    longController.dispose();
    nameController.dispose();
    desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: mark,
            initialCameraPosition: const CameraPosition(
              target: LatLng(30.033333, 31.233334),
              zoom: 15,
            ),
            onTap: (newLocation) {
              setState(() {
                mark.clear();
                mark.add(
                  Marker(
                    markerId: const MarkerId('new Location'),
                    position: newLocation,
                  ),
                );
                latController.text = newLocation.latitude.toString();
                longController.text = newLocation.longitude.toString();
              });
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: 450,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Add New Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    child: TextField(
                      controller: latController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 25, top: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Latitude',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    child: TextField(
                      controller: longController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 25, top: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Longitude',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 25, top: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Name',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    child: TextField(
                      controller: desController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 25, top: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Description',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      children: [
                        const Text(
                          'Ranking : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        RatingBar(
                          initialRating: 3,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Image.asset('assets/images/starfull.png'),
                            half: Image.asset('assets/images/star.png'),
                            empty: Image.asset('assets/images/star.png'),
                          ),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          onRatingUpdate: (rating) {
                            setState(() {
                              rate = rating;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 120,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.parkingCubit.addLocation(
                          latController.text,
                          longController.text,
                          nameController.text,
                          desController.text,
                          rate.toString(),
                        );
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/", (r) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        elevation: 5,
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
