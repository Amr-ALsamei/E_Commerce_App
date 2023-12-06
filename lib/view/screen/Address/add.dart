import 'package:e_commerceapp/controller/Address/Add_Controller.dart';
import 'package:e_commerceapp/core/class/handlingdataview.dart';
import 'package:e_commerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    // AddAddressController controllerPage=Get.put(AddAddressController());
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(title: Text("Add new Address"),),
      // floatingActionButton: FloatingActionButton(onPressed: (){},
      //              child: Icon(Icons.add),),
      body: GetBuilder<AddAddressController>(
        builder: (controllerPage) {
          return HandlingDataView(
            statusRequest: controllerPage.statusRequest,
            widget: Column(
              children: [
               if(controllerPage.kGooglePlex!=null)
               
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          GoogleMap(
                                mapType: MapType.normal,
                                markers: controllerPage.markers.toSet(),
                                onTap: (latlng) {
                                  controllerPage.addMarkers(latlng);
                                  
                                },
                                initialCameraPosition:controllerPage.kGooglePlex!,
                                onMapCreated: (GoogleMapController controllermap) {
                                controllerPage.completercontroller!.complete(controllermap);
                                },
                              ),

                    Positioned(
                      bottom: 20,
                      child: Container(
                    
                        child: MaterialButton(
                          minWidth: 200,
                          onPressed: (){
                            controllerPage.goToAddressDetails();
                          },
                          child: Text("Continuoe",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          color: Appcolors.primarycolor,
                          textColor: Colors.white,
                        ),
                      ),
                    )
                        ],
                      ),
                    ),
                    
                  
          
              ],
            ),
          );
        }
      ),
    );
  }
}