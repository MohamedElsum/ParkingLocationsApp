import 'package:breaking_bad_clone/core/app_router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    ParkingLocationsApp(
      appRouter: AppRouter(),
    ),
  );
}

class ParkingLocationsApp extends StatelessWidget {
  final AppRouter appRouter;

  // google map api key
  // AIzaSyAPLb46r66qqhEkyoQZkzvLGVO2y4QtG1s

  const ParkingLocationsApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
