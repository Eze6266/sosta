import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:sosta/constant.dart';

import '../../dashboard/process/offer.dart';
import '../../dashboard/process/pricing.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final passwordController = TextEditingController();
  bool show = true;
  bool showOffer = false;
  bool showBooking = false;
  bool showCancel = false;

  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBdaW-yk_feQdl3k7Dz4x4CuXEzsQg5Ay4', // Your Google Map Key
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();

    Future.delayed(Duration(seconds: 0)).then((_) {
      showModalBottomSheet(
          context: context,
          enableDrag: true,
          isDismissible: false,
          isScrollControlled: true,
          useRootNavigator: true,
          builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      child: Padding(
                          padding: EdgeInsets.only(
                            top: 42,
                            bottom: 42,
                            right: 32,
                            left: 32,
                          ),
                          child: Column(
                            children: [
                              PricingWidget(),
                              const SizedBox(
                                height: 30,
                              ),
                              OfferWidget(),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Not comfortable with the price?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: tertiary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              OfferWidget(
                                text: 'Offer your price',
                                color: primary,
                                borderColor: primary,
                                bgColor: Colors.white,
                                show: true,
                              ),
                            ],
                          )))
                ],
              ));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: const Text(
              '',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            shadowColor: null,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () => context.go('/dashboard'),
              // color: const Color.fromARGB(255, 109, 105, 105),
              color: Colors.white,
              icon: Image.network(
                  'https://res.cloudinary.com/kingstech/image/upload/v1666210470/arrow_ockvre.png'),
              //replace with our own icon data.
            )),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: sourceLocation,
                zoom: 13.5,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId("source"),
                  position: sourceLocation,
                ),
                const Marker(
                  markerId: MarkerId("destination"),
                  position: destination,
                ),
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  color: const Color(0xFF7B61FF),
                  width: 6,
                ),
              },
            ),
          ],
        ));
  }
}
