import 'package:easyshop/view/easyshophome.dart';
import 'package:easyshop/view/easyshopmain2.dart';
import 'package:easyshop/view/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/mycolors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var pwd_visibility = true;
  String username = "admin";
  String password = "abc123";

  var userController = TextEditingController();
  var pwdController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Image.asset("assets/images/easyshop.png",height: 120,),
              const SizedBox(height: 30), // Adding space at the top
              Text("Easy Shop Login ",
                style: GoogleFonts.archivoBlack(
                  fontSize: 30   ,
                  //fontWeight:FontWeight.bold,
                  color:MyColors.basicColor,),
              ),
              const SizedBox(height: 60,),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  Text("Email",style: TextStyle(color: MyColors.basicColor,fontWeight: FontWeight.bold),),
                  TextField(
                    controller: userController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        border: OutlineInputBorder(),
                        // labelText: "Email",
                        hintText: "Enter Your Email"
                    ),),
          
                  const SizedBox(height: 30,),
                  Text("Password",style: TextStyle(color: MyColors.basicColor,fontWeight: FontWeight.bold),),
                  TextFormField(
                    controller: pwdController ,
                    obscureText:pwd_visibility ,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      prefixIcon:const Icon(Icons.password_outlined),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          if(pwd_visibility==true){
                            pwd_visibility=false;
                          }else{
                            pwd_visibility=true;
                          }
                        });
                      }, icon: Icon(
                          pwd_visibility==true? Icons.visibility_off : Icons.visibility
                      )),
                      border: const OutlineInputBorder(),
                      // labelText: "Password",
                      hintText: "Enter Your Password",
                      // helperText: "Password must contain Upper and lowercase letters"
                    ),),
                  const SizedBox(height: 30,),
          
                ],
              ),
              MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
                  // if(username==userController.text && password== pwdController.text){
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage1()));
                  // successSnackbar(context);
                  // }else{
                  // errorSnackbar(context);
                  //  }
                  //userController.clear();
                  // pwdController.clear();
                },
                color: MyColors.basicColor,
                minWidth: 300,
                shape: const StadiumBorder(),
                child: Text("Log in", style: GoogleFonts.sahitya(
                    fontSize: 20,
                    fontWeight:FontWeight.bold,
                    color: Colors.white),),),
          
              // const SizedBox(height: 30),
              const SizedBox(height: 10,),
              const Text("or, Create a new account",style: TextStyle(color: Colors.black54),),
              const SizedBox(height: 10,),
              MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
                },
                color: MyColors.basicColor,
                minWidth: 300,
                shape: const StadiumBorder(),
                child: Text("Sign up", style: GoogleFonts.sahitya(
                    fontSize: 20,
                    fontWeight:FontWeight.bold,
                    color: Colors.white),),
              ),
              const SizedBox(height: 15,),
              // const Text("Login with",style: TextStyle(color: Colors.black54),),
              // const SizedBox(height: 20,),
             /*
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.facebook,color: Colors.blue[700],),
                  const SizedBox(width: 15,),
                  const Icon(FontAwesomeIcons.google,color: Colors.green,),
                  const SizedBox(width: 15,),
                  const Icon(FontAwesomeIcons.twitter,color: Colors.blue,)
                ],
              )
              */
            ],
          ),
        ),
      ),
    );
  }
}
