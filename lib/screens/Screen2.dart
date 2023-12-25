import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicleapp/screens/constants.dart';
import 'package:vehicleapp/screens/vehicle_model.dart';
import 'package:vehicleapp/screens/vehicle_service_provider.dart';

import 'Screen1.dart';

class Screen2 extends StatefulWidget {
  final String vehicleNumber;
  final String vehicleBrand;
  final String fuelType;
  final String vehicleType;
  final bool updateFlag;
  const Screen2(
      {super.key,
      required this.vehicleNumber,
      required this.vehicleBrand,
      required this.fuelType,
      required this.vehicleType,
      required this.updateFlag});

  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formKey = GlobalKey<FormState>();
  var _selectedVehicle = '';
  var _selectedType = '';
  var _selectedFuel = '';
  final vehicleNumController = TextEditingController();
  var provider;
  @override
  void initState() {
    provider = Provider.of<VehicleServiceProvider>(context, listen: false);
    if (widget.vehicleNumber.isNotEmpty) {
      vehicleNumController.text = widget.vehicleNumber;
    }
    if (widget.vehicleBrand.isNotEmpty) {
      _selectedVehicle = widget.vehicleBrand;
    }
    if (widget.vehicleType.isNotEmpty) {
      _selectedType = widget.vehicleType;
    }
    if (widget.fuelType.isNotEmpty) {
      _selectedFuel = widget.fuelType;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Vehicle Form'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Enter Vehicle Number',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // The validator receives the text that the user has entered.
                    controller: vehicleNumController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      String pattern =
                          r'^[A-Z]{2}[0-9]{2}[A-HJ-NP-Z]{1,2}[0-9]{4}$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Enter Valid Vehicle Number';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter your Vehicle number ',
                        border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Select the vehicle brand',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          )),
                    )),
                DropdownButtonFormField(
                  hint: const Text('Please choose a vehicle brand'),
                  value: _selectedVehicle.isNotEmpty ? _selectedVehicle : null,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  items: Constants.vehicleList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedVehicle = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Select the vehicle type',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          )),
                    )),
                IgnorePointer(
                  ignoring: widget.updateFlag,
                  child: DropdownButtonFormField(
                    hint: const Text('Please choose a vehicle type'),
                    value: _selectedType.isNotEmpty ? _selectedType : null,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    items: Constants.vehicleType.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedType = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Select a fuel type ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          )),
                    )),
                DropdownButtonFormField(
                  hint: const Text('Please choose a fuel type'),
                  value: _selectedFuel.isNotEmpty ? _selectedFuel : null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  items: Constants.fuelType.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFuel = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                new SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedType == 'Bike') {
                        print('Bike');
                      } else if (_selectedType == 'Car') {
                        print('Car');
                      }
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        if (widget.updateFlag == false) {
                          if (_selectedType == 'Bike') {
                            var model = VehicleModel(vehicleNumController.text,
                                _selectedVehicle, _selectedType, _selectedFuel);
                            provider.addBike(model);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Screen1(
                                          selectedPage: 0,
                                        )));
                          } else if (_selectedType == 'Car') {
                            var model = VehicleModel(vehicleNumController.text,
                                _selectedVehicle, _selectedType, _selectedFuel);
                            provider.addCar(model);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Screen1(
                                          selectedPage: 1,
                                        )));
                          }
                        } else if (widget.updateFlag == true) {
                          if (_selectedType == 'Bike') {
                            var model = VehicleModel(vehicleNumController.text,
                                _selectedVehicle, _selectedType, _selectedFuel);
                            provider.addBike(model);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Screen1(
                                          selectedPage: 0,
                                        )));
                          } else if (_selectedType == 'Car') {
                            var model = VehicleModel(vehicleNumController.text,
                                _selectedVehicle, _selectedType, _selectedFuel);
                            provider.addCar(model);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Screen1(
                                          selectedPage: 1,
                                        )));
                          }
                        }

                        print(vehicleNumController.text);
                        print(_selectedVehicle);
                        print(_selectedType);
                        print(_selectedFuel);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
