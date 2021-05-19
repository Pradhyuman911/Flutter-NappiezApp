import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
  String message = "";
  String email = "";
  String phone = "";

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
    } else if (value.length < 10 || value.length > 10) {
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
    data = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginApi()),
          (Route<dynamic> route) => false);
      print('Sign Up successful');
      print(response.body);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String message = data['message'];
      String email = data['errors']['email'][0];
      String phone = data['errors']['phone_no'][0];
      prefs.setString('message', message);
      prefs.setString('email', email);
      prefs.setString('phone', phone);
      print(email);
      print(phone);
      print(response.body);
      print(response.statusCode);
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<String> getError() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    message = prefs.getString('message');
    email = prefs.getString('email');
    phone = prefs.getString('phone');
    return updateError(message, email, phone);
  }

  validateSignUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      signUp(_name.text, _emailController.text, _pass.text, _phone.text, uuid);
    } else {
      setState(() {
        _isLoading = false;
      });
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
                      Text(
                        'Sign Up again',
                        style: TextStyle(
                          color: Colors.redAccent[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      FutureBuilder(
                        future: getError(),
                        initialData: "First Login ...",
                        builder: (BuildContext context, text) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  message ?? 'error',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  email ?? 'email',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  phone ?? 'number',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                      ),
                      CircularProgressIndicator(),
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
                                      labelText: 'User Name',
                                      icon: new Icon(Icons.person),
                                    ),
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
                                      labelText: 'Email',
                                      icon: new Icon(Icons.email),
                                    ),
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
                                        icon: new Icon(Icons.vpn_key),
                                        labelText: 'Password',
                                      ),
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
                                          icon: new Icon(Icons.phone_android),
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

  updateError(String message, String email, String phone) async {
    setState(() {
      this.message = message;
      this.email = email;
      this.phone = phone;
    });
  }
}
