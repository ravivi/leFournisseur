import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/profil_controller.dart';



class ProfilView extends StatelessWidget {
    final ProfilController _profilController = Get.put(ProfilController());
    bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffC71617),
          elevation: 0,
          
          actions: [
            IconButton(
                onPressed: () {
                  // Get.to(()=>ProfilPage(),transition: Transition.fade);
                  // Get.to(()=>ProfilPage(),transition: Transition.fade);
                },
                icon: Icon(Icons.edit)),
          ],
          title: Text(
            "profil",
          ),
         
        ),
        body: Obx(
       () =>LoadingOverlay (
        isLoading: _profilController.isLoading.value,
        opacity: 0.5,
        color: Colors.white,
        progressIndicator: CircularProgressIndicator(),
       child:
       
       SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            image: DecorationImage(
                              image:  NetworkImage(
                                  _profilController.user.value.photo.toString()),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        title: Text(
                          "${_profilController.user.value.firstname} ${_profilController.user.value.lastname}",
                          style: TextStyle(
                              fontSize: 20, color: Color(0xFFFF0c1979)),
                        ),
                        subtitle: Text("${_profilController.user.value.telephone}"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ListTile(
                        leading: Icon(
                          Icons.camera_alt_outlined,
                          size: 22,
                          color: Colors.black,
                        ),
                        title: Text("Choisir une photo"),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Text("Code client"),
                        subtitle: Text("${_profilController.user.value.code}"),
                      ),
                      ListTile(
                        title: Text("Type"),
                        subtitle: Text("Entreprise"),
                      ),
                      ListTile(
                        title: Text("Contact"),
                        subtitle: Text("${_profilController.user.value.email}"),
                      ),
                      ListTile(
                        title: Text("Pays"),
                        subtitle: Text("Côte d'Ivoire"),
                      ),
                      ListTile(
                        title: Text("Adresse"),
                        subtitle: Text("${_profilController.user.value.adresse}"),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 160,top: 20),
                      //   alignment: Alignment.center,
                      //   height: 40,
                      //   width: 80,
                      //   decoration: BoxDecoration(
                      //     color: Colors.orange,
                      //     borderRadius: BorderRadius.circular(5),
                      //   ),
                      //   child: Text("Editer",style: TextStyle(color: Colors.white),),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
             ),
        ));
  
  }
}
