import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:vehicleapp/screens/Screen1.dart';
import 'package:vehicleapp/screens/vehicle_model.dart';
import 'package:vehicleapp/screens/vehicle_box_helper.dart';
import 'package:vehicleapp/screens/vehicle_service_provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(VehicleModelAdapter());
  VehicleBoxHelperClass.openCarBox();
  VehicleBoxHelperClass.openBikeBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VehicleServiceProvider>(
      create: (context) => VehicleServiceProvider(),
      child: const MaterialApp(
        home: Screen1(selectedPage: 0),
      ),
    );
  }
}
