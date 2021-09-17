import 'package:flutter/material.dart';
import 'package:quotes_app/screens/homeScreen/homePage.dart';
import 'package:quotes_app/screens/loginScreen/registerPage.dart';

class LoginScreen extends StatefulWidget {
  final dataList;
  const LoginScreen({Key? key, this.dataList}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Future _submit() async {
    print("object" + widget.dataList.toString());
    if (_formKey.currentState!.validate()) {
      if (widget.dataList[0]["email"] == _emailController.text &&
          widget.dataList[0]["password"] == _passController.text) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePage(dataList: widget.dataList)));
      }

      return;
    }
  }

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _passController = new TextEditingController();

  bool? passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (input) =>
                    input!.length == 0 ? "Please Enter Email" : null,
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Enter Email',
                ),
              ),
              // TextFormField(obscureText: true,
              //   decoration: InputDecoration(

              //       prefixIcon: Icon(Icons.lock),
              //     labelText: 'Enter Password',
              //   ),
              // ),

              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (input) =>
                    input!.length == 0 ? "Please Enter Password" : null,
                controller: _passController,
                keyboardType: TextInputType.text,
                obscureText:
                    passwordVisible!, //This will obscure text dynamically
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  // Here is key idea
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      passwordVisible!
                          ? Icons.visibility_off
                          : Icons.visibility,

                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        passwordVisible = !passwordVisible!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  _submit();
                },
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),

              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account"),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
