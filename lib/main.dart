import 'package:breaking_bad_clone/core/app_router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
