import 'package:buga_logistics/core/constants/app_asset.dart';
import 'package:buga_logistics/core/constants/colors.dart';
import 'package:buga_logistics/core/constants/textStyle.dart';
import 'package:buga_logistics/core/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/widgets/list_view.dart';
import '../utils/home_page_method.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _navigations = [
    BottomNavigationBarItem(
        activeIcon:SvgPicture.asset(AppAsset.homeIcon),
        label: 'Home',
        icon: SvgPicture.asset(AppAsset.homeIcon, color: ColorUtils.iconColor,)
    ),
    BottomNavigationBarItem(
        activeIcon:SvgPicture.asset(AppAsset.orderIcon, color: ColorUtils.activeIconColor,),
        label: 'Orders',
        icon: SvgPicture.asset(AppAsset.orderIcon, color: ColorUtils.iconColor,)
    ),
    BottomNavigationBarItem(
        activeIcon:SvgPicture.asset(AppAsset.walletIcon, color: ColorUtils.activeIconColor,),
        label: 'Wallet',
        icon: SvgPicture.asset(AppAsset.walletIcon, color: ColorUtils.iconColor,)
    ),
    BottomNavigationBarItem(
        activeIcon:SvgPicture.asset(AppAsset.trackerIcon, color: ColorUtils.activeIconColor,),
        label: 'Tracker',
        icon: SvgPicture.asset(AppAsset.trackerIcon, color: ColorUtils.iconColor,)
    ),
    BottomNavigationBarItem(
        activeIcon:SvgPicture.asset(AppAsset.settingIcon, color: ColorUtils.activeIconColor,),
        label: 'Settings',
        icon: SvgPicture.asset(AppAsset.settingIcon, color: ColorUtils.iconColor,)
    ),
  ];
final _pages =  <Widget> [
  HomePageMethod(),


];
PageController pageViewController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageViewController,
            children: _pages
          ),
        ),


      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorUtils.bottomNavBarColor,
        selectedItemColor: ColorUtils.activeIconColor,
        unselectedItemColor: ColorUtils.iconColor,
        elevation: 2,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _navigations.map((e) {
    return BottomNavigationBarItem(
    activeIcon: e.activeIcon,
    icon: e.icon,
    label: e.label);
    }).toList()
      ),
    );
  }


  void _onItemTapped(int index){
    setState(() {
      pageViewController.jumpToPage(index);
      _selectedIndex = index;
      setState(() {});
    });
  }
}
