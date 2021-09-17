import 'package:flutter/material.dart';
import 'package:quotes_app/screens/loginScreen/login_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  dynamic dataList = [];
  final GlobalKey<FormState> _formKey = GlobalKey();
  Future _submit() async {
    if (_formKey.currentState!.validate()) {
      var mapList = {
        "name": _nameController.text,
        "email": _emailController.text,
        "password": _passController.text
      };
      dataList!.add(mapList);
      print(dataList);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(dataList: dataList)));
      return;
    }
  }

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();

  TextEditingController _passController = new TextEditingController();

  bool? passwordVisible = false;
  @override
  void initState() {
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (input) =>
                    input!.length == 0 ? "Please Enter Name" : null,
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Enter Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                          ? Icons.visibility
                          : Icons.visibility_off,
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
                    "Register",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
