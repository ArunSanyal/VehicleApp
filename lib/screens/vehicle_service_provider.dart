import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vehicleapp/screens/vehicle_box_helper.dart';
import 'package:vehicleapp/screens/vehicle_model.dart';

class VehicleServiceProvider extends ChangeNotifier {
  List<VehicleModel> carModelList = [];
  List<VehicleModel> bikeModelList = [];

  void addCar(VehicleModel vehicleModel) async {
    Box<VehicleModel> vehicleBox = await VehicleBoxHelperClass.openCarBox();
    await vehicleBox.put(vehicleModel.vehicleNumber, vehicleModel);
    print(vehicleModel);
    notifyListeners();
  }

  void getCars() async {
    Box<VehicleModel> vehicleBox = await VehicleBoxHelperClass.openCarBox();
    VehicleModel? vehicleModel = vehicleBox.get('cars');
    carModelList = vehicleBox.values.toList();
    print(carModelList);
    notifyListeners();
  }

  void deleteCar(VehicleModel vehicleModel) async {
    Box<VehicleModel> vehicleBox = await VehicleBoxHelperClass.openCarBox();
    await vehicleBox.delete(vehicleModel.vehicleNumber);
    notifyListeners();
  }

  void addBike(VehicleModel vehicleModel) async {
    Box<VehicleModel> vehicleBox = await VehicleBoxHelperClass.openBikeBox();
    await vehicleBox.put(vehicleModel.vehicleNumber, vehicleModel);
    print(vehicleModel);
    notifyListeners();
  }

  void getBikes() async {
    Box<VehicleModel> vehicleBox = await VehicleBoxHelperClass.openBikeBox();
    VehicleModel? vehicleModel = vehicleBox.get('bikes');
    bikeModelList = vehicleBox.values.toList();
    print(bikeModelList);
    notifyListeners();
  }

  void deleteBike(VehicleModel vehicleModel) async {
    Box<VehicleModel> vehicleBox = await VehicleBoxHelperClass.openBikeBox();
    await vehicleBox.delete(vehicleModel.vehicleNumber);
    notifyListeners();
  }
}
