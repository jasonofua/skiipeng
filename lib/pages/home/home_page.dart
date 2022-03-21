import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers={};
  LatLng current = LatLng(9.0820, 8.6753);


  void getLocation() async{
    LocationData location = await currentLocation.getLocation();
    current = LatLng(location.latitude!, location.longitude!);
    currentLocation.onLocationChanged.listen((LocationData loc){
      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(markerId: MarkerId('Me'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      });
    });
  }

  @override
  void initState(){
    super.initState();
    setState(() {
      getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(

          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0x4780b4fb),
                            ),
                            width: 100,
                            height: 120,
                            alignment: Alignment.centerLeft,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/dress.png",width: 38,height: 38,),
                                  SizedBox(height: 15,),
                                  Text(
                                    'Fashion',
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(15),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0x47e95353),
                            ),

                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/car.png",width: 38,height: 38,),
                                  SizedBox(height: 15,),
                                  Text(
                                    'Car',
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(15),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0x4766baea),
                            ),

                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/phone.png",width: 38,height: 38,),
                                  SizedBox(height: 15,),
                                  Text(
                                    'Mobile Phone',
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(15),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0x47cb8252),
                            ),

                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/furniture.png",width: 38,height: 38,),
                                  SizedBox(height: 15,),
                                  Text(
                                    'Furniture',
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(15),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0x47ff385c),
                            ),

                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0,top: 15),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/more.png",width: 38,height: 38,),
                                  SizedBox(height: 15,),
                                  Text(
                                    'View More',
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Marchant',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'View More',
                      style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/merchantbackground.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 170,
                            height: 120,
                            alignment: Alignment.centerLeft,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment:Alignment.centerLeft,
                                      child: Image.asset("assets/images/merchantlogo.png",width: 38,height: 38,)),
                                  SizedBox(height: 15,),
                                  Align(
                                    alignment:Alignment.centerLeft,
                                    child: Text(
                                      'Anker offizieller Shop',
                                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/merchantbackground.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 170,
                            height: 120,
                            alignment: Alignment.centerLeft,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment:Alignment.centerLeft,
                                      child: Image.asset("assets/images/merchantlogo.png",width: 38,height: 38,)),
                                  SizedBox(height: 15,),
                                  Align(
                                    alignment:Alignment.centerLeft,
                                    child: Text(
                                      'Anker offizieller Shop',
                                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/merchantbackground.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 170,
                            height: 120,
                            alignment: Alignment.centerLeft,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment:Alignment.centerLeft,
                                      child: Image.asset("assets/images/merchantlogo.png",width: 38,height: 38,)),
                                  SizedBox(height: 15,),
                                  Align(
                                    alignment:Alignment.centerLeft,
                                    child: Text(
                                      'Anker offizieller Shop',
                                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 20,top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Merchant nearby',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                child: Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  child:GoogleMap(
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    initialCameraPosition:CameraPosition(
                      target: LatLng(current.latitude, current.longitude),
                      zoom: 15.0,
                    ),
                    onMapCreated: (GoogleMapController controller){
                      _controller = controller;
                    },
                    markers: _markers,
                  ) ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 20,top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product of the day',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'View More',
                      style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/product.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 170,
                            height: 120,
                            alignment: Alignment.centerLeft,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                ],
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/product.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 170,
                            height: 120,
                            alignment: Alignment.centerLeft,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                ],
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/product.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 170,
                            height: 120,
                            alignment: Alignment.centerLeft,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 12,top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [


                                ],
                              ),
                            )),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
