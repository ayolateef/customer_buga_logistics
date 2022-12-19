import 'dart:async';

import 'package:buga_logistics/core/constants/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState(){
    super.initState();
  Timer(const Duration(seconds:2),
      ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginView()
    )
      )
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(

            child: SvgPicture.asset(AppAsset.splashLogo,
            height: 96.0.h,
            width: 152.0.w,
            ),
          ),
        )
    );
  }
}
