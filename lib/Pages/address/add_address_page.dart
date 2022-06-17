import 'package:flutter/material.dart';
import 'package:food_delivery/Utils/bigText.dart';
import 'package:food_delivery/Utils/color_utils.dart';
import 'package:food_delivery/data/controllers/location_controller.dart';
import 'package:food_delivery/widgets/app_text_fill.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {

  TextEditingController _addressController = TextEditingController();
  TextEditingController _contactPersonName = TextEditingController();
  TextEditingController _contactPersonNumber = TextEditingController();
  CameraPosition _cameraPosition = const CameraPosition(
    zoom: 17,
    target: LatLng(
      45.51563,
      -122.677433,
    ),
  );

  late LatLng _initialPosition= const LatLng(
    45.51563,
    -122.677433,
  );

  @override
  void initState(){
    super.initState();
    if(Get.find<LocationController>().addressList.isNotEmpty){
      _cameraPosition = CameraPosition(target: LatLng(
        double.parse(Get.find<LocationController>().getAddress['latitude']),
        double.parse(Get.find<LocationController>().getAddress['longitude']),
      ));

      _initialPosition = LatLng(
        double.parse(Get.find<LocationController>().getAddress['latitude']),
        double.parse(Get.find<LocationController>().getAddress['longitude']),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Page"),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<LocationController>(builder: (locationController){
        _addressController.text = '${locationController.placeMark.name ?? ''}'
        '${locationController.placeMark.locality?? ''}'
        '${locationController.placeMark.postalCode?? ''}'
        '${locationController.placeMark.country?? ''}';
        print(_addressController.text);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 5
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  )
              ),
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _initialPosition,
                      zoom: 17,
                    ),
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    indoorViewEnabled: true,
                    mapToolbarEnabled: false,
                    onCameraIdle: (){
                      locationController.updatePosition(_cameraPosition,true);
                    },
                    onCameraMove: ((position)=> _cameraPosition = position),
                    onMapCreated: (GoogleMapController controller){
                      locationController.setMapController(controller);
                    },
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20,),
            BigText(text: "Delivery address"),
            const SizedBox(height: 20,),
            AppTextField(textController: _addressController, hintText: 'Your adddress', icon: Icons.map),

          ],
        );
      }
      )
    );
  }
}
