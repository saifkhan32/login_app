import 'package:animate_do/animate_do.dart';
import 'package:assignment/common/widgets/custom_textfield.dart';
import 'package:assignment/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
enum Auth{
  signUp,
  signIn;
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();

@override
  void dispose()
{
  super.dispose();
  _emailcontroller.dispose();
  _namecontroller.dispose();
  _passwordcontroller.dispose();
}
  @override
  Widget build(BuildContext context) {
        final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body : SafeArea( child : 
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    )),
                  ),
                  Positioned(
                    height: 400,
                    width: width+20,
                    child: FadeInUp(duration: const Duration(milliseconds: 1000), child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background-2.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    )),
                  )
                ],
              ),
            ),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1500), 
                  child: const Text("Welcome", style: TextStyle(color: Color.fromRGBO(49, 39, 79, 1), fontWeight: FontWeight.bold, fontSize: 30),)),
                  const SizedBox(height: 30,),

              ListTile(
                tileColor: _auth == Auth.signUp 
                ? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
                title: const Text('Create Account',
                style : TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.signUp, 
                  groupValue: _auth, 
                  activeColor: const Color.fromRGBO(49, 39, 79, 1),
                  onChanged: (Auth? val){
                  setState(()
                  {
                    _auth = val!;
                  });
                    },),
              ),
              if(_auth == Auth.signUp)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
              child : Form(
                key: _signUpFormKey,
                child:  Column(
                  children: [
                    CustomTextField(controller: _emailcontroller,
                    hintText: 'Email',
                    ),
                    const SizedBox(height: 10,),
                       CustomTextField(controller: _namecontroller,
                    hintText: 'Name',
                    ),
                    const SizedBox(height: 10,),
                       CustomTextField(controller: _passwordcontroller,
                    hintText: 'Password',
                    ),
                    const SizedBox(height: 10,),
                       FadeInUp(duration: const Duration(milliseconds: 1900), 
          child: MaterialButton(
                    onPressed: () {
                         context.pushNamed('home_screen');
                    },
                    color: const Color.fromRGBO(49, 39, 79, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 50,
                    child: const Center(
                      child: Text("Sign Up", style: TextStyle(color: Colors.white),),
                    ),
                  ))
                  ],
                )
              )),
               ListTile(
                 tileColor: _auth == Auth.signIn
                ? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
                title: const Text('Sign In.',
                style : TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.signIn, 
                  groupValue: _auth, 
                  activeColor: const Color.fromRGBO(49, 39, 79, 1),
                  onChanged: (Auth? val){
                  setState(()
                  {
                    _auth = val!;
                  });
                    },),
              ),
               if(_auth == Auth.signIn)
              Container(
                padding: const EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,
              child : Form(
                key: _signInFormKey,
                child:  Column(
                  children: [
                    CustomTextField(controller: _emailcontroller,
                    hintText: 'Email',
                    ),
                    const SizedBox(height: 10,),

                       CustomTextField(controller: _passwordcontroller,
                    hintText: 'Password',
                    ),
                    const SizedBox(height: 10,),
                    FadeInUp(duration: const Duration(milliseconds: 1900), 
     child: MaterialButton(
                    onPressed: () {
                      context.pushNamed('home_screen');
                    },
                    color: const Color.fromRGBO(49, 39, 79, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 50,
                    child: const Center(
                      child: Text("Sign In", style: TextStyle(color: Colors.white),),
                    ),
                  ))
                  ],
                )
              )),
            ],
          ),
        )
     ] )
       )) );
  }
}