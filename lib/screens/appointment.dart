import 'package:flutter/material.dart';
import 'package:lnm/widgets/appoint_heading.dart';
import 'package:lnm/widgets/responsive.dart';

class Appointment extends StatefulWidget {
  Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    final List<String> assets = [
      'assets/images/appointment.jpg',
      'assets/images/account_opening.jpg',
      'assets/images/installing.jpg',
    ];

    final List<String> title = [
      'First Time Appointment' +
          '\n' +
          'Takes 3 days' +
          '\n' +
          'Account opening' +
          '\n' +
          'Instalment of trading platform' +
          '\n' +
          'Plugging of trading' +
          '\n' +
          '**REQUIREMENTS**' +
          '\n' +
          'Laptop' +
          '\n' +
          'Stable power supply' +
          '\n' +
          'Stable data connection' +
          '\n' +
          'Minimum investment capital of \$100' +
          '\n' +
          '**Costs**' +
          '\n' +
          'UGX.299,000',
      //2nd
      'Second Time Appointment' +
          '\n' +
          'Takes 1 day' +
          '\n' +
          'Investment Account topup' +
          '\n' +
          'Any inquiries' +
          '\n' +
          'Emergencies' +
          '\n' +
          '**REQUIREMENTS**' +
          '\n' +
          'UGX. 59,000',
      //3rd
      'Installing Platform'
    ];

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
            Container(
              child: Column(
                children: [
                  ResponsiveWidget.isSmallScreen(context)
                      ? Padding(
                          padding: EdgeInsets.only(top: screenSize.height / 50),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: screenSize.width / 15),
                                ...Iterable<int>.generate(assets.length).map(
                                  (int pageIndex) => Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: screenSize.width / 2.5,
                                            width: screenSize.width / 1.5,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.asset(
                                                assets[pageIndex],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: screenSize.height / 70,
                                            ),
                                            child: Text(
                                              title[pageIndex],
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .primaryTextTheme
                                                    .subtitle1!
                                                    .color,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: screenSize.width / 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height * 0.06,
                            left: screenSize.width / 15,
                            right: screenSize.width / 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...Iterable<int>.generate(assets.length).map(
                                (int pageIndex) => Column(
                                  children: [
                                    SizedBox(
                                      height: screenSize.width / 6,
                                      width: screenSize.width / 3.8,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.asset(
                                          assets[pageIndex],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: screenSize.height / 70,
                                      ),
                                      child: Text(
                                        title[pageIndex],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .primaryTextTheme
                                              .subtitle1!
                                              .color,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height / 3,
            ),
            AppointmentHeading(screenSize: screenSize),
          ],
        ),
      ),
    );
  }
}
