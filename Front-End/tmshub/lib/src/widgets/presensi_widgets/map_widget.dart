// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final LatLng centerPoint = LatLng(-6.88055, 107.53841);
  

  // Radius dalam meter (20 km)
  final double radius = 30;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319,
      height: 215,
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(-6.88055, 107.53841), // Initial map coordinates
          zoom: 17, // Initial zoom level
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: LatLng(-6.88055, 107.53841), // Koordinat marker
                builder: (BuildContext context) {
                  return Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40.0,
                    ),
                  );
                },
              ),
            ],
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: centerPoint,
                color: Colors.blue.withOpacity(0.5), // Warna lingkaran
                useRadiusInMeter: true,
                radius: radius // Radius dalam meter
              ),
            ],
          )
        ],
      ),
    );
  }
}
