import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState()  {
    getThemeStatus();
    reFreshConnect();
    super.initState();
  }

  reFreshConnect(){
    Future.delayed(Duration(seconds: 3), () async {
      final prefs = await SharedPreferences.getInstance();
          var token = prefs.get('token');
          
      if (token!=null) {
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.offAndToNamed(Routes.LOGIN);
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [

            Image.asset("assets/images/Logo-founisseur.png"),
           
            const SpinKitDualRing(
              size: 30,
              color: Color(0xffC71617),
            ),
            Text(
              "Le fournisseur",
              style: TextStyle(
                  color: Color(0xffC71617),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
