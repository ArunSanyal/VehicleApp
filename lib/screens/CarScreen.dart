import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicleapp/screens/vehicle_service_provider.dart';

import 'VehicleCard.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  var provider;
  @override
  void initState() {
    provider = Provider.of<VehicleServiceProvider>(context, listen: false);
    provider.getCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleServiceProvider>(
        builder: (context, VehicleServiceProvider, widget) {
      if (VehicleServiceProvider.carModelList.isEmpty) {
        return const Center(
          child: Text("No Cars found"),
        );
      }
      return ListView.builder(
          itemCount: VehicleServiceProvider.carModelList.length,
          itemBuilder: (context, index) {
            return VehicleCard(
              vehicleNumber:
                  VehicleServiceProvider.carModelList[index].vehicleNumber,
              vehicleBrand:
                  VehicleServiceProvider.carModelList[index].vehicleBrand,
              vehicleType:
                  VehicleServiceProvider.carModelList[index].vehicleType,
              fuelType: VehicleServiceProvider.carModelList[index].fuelType,
            );
          });
    });
  }
}
