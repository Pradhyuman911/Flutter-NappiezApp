import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nappies_direct/views/home.dart';
// import 'package:nappies_direct/views/payment.dart';

class AddressPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.purple[900],
              size: 30,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        iconTheme: IconThemeData(
          color: Colors.purple[900],
        ),
        backgroundColor: Colors.pink[50],
        title: Text('Address Selection',
            style: TextStyle(color: Colors.purple[900], fontSize: 22)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Colors.purple[900],
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Select a delivery address',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('Pradhyuman Soni',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Ho.N - 47\nRAMPURA \nNATHDWARA,RAJASTHAN 313301\nIndia'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        showCupertinoModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                  height: size.height * 0.3,
                                  color: Colors.pink[50],
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                                                                      size.height *
                                                                          0.4,
                                                                  // color: Colors
                                                                  //     .pink[50],
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 8.0),
                                                                        child:
                                                                            Image(
                                                                          width:
                                                                              size.width,
                                                                          height:
                                                                              size.height * 0.23,
                                                                          image:
                                                                              AssetImage("assets/images/check.gif"),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 20.0),
                                                                        child:
                                                                            Text(
                                                                          'Payment Success\nThank You For Shopping',
                                                                          style: TextStyle(
                                                                              decoration: TextDecoration.none,
                                                                              fontSize: 25,
                                                                              color: Colors.green),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ));
                                                  },
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Text('Pay On Delivery',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                      Icons.radio_button_off),
                                                  onPressed: () {
                                                    showCupertinoModalBottomSheet(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                Container(
                                                                  height:
                                                                      size.height *
                                                                          0.4,
                                                                  // color: Colors
                                                                  //     .pink[50],
                                                                  child: Column(
                                                                    children: [
                                                                      Image(
                                                                        height: size.height *
                                                                            0.29,
                                                                        image: AssetImage(
                                                                            "assets/images/success2.gif"),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 22.0),
                                                                        child:
                                                                            Text(
                                                                          'Thank You For Shopping From \n Online mode',
                                                                          style: TextStyle(
                                                                              decoration: TextDecoration.none,
                                                                              color: Colors.black,
                                                                              fontSize: 22),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ));
                                                  },
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Text('Online Payment ',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold)),
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
                        margin: EdgeInsets.only(left: 30, right: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink[50],
                        ),
                        width: size.width,
                        height: 40,
                        child: Align(
                          child: Text(
                            "Deliver to this address",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
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
                        margin: EdgeInsets.only(left: 30, right: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        width: size.width,
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
                        margin: EdgeInsets.only(left: 30, right: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        width: size.width,
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('Pradhyuman Soni',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
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
