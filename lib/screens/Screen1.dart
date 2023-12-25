import 'package:flutter/material.dart';
import 'package:vehicleapp/screens/Screen2.dart';
import 'package:vehicleapp/screens/vehicle_service_provider.dart';
import 'package:provider/provider.dart';
import 'package:vehicleapp/screens/CarScreen.dart';
import 'package:vehicleapp/screens/BikeScreen.dart';

class Screen1 extends StatefulWidget {
  final int selectedPage;
  const Screen1({super.key, required this.selectedPage});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    print("Screen Init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const List<Tab> tabs = <Tab>[
      Tab(text: 'Bike'),
      Tab(text: 'Car'),
    ];
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: widget.selectedPage,
        length: 2,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text('  Vehicle Details'),
              ),
              backgroundColor: Colors.deepPurple.shade100,
              bottom: const TabBar(
                tabs: tabs,
              ),
            ),
            body: TabBarView(
              children: [
                BikeScreen(),
                CarScreen(),
              ],
            ),
            floatingActionButton: SizedBox(
              width: 380,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Screen2(
                        vehicleType: '',
                        vehicleBrand: '',
                        vehicleNumber: '',
                        fuelType: '',
                        updateFlag: false,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.add),
                label: Text('Add Vehicle'),
              ),
            ),
          );
        }),
      ),
    );
  }
}
