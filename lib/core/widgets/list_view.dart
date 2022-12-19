import 'package:buga_logistics/core/constants/app_asset.dart';
import 'package:buga_logistics/core/constants/colors.dart';
import 'package:buga_logistics/core/constants/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../views/get_quote.dart';
import '../../views/home_page.dart';
import '../model/list_modele.dart';

class DemoListTile extends StatelessWidget {
  List<ListModel> titles = [
    ListModel(
      title: "Get A Quote",
      subtitle: "Find out the estimated price for you to send a package just by inputting the approximate weight of package(s), locations, and so on.",
      bigIcon: AppAsset.deliverPackageIcon,
      backIcon: AppAsset.rightIcon
    ),
    ListModel(
        title: "Track An Order",
        subtitle: "Find out the estimated price for you to send a package just by inputting the approximate weight of package(s), locations, and so on.",
        bigIcon: AppAsset.bigLocationIcon,
        backIcon: AppAsset.rightIcon
    ),
    ListModel(
        title: "Book A Vehicle",
        subtitle: "Find out the estimated price for you to send a package just by inputting the approximate weight of package(s), locations, and so on.",
        bigIcon: AppAsset.truckIcon,
        backIcon: AppAsset.rightIcon
    ),
    ListModel(
        title: "Add A Wallet",
        subtitle: "Find out the estimated price for you to send a package just by inputting the approximate weight of package(s), locations, and so on.",
        bigIcon: AppAsset.bigLocationIcon,
        backIcon: AppAsset.rightIcon
    ),

  ];


   DemoListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index){
          return Container(
            //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
            margin: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
            decoration: BoxDecoration(
              color: ColorUtils.containerColor,
              borderRadius: BorderRadius.circular(10.0)
            ),
            height: 150.h,
            width: double.infinity,
            child: ListTile(
              leading: SvgPicture.asset(titles[index].bigIcon!),
              title: Container(
                margin: EdgeInsets.only(top: 12.0),
                child: Text(titles[index].title!, style: CustomTextStyle.kTitleTextStyle,
                ),
              ),
              subtitle: Container(
                  margin: EdgeInsets.only(top: 6.0),
                  child: Text(titles[index].subtitle!,
                      style: CustomTextStyle.kListTextStyle,
                    textScaleFactor: 1.08,
                  )),
              trailing: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GetQuotePage()));
                  },
                  child: SvgPicture.asset(AppAsset.rightIcon)),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return SizedBox(height: 10.0.h,);
        },
        itemCount: titles.length);
  }
}
