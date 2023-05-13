import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:pinput/pinput.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        color: vPrimaryColor,
        padding: const EdgeInsets.only(left: 25, right: 25,top:50),
        child : Expanded(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(
                          "OTP \nVerification",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              color: vPrimaryLightColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "OTP has been sent to your number",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color:Colors.white,

                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],

                    ),
                  ]
                ),






                const SizedBox(
                  height: 10,
                ),


                Pinput(
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,

                  showCursor: true,

                  onCompleted: (pin) => print(pin),
                ),
                const SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   width: double.infinity,
                //   height: 45,
                //   child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           primary: Colors.green.shade600,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10))),
                //       onPressed: () {},
                //       child: Text("Verify Phone Number")),
                // ),
                const SizedBox(
                  child: Text(
                    "00:29",
                    style: TextStyle(
                      fontSize: 30,
                      color: vPrimaryLightColor,

                    ),
                    textAlign: TextAlign.justify,

                  ),
                ),

                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                'phone',
                                    (route) => false,
                              );
                            },
                            child: const Text(
                              "Didn't get it?",
                              style: TextStyle(color: Colors.white, ),
                            ))
                      ],
                    ),
                    TextButton(onPressed: (){
                      //  resend otp function
                    }, child: const Text(
                        "Send OTP (SMS)",
                            style: TextStyle(
                              color: Colors.white30,

                            ),
                    ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),

              ],
            ),

//----


        ),

        // alignment: Alignment.topLeft,

      ),
    );
  }
}