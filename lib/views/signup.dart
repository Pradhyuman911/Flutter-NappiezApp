import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'home.dart';
import 'login2.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  String uuid = '1';
  bool _isLoading = false;

  void validate() {
    if (formKey.currentState.validate()) {
      print('Validated');
    } else {
      print('Not Validate');
      print(_emailController);
    }
  }

  String validatePass(value) {
    if (value.isEmpty) {
      return "Required *";
    } else if (value.length < 6) {
      return 'Password should be at least 6 chars';
    } else if (value.length > 15) {
      return 'Password should be small than 15 chars';
    } else {
      return null;
    }
  }

  String nameValidate(value) {
    if (value.isEmpty) {
      return "Required *";
    } else {
      return null;
    }
  }

  String validatePhone(value) {
    if (value.isEmpty) {
      return 'Required *';
    } else if (value.length < 10) {
      return 'Phone No. Must be of 10 digits';
    } else {
      return null;
    }
  }

  Future signUp(
      String name, String email, String pass, String phone, String uuid) async {
    String url = 'http://firstchoice.net.in/api/user/userregister';

    final response = await http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'email': email,
      "password": pass,
      'name': name,
      'phone_no': phone,
      'unique_id': uuid
    });
    var data = null;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      setState(() {
        _isLoading:
        false;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginApi()),
            (Route<dynamic> route) => false);
        print('Sign Up successful');
        print(response.body);
      });
    } else {
      Text('Error Occured , Firstly SignUp');
      print(response.body);
    }
  }

  validateSignUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      signUp(_name.text, _emailController.text, _pass.text, _phone.text, uuid);
    } else {
      return Text('Hello');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.purple[900],
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginApi()));
            }),
        title: Text('Sign Up ',
            style: TextStyle(color: Colors.purple[900], fontSize: 22)),
        backgroundColor: Colors.pink[50],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  height: 100,
                  width: 300,
                  image: AssetImage("assets/images/logo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _isLoading
                ? Center(
                    child: Column(
                    children: [
                      Text('Sign Up again'),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                      ),
                    ],
                  ))
                : Column(
                    children: [
                      Form(
                        // ignore: deprecated_member_use
                        autovalidate: true,
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _name,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        labelText: 'User Name'),
                                    validator: nameValidate,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        labelText: 'Email'),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: 'Required *'),
                                      EmailValidator(
                                          errorText: 'Not a valid Email')
                                    ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          labelText: 'Password'),
                                      controller: _pass,
                                      validator: validatePass),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          labelText: ' Phone No.'),
                                      controller: _phone,
                                      validator: validatePhone),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: validateSignUp,
                                      child: Container(
                                        width: 120,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.purple[900]),
                                            color: Colors.pink[50],
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                        child: Center(
                                            child: Text('Sign Up',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    letterSpacing: 1.2,
                                                    color: Colors.purple[900],
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginApi()));
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.purple[900]),
                                            color: Colors.pink[50],
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                        child: Center(
                                            child: Text('Login',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    letterSpacing: 1.2,
                                                    color: Colors.purple[900],
                                                    fontWeight:
                                                        FontWeight.w600))),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
