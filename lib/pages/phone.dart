import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:flutter/foundation.dart';


class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  var phone="";

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: vPrimaryColor,
        padding: const EdgeInsets.only(left: 25, right: 25, top: 70,bottom: 20),
        child:Expanded(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.grid_view, color: vPrimaryLightColor, size: 44),
                SizedBox(height: 5,width: 20,),
                Text(
                  "Vaainco",
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w900,
                    color: vPrimaryLightColor,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
               children:[
                 Text(
                   "Shopping made seamless \nScan skip and go!",
                   style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold,
                   ),
                   textAlign: TextAlign.start,
                 ),
               ],

            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                    Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          // keyboardType: TextInputType.phone,

                          controller: countryController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,

                          ),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                       Expanded(
                        child: TextField(

                          keyboardType: TextInputType.phone,
                          onChanged: (value){
                            phone=value;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter phone number",
                          ),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    border:
                    Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${countryController.text+phone}',

                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          MyPhone.verify = verificationId;
                          Navigator.pushNamed(context, 'verify');

                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                      debugPrint('movieTitle: ${countryController.text+phone}');

                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: vPrimaryColor,
                          fontFamily: 'Poppins'
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 40),

            const SizedBox(
              height:70,
            ),


           const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Text(
                "By continuing, you agree to our \nTerms of Service & Privacy Policy",
                style: TextStyle(
                  color: vPrimaryLightColor,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),



        ],
      ),
        ),
      ),
    );
  }
}
