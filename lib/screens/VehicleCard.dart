import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicleapp/screens/vehicle_model.dart';
import 'package:vehicleapp/screens/vehicle_service_provider.dart';

import 'Screen1.dart';
import 'Screen2.dart';

class VehicleCard extends StatefulWidget {
  final String vehicleNumber;
  final String vehicleBrand;
  final String vehicleType;
  final String fuelType;
  const VehicleCard(
      {super.key,
      required this.vehicleNumber,
      required this.vehicleBrand,
      required this.vehicleType,
      required this.fuelType});

  @override
  State<VehicleCard> createState() => _VehicleCardState();
}

class _VehicleCardState extends State<VehicleCard> {
  var provider;
  @override
  void initState() {
    provider = Provider.of<VehicleServiceProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.vehicleNumber,
                    style: const TextStyle(
                      fontFamily: 'RussoOne',
                      color: Colors.black,
                      fontSize: 30,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Screen2(
                                        vehicleType: widget.vehicleType,
                                        vehicleBrand: widget.vehicleBrand,
                                        vehicleNumber: widget.vehicleNumber,
                                        fuelType: widget.fuelType,
                                        updateFlag: true,
                                      )));
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.deepPurple,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _dialogBuilder(
                              context,
                              widget.vehicleNumber,
                              widget.vehicleBrand,
                              widget.vehicleType,
                              widget.fuelType,
                              provider);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Brand: ${widget.vehicleBrand}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Fuel Type: ${widget.fuelType}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Vehicle Type: ${widget.vehicleType}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, vehicleNumber, vehicleBrand,
      vehicleType, fuelType, provider) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'Are you sure you want to delete this entry?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Delete'),
              onPressed: () {
                var model = VehicleModel(
                    vehicleNumber, vehicleBrand, vehicleType, fuelType);
                if (vehicleType == 'Bike') {
                  provider.deleteBike(model);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Screen1(
                                selectedPage: 0,
                              )));
                } else if (vehicleType == 'Car') {
                  provider.deleteCar(model);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Screen1(
                                selectedPage: 1,
                              )));
                }
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
