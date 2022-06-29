import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:task_1/shared/my_text_field.dart';

import '../../shared/navigation_function.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var number = PhoneNumber(phoneNumber: "01147880178", dialCode: "EG" , isoCode: "+20");
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset('assets/login.jpeg'),
                  ),
                  const Text(
                    'Welcomt At Algoriza',
                    style: TextStyle(fontSize: 14,color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#7E57C2')
                        ),
                      ),
                      const Spacer(),
                      TextButton(onPressed: (){} , child:const  Text("Help")),
                    ]
                  ),
                  const SizedBox(height: 10),
                  MyTextFormFiels(
                    controller: emailController, 
                    label: 'Joe@Doe.com',
                    validname: "Email", 
                    inputType: TextInputType.emailAddress, 
                    function: (){}, 
                    obsecure: false,
                    border: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#7E57C2")) )
                  ),
                  const SizedBox(height: 10),
                  InternationalPhoneNumberInput(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number is not registered';
                      } 
                      return null;
                    },
                    onInputChanged: (PhoneNumber number) { },
                    selectorConfig: const SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
                    initialValue: number,
                    countries: const ["EG" , "UA"],
                    textFieldController: mobileController,
                    formatInput: false,
                    keyboardType:const TextInputType.numberWithOptions(signed: true, decimal: true),
                    inputBorder: const OutlineInputBorder(),
                    spaceBetweenSelectorAndTextField: 0,
                  ),
                  const SizedBox(height: 10),
                  MyTextFormFiels(
                    controller: passWordController, 
                    label: 'Password',
                    validname: "Password", 
                    inputType: TextInputType.visiblePassword, 
                    function: (){}, 
                    obsecure: _isHidden,
                    border: OutlineInputBorder(borderSide: BorderSide(color: HexColor("#7E57C2")) ),
                    sufficicon: IconButton(
                      icon: _isHidden ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                        primary: HexColor("#7E57C2")
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) { }
                      },
                      child: const Text('Sign-In'),
                    )
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children:[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: HexColor("#7E57C2"),
                            height: 36,
                          )
                        ),
                      ),
                      const Text("OR"),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: HexColor("#7E57C2"),
                            height: 36,
                          )
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 20), 
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.google,
                    borderRadius: 10,
                    backgroundColor: Colors.white,
                    disabledBackgroundColor: Colors.white,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20), 
                  Center(
                    child: RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Has an account? ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Sign-In Here',
                              style: TextStyle(
                                color: HexColor("#7E57C2"),
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () { 
                                navigateFinalTo(context, LoginScreen());
                              }
                            ),
                          ]
                    ),
                    )
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center ,
                      text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'By Register Your Account You Accept to ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: ' Privacy Policy',
                              style: TextStyle(
                                color: HexColor("#7E57C2"),
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () { }
                            ),
                          ]
                    ),
                    )
                  ),
                ]
              ),
            )
          )
        ),
      );
  }
}