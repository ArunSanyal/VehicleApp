import 'package:hive/hive.dart';
part 'vehicle_model.g.dart';

@HiveType(typeId: 0)
class VehicleModel {
  @HiveField(0)
  late String vehicleNumber;

  @HiveField(1)
  late String vehicleBrand;

  @HiveField(2)
  late String vehicleType;

  @HiveField(3)
  late String fuelType;

  VehicleModel(
      this.vehicleNumber, this.vehicleBrand, this.vehicleType, this.fuelType);
}
