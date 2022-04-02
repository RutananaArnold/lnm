import 'package:flutter/material.dart';

class GetInfor extends StatefulWidget {
  GetInfor({Key? key}) : super(key: key);

  @override
  State<GetInfor> createState() => _GetInforState();
}

class _GetInforState extends State<GetInfor> {
  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.45,
                    width: screenSize.width,
                    child: Image.asset(
                      'assets/images/top_pic.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container( ),
            // SizedBox(
            //   height: screenSize.height / 5,
            // ),
            // AppointmentHeading(screenSize: screenSize),
          ],
        ),
      ),
    );
  }
}