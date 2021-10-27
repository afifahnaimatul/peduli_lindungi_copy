import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';
import 'package:peduli_lindungi_copy/templates/app_size.dart';
import 'package:peduli_lindungi_copy/pages/dashboard/dashboard_tab_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                color: AppColor.primaryColor,
                child: buildTabBar(),
              ),
              Expanded(
                child: TabBarView(children: [
                  Icon(Icons.alarm),
                  DashboardTabView(),
                  // Icon(Icons.alarm),
                  // homeView(),
                  Icon(Icons.alarm),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildTabBar() => TabBar(
        unselectedLabelColor: AppColor.whiteColor,
        labelColor: AppColor.primaryColor,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.whiteColor,
        ),
        tabs: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.alarm),
              SizedBox(width: 8),
              Tab(
                text: 'Statistik',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home),
              SizedBox(width: 8),
              Tab(
                text: 'Home',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              SizedBox(width: 8),
              Tab(
                text: 'Akun',
              ),
            ],
          ),
        ],
      );

  homeView() => Container(
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      );
}
