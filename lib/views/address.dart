import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:nappies_direct/views/payment.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Selection'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Select a delivery address',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('Pradhyuman Soni',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            'Ho.N - 47\n RAMPURA \nNATHDWARA,RAJASTHAN 313301\n India'),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => PaymentPage()));
                            showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                      height: 300,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Card(
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons
                                                          .radio_button_checked),
                                                      onPressed: () {
                                                        showCupertinoModalBottomSheet(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    Container(
                                                                      height:
                                                                          300,
                                                                      // color: Colors
                                                                      //     .pink[50],
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Image(
                                                                            width:
                                                                                150,
                                                                            height:
                                                                                200,
                                                                            image:
                                                                                AssetImage("assets/images/check.gif"),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 20.0),
                                                                            child:
                                                                                Text(
                                                                              'Payment Success\nThank You For Shopping',
                                                                              style: TextStyle(decoration: TextDecoration.none, fontSize: 25, color: Colors.green),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ));
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Text(
                                                          'Pay On Delivery',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Card(
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons
                                                          .radio_button_off),
                                                      onPressed: () {
                                                        showCupertinoModalBottomSheet(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    Container(
                                                                      height:
                                                                          350,
                                                                      // color: Colors
                                                                      //     .pink[50],
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Image(
                                                                            height:
                                                                                200,
                                                                            image:
                                                                                AssetImage("assets/images/success2.gif"),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 22.0),
                                                                            child:
                                                                                Text(
                                                                              'Thank You For Shopping From \n Online mode',
                                                                              style: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 22),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ));
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Text(
                                                          'Online Payment ',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pink[50],
                            ),
                            width: 300,
                            height: 40,
                            child: Align(
                              child: Text(
                                "Deliver to this address",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => PaymentPage()));
                            // showCupertinoModalBottomSheet(
                            //     context: context,
                            //     builder: (context) => Container());
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            width: 300,
                            height: 40,
                            child: Align(
                              child: Text(
                                "Edit Address",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => AddressPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            width: 300,
                            height: 40,
                            child: Align(
                              child: Text(
                                "Add Delivery instruction",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('Pradhyuman Soni',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              ' Ho.N- 07\n GANTAGHAR \n UDAIPUR,RAJASTHAN 313301\n India'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Add a New Address',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Deliver to Multiple Address',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
