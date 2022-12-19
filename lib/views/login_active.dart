import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_asset.dart';
import '../core/constants/colors.dart';
import '../core/constants/textStyle.dart';
import '../core/widgets/button.dart';
import '../core/widgets/checkbox.dart';
import '../core/widgets/text_field.dart';
import 'home_page.dart';

class LoginActive extends StatefulWidget {
  const LoginActive({Key? key}) : super(key: key);

  @override
  State<LoginActive> createState() => _LoginActiveState();
}

class _LoginActiveState extends State<LoginActive> {
  late bool _passwordVisible;
  bool? _isChecked = false;
  final _myController = TextEditingController();



  @override
  void initState(){
    super.initState();
    _myController.text = '';
    _myController.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 8.0),
                    child: Text('Welcome Back!', style: CustomTextStyle.kBoldTextStyle)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Log in to your account to continue...',
                    style: CustomTextStyle.kTextDescription,),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 8.0),
                  child: const SignUpTextField(
                    minWidth: double.infinity,
                    label: 'Email Address',
                    hintText: 'johnisdoe@me.com',
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: SignUpTextField(
                    minWidth: double.infinity,
                    label: 'Password',
                    hintText: 'password2022',
                    obscureText: _passwordVisible,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: IconButton(
                        iconSize: 24.sp,
                        onPressed: () {
                          _passwordVisible = !_passwordVisible;
                          setState(() {});
                        },
                        icon: Icon(
                            _passwordVisible ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorUtils.primaryColor
                        )

                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 18.0, 50.0),
                  child: Row(
                    children: [
                      BuildCheckbox(
                        value: _isChecked,
                        changed: (newBool){
                          setState(() {
                            _isChecked = newBool;
                          });
                        },

                      ),
                      Text('Remember me', style: CustomTextStyle.kTermsTextStyle),
                      Spacer(),
                      Text('Forgot Password?', style: CustomTextStyle.kTermsTextStyle2,)
                    ],
                  ),
                ),

                Center(
                  child: CustomButton(
                    onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                colour: (_myController.text.isEmpty)? ColorUtils.buttonColor2 : ColorUtils.buttonColor,
                    text: 'Log in',
                    style: CustomTextStyle.kButtonTextStyle,
                  ),
                ),

                Container(
                  //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                  margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 50.0),
                  child: Center(
                    child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: CustomTextStyle.kTermsTextStyle),
                              TextSpan(text: 'Sign Up',
                                  style: CustomTextStyle.ktermsTextStyle3),
                            ]
                        )),
                  ),
                ),

                Container(
                  //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                  margin: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 50.0),
                  child: Row(
                    children:  [
                      const Expanded(child: Divider()),
                      Text('or sign up with', style: CustomTextStyle.kHintTextStyle,),
                      const Expanded(child: Divider())
                    ],
                  ),
                ),

                Container(
                  //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                  margin: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          image: AppAsset.facebookIcon,
                          text: 'Facebook',style: CustomTextStyle.kButtonTextStyle2,
                          colour: ColorUtils.primaryWhiteColor,
                          borderSide: Border.all(
                              color: ColorUtils.primaryColor
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0.sp,),
                      Expanded(
                        child: CustomButton(
                          image: AppAsset.googleIcon,
                          text: 'Google',style: CustomTextStyle.kButtonTextStyle2,
                          colour: ColorUtils.primaryWhiteColor,
                          borderSide: Border.all(
                              color: ColorUtils.primaryColor
                          ),
                        ),
                      )
                    ],
                  ),
                )

              ],),
          ),
        )
    );
  }
}
