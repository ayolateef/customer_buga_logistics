import 'package:buga_logistics/core/constants/app_asset.dart';
import 'package:buga_logistics/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_gifs/loading_gifs.dart';

import '../core/constants/colors.dart';
import '../core/constants/textStyle.dart';
import '../core/widgets/text_field.dart';

class GetQuotePage extends StatefulWidget {
  const GetQuotePage({Key? key}) : super(key: key);

  @override
  State<GetQuotePage> createState() => _GetQuotePageState();
}

class _GetQuotePageState extends State<GetQuotePage> {

final _myController = TextEditingController();
  bool isLoading = false;

  
  @override
  void initState() {
    super.initState();
    _myController.text = '';
    _myController.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtils.primaryWhiteColor,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: ColorUtils.primaryColor,
          ),
          title: Text(
            'Get A Quote',
            style: CustomTextStyle.kBoldTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                margin: const EdgeInsets.fromLTRB(22.0, 8.0, 20.0, 10.0),
                child: Text(
                  'Fill in the details below to get an estimated price for your package(s)',
                  textScaleFactor: 1.5.sp,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  style: CustomTextStyle.kTextDescription,
                ),
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                margin: const EdgeInsets.fromLTRB(22.0, 6.0, 20.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Location',
                      style: CustomTextStyle.kTextStyle,
                    ),
                    SvgPicture.asset(AppAsset.plusIcon)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 8.0),
                child:SignUpTextField(
                  controller: _myController,
                  minWidth: double.infinity,
                  label: 'Pick-Up Address *',
                  hintText: 'Enter pick-up address',
                  obscureText: false,
                  keyboardType: TextInputType.streetAddress,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 8.0),
                child: SignUpTextField(
                  controller: _myController,
                  minWidth: double.infinity,
                  label: 'Delivery Address *',
                  hintText: 'Enter delivery address',
                  obscureText: false,
                  keyboardType: TextInputType.streetAddress,
                ),
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                margin: const EdgeInsets.fromLTRB(22.0, 6.0, 20.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Package',
                      style: CustomTextStyle.kTextStyle,
                    ),
                    SvgPicture.asset(AppAsset.plusIcon)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 8.0),
                child: SignUpTextField(
                  controller: _myController,
                    minWidth: double.infinity,
                    label: 'Weight *',
                    hintText: 'Enter approximate weight of goods',
                    obscureText: false,
                    keyboardType: TextInputType.number),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Expanded(
                      child: SignUpTextField(
                        controller: _myController,
                          label: 'Dimension',
                          hintText: 'Length',
                          obscureText: false,
                          keyboardType: TextInputType.number),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('by'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: SignUpTextField(
                          controller: _myController,
                          hintText: 'Weight',
                          obscureText: false,
                          keyboardType: TextInputType.number),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('by'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: SignUpTextField(
                        controller: _myController,
                          hintText: 'Height',
                          obscureText: false,
                          keyboardType: TextInputType.number),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 8.0),
                child: SignUpTextField(
                  controller: _myController,
                    minWidth: double.infinity,
                    label: 'Quantity *',
                    hintText: 'Enter value',
                    obscureText: false,
                    keyboardType: TextInputType.number),
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                margin: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 50.0),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.blueGrey,)
                    : CustomButton(
                      colour: (_myController.text.isEmpty)
                            ? ColorUtils.buttonColor2
                            : ColorUtils.buttonColor,
                  onPressed: (){},
                  text: 'Get A Quote',
                  style: CustomTextStyle.kButtonTextStyle,
                ),
              )
            ],
          ),
        ));
  }
  
}
