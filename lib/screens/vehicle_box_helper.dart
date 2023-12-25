import 'package:hive/hive.dart';
import 'package:vehicleapp/screens/vehicle_model.dart';

class VehicleBoxHelperClass{
  static final VehicleBoxHelperClass boxRepoHive = VehicleBoxHelperClass._internal();
  factory VehicleBoxHelperClass() {
    return boxRepoHive;
  }
  VehicleBoxHelperClass._internal();

  static Future<Box<VehicleModel>> openCarBox() => Hive.openBox<VehicleModel>('cars');

  static Future<Box<VehicleModel>> openBikeBox() => Hive.openBox<VehicleModel>('bikes');

  static Box<VehicleModel> getCarBox() => Hive.box<VehicleModel>('cars');

  static Box<VehicleModel> getBikeBox() => Hive.box<VehicleModel>('bikes');
}