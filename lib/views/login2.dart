import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:nappies_direct/views/home.dart';
import 'package:nappies_direct/views/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi extends StatefulWidget {
  @override
  _LoginApiState createState() => _LoginApiState();
}

class _LoginApiState extends State<LoginApi> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String uuid = '1';
  bool _isLoading = false;
  String message = "";

  void validate() {
    if (formKey.currentState.validate()) {
      print('Validated');
    } else {
      print('Not Validate');
    }
  }

  String validatePass(value) {
    if (value.isEmpty) {
      return "Required *";
    } else if (value.length < 8) {
      return 'Password should be at least 8 chars';
    } else if (value.length > 15) {
      return 'Password should be small than 15 chars';
    } else {
      return null;
    }
  }

  validateLogin() async {
    if (formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await signIn(emailController.text, passController.text, uuid);
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future signIn(String email, String password, String uuid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = "http://firstchoice.net.in/api/user/login";
    // ignore: avoid_init_to_null
    var data = null;
    final response = await http.post(url,
        headers: {'Accept': "application/json"},
        body: {'email': email, 'password': password, 'unique_id': uuid});
    data = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });
      print('login successfull');
      print(response.body);
      String name = data['user']['name'];
      String email = data['user']['email'];
      String phone = data["user"]['phone_no'];
      String token = data['token']['token'];
      print(token);
      prefs.setString('email', email);
      prefs.setString('name', name);
      prefs.setString('phone_no', phone);
      prefs.setString('token', token);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          (Route<dynamic> route) => false);
    } else {
      String message = data['message'];
      prefs.setString('message', message);
      print(response.body);
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<String> getError() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    message = prefs.getString('message');
    return updateError(message);
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
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
        title: Text('Login ',
            style: TextStyle(color: Colors.purple[900], fontSize: 22)),
        backgroundColor: Colors.pink[50],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 100,
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
                        CircularProgressIndicator(),
                        Text('Login Again \n Check Required Fields again ',
                            style: TextStyle(
                                color: Colors.purple[900], fontSize: 22)),
                        FutureBuilder(
                          future: getError(),
                          initialData: "First Login ...",
                          builder: (BuildContext context, text) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    message,
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
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
                                    builder: (context) => LoginApi()));
                          },
                        ),
                      ],
                    ),
                  )
                : Form(
                    // ignore: deprecated_member_use
                    autovalidate: true,
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                icon: new Icon(Icons.email),
                                labelText: 'Email'),
                            controller: emailController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Required *'),
                              EmailValidator(errorText: 'Not a valid Email')
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: 'Password',
                                icon: new Icon(Icons.vpn_key),
                              ),
                              controller: passController,
                              validator: validatePass),
                        ),
                        _buildLoginButton(context),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text('Create an account?',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600)),
                              )),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return InkWell(
      onTap: () {
        validateLogin();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 128.0),
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple[900]),
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(32)),
          child: Center(
              child: Text('Login',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.2,
                      color: Colors.purple[900],
                      fontWeight: FontWeight.w600))),
        ),
      ),
    );
  }

  updateError(String message) async {
    setState(() {
      this.message = message;
    });
  }
}
