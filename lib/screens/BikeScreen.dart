import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicleapp/screens/vehicle_service_provider.dart';

import 'VehicleCard.dart';

class BikeScreen extends StatefulWidget {
  const BikeScreen({super.key});

  @override
  State<BikeScreen> createState() => _BikeScreenState();
}

class _BikeScreenState extends State<BikeScreen> {
  var provider;
  @override
  void initState() {
    provider = Provider.of<VehicleServiceProvider>(context, listen: false);
    provider.getBikes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleServiceProvider>(
        builder: (context, VehicleServiceProvider, widget) {
      if (VehicleServiceProvider.bikeModelList.isEmpty) {
        return const Center(
          child: Text("No Bikes found"),
        );
      }
      return ListView.builder(
          itemCount: VehicleServiceProvider.bikeModelList.length,
          itemBuilder: (context, index) {
            return VehicleCard(
              vehicleNumber:
                  VehicleServiceProvider.bikeModelList[index].vehicleNumber,
              vehicleBrand:
                  VehicleServiceProvider.bikeModelList[index].vehicleBrand,
              vehicleType:
                  VehicleServiceProvider.bikeModelList[index].vehicleType,
              fuelType: VehicleServiceProvider.bikeModelList[index].fuelType,
            );
          });
    });
  }
}
